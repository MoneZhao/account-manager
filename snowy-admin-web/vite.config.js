import { resolve } from 'path'
import { defineConfig, loadEnv } from 'vite'
import vue from '@vitejs/plugin-vue'
import Components from 'unplugin-vue-components/vite'
import VueJSX from '@vitejs/plugin-vue-jsx'
import AutoImport from 'unplugin-auto-import/vite'
import vueSetupExtend from 'vite-plugin-vue-setup-extend'
import { visualizer } from 'rollup-plugin-visualizer'
import Less2CssVariablePlugin from 'antd-less-to-css-variable'
import viteCompression from 'vite-plugin-compression'

export const r = (...args) => resolve(__dirname, '.', ...args)

const removeModulePreloadPlugin = (keys) => {
  if (!keys || !keys.length) {
    return
  }
  return {
    name: 'remove-module-preload',
    transformIndexHtml: {
      enforce: 'after',
      transform(html, ctx) {
        let result = html
        keys.forEach((key) => {
          result = result.replace(new RegExp(`<link rel="modulepreload"?.*${key}?.*`), '')
        })
        return result
      }
    }
  }
}

export default defineConfig(({ command, mode }) => {
  const envConfig = loadEnv(mode, './')

  const alias = {
    '~': `${resolve(__dirname, './')}`,
    '@/': `${resolve(__dirname, 'src')}/`
  }

  const baseApi = envConfig.VITE_API_BASEURL + '/api'
  const regex = new RegExp('^' + baseApi)
  const proxy = {}
  proxy[baseApi] = {
    target: envConfig.VITE_API_TARGETURL,
    ws: false,
    changeOrigin: true,
    rewrite: (path) => path.replace(regex, '')
  }

  return {
    base: envConfig.VITE_API_BASEURL,
    server: {
      port: envConfig.VITE_PORT,
      proxy: proxy
    },
    resolve: {
      alias
    },
    // 解决警告You are running the esm-bundler build of vue-i18n.
    define: {
      __VUE_I18N_FULL_INSTALL__: true,
      __VUE_I18N_LEGACY_API__: true,
      __VUE_I18N_PROD_DEVTOOLS__: true
    },
    build: {
      sourcemap: false,
      manifest: true,
      brotliSize: false,
      reportCompressedSize: false,
      // minify: "terser", //yarn add terser -D  默认为 Esbuild，它比 terser 快 20-40 倍
      // terserOptions: {
      //   compress: {
      //     drop_console: true,
      //     drop_debugger: true
      //   }
      // },
      rollupOptions: {
        output: {
          manualChunks: {
            echarts: ['echarts'],
            'ant-design-vue': ['ant-design-vue'],
            vue: ['vue', 'vue-router', 'pinia', 'vue-i18n']
          }
        }
      },
      chunkSizeWarningLimit: 1000
    },
    plugins: [
      vue({
        script: {
          refTransform: true
        }
      }),
      viteCompression({
        verbose: false
      }),
      vueSetupExtend(),
      VueJSX(),
      AutoImport({
        imports: ['vue'],
        dirs: ['./src/utils/permission'],
        dts: r('src/auto-imports.d.ts')
      }),
      // 组件按需引入
      Components({
        dirs: [r('src/components')],
        dts: false,
        resolvers: []
      }),
      visualizer()
    ],
    css: {
      preprocessorOptions: {
        less: {
          javascriptEnabled: true,
          plugins: [new Less2CssVariablePlugin()]
        }
      }
    },
    optimizeDeps: {}
  }
})
