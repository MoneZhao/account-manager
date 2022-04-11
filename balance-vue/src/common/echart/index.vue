<template>
  <div :id="id" :class="className" :style="{ height: height, width: width }" />
</template>

<script>
import echartMixins from '@/utils/resizeMixins'

export default {
  name: 'Echart',
  mixins: [echartMixins],
  props: {
    className: {
      type: String,
      default: 'chart'
    },
    id: {
      type: String,
      default: 'chart'
    },
    width: {
      type: String,
      default: '100%'
    },
    height: {
      type: String,
      default: '2.5rem'
    },
    options: {
      type: Object,
      default: () => ({})
    }
  },
  data() {
    return {
      chart: null
    }
  },
  watch: {
    options: {
      handler(options) {
        // console.log(this.chart)
        // 设置true清空echart缓存
        if (this.chart !== null) {
          this.chart.setOption(options, true)
        }
      },
      deep: true
    }
  },
  mounted() {
    this.$nextTick(() => {
      this.initChart()
    })
  },
  methods: {
    initChart() {
      // 初始化echart
      this.chart = this.$echarts.init(this.$el)
      this.chart.setOption(this.options, true)
    }
  }
}
</script>

<style>
</style>
