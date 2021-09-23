<template>
  <div class="login-container">
    <vue-particles
      color="#409EFF"
      :particle-opacity="0.7"
      :particles-number="80"
      shape-type="circle"
      :particle-size="4"
      lines-color="#409EFF"
      :lines-width="1"
      :line-linked="true"
      :line-opacity="0.4"
      :lines-distance="150"
      :move-speed="3"
      :hover-effect="true"
      hover-mode="grab"
      :click-effect="true"
      click-mode="push"
    />
    <el-form
      ref="loginForm"
      size="medium"
      :model="loginForm"
      :rules="loginRules"
      class="login-form"
      auto-complete="on"
      label-position="left"
    >

      <div class="login-border">
        <div class="title-container">
          <h3 class="title">系统登录</h3>
        </div>

        <el-form-item prop="userId">
          <span class="svg-container">
            <svg-icon icon-class="user" />
          </span>
          <el-input
            ref="userId"
            v-model="loginForm.userId"
            size="medium"
            placeholder="用户名"
            name="userId"
            type="text"
            tabindex="1"
            auto-complete="on"
          />
        </el-form-item>

        <el-form-item prop="password">
          <span class="svg-container">
            <svg-icon icon-class="password" />
          </span>
          <el-input
            ref="password"
            v-model="loginForm.password"
            size="medium"
            type="password"
            placeholder="密码"
            name="password"
            tabindex="2"
            auto-complete="on"
            show-password
            @keyup.enter.native="handleLogin"
          />
        </el-form-item>

        <el-form-item v-if="useCaptcha">
          <span class="svg-container">
            <svg-icon icon-class="code" />
          </span>
          <el-input
            v-model="loginForm.captcha"
            size="medium"
            placeholder="验证码"
            style="width: 200px"
            @keyup.enter.native="handleLogin"
          />
          <span class="show-captcha">
            <img :src="captchaPath" alt="点击刷新图片" @click="getCaptcha">
          </span>
        </el-form-item>

        <el-row style="width: 100%">
          <el-col :span="12">
            <el-button
              size="medium"
              type="primary"
              style="width:60%;margin-left:20%"
              @click.native.prevent="reset"
            >重 置
            </el-button>
          </el-col>
          <el-col :span="12">
            <el-button
              size="medium"
              :loading="loading"
              type="primary"
              style="width:60%;margin-left:20%"
              @click.native.prevent="handleLogin"
            >登录
            </el-button>
          </el-col>
        </el-row>
      </div>
    </el-form>
  </div>
</template>

<script>
import { md5, getUUID } from '@/utils'
import { getAction } from '@/api/manage'

export default {
  name: 'Login',
  data() {
    const validateUserId = (rule, value, callback) => {
      if (value.length === 0) {
        callback(new Error('请输入用户名'))
      } else {
        callback()
      }
    }
    const validatePassword = (rule, value, callback) => {
      if (value.length === 0) {
        callback(new Error('请输入密码'))
      } else {
        callback()
      }
    }
    return {
      captchaPath: '',
      useCaptcha: false,
      loginForm: {
        userId: '',
        password: '',
        uuid: '',
        captcha: ''
      },
      loginRules: {
        userId: [{ required: true, trigger: 'blur', validator: validateUserId }],
        password: [{ required: true, trigger: 'blur', validator: validatePassword }]
      },
      loading: false,
      redirect: undefined
    }
  },
  watch: {
    $route: {
      handler: function(route) {
        this.redirect = route.query && route.query.redirect
      },
      immediate: true
    }
  },
  created() {
    getAction('/sys/useCaptcha').then(res => {
      const { msg } = res
      console.log(msg)
      if (msg === '0') {
        this.useCaptcha = true
        this.getCaptcha()
      }
    })
  },
  methods: {
    handleLogin() {
      const loginParams = {
        ...this.loginForm,
        userId: this.loginForm.userId.trim(),
        password: md5(this.loginForm.password.trim())
      }
      this.$refs.loginForm.validate(valid => {
        if (valid) {
          this.loading = true
          this.$store.dispatch('user/login', loginParams).then(() => {
            this.$store.dispatch('tagsView/delAllViews').then(() => {
              this.$router.push({ path: this.redirect || '/' })
              // this.$router.push({path: '/'})
              this.loading = false
            })
          }).catch(() => {
            this.loading = false
          })
        } else {
          return false
        }
      })
    },
    reset() {
      this.$refs.loginForm.resetFields()
    },
    getCaptcha() {
      this.loginForm.uuid = getUUID()
      this.captchaPath = `${process.env.VUE_APP_BASE_API}/sys/captcha.jpg?uuid=${this.loginForm.uuid}`
    }
  }
}
</script>

<style lang="scss">
    /* 修复input 背景不协调 和光标变色 */
    /* Detail see https://github.com/PanJiaChen/vue-element-admin/pull/927 */

    $bg: #283443;
    $dark: #191930;
    $cursor: #2b2b2e;

    @supports (-webkit-mask: none) and (not (cater-color: $cursor)) {
        .login-container .el-input input {
            color: $cursor;
        }
    }

    /* reset element-ui css */
    .login-container {
        .el-input {
            display: inline-block;
            height: 47px;
            width: 85%;

            input {
                background: transparent;
                border: 0px;
                -webkit-appearance: none;
                border-radius: 0px;
                padding: 12px 5px 12px 15px;
                color: $dark;
                height: 47px;
                caret-color: $cursor;

                &:-webkit-autofill {
                    box-shadow: 0 0 0px 1000px $bg inset !important;
                    -webkit-text-fill-color: $cursor !important;
                }
            }
        }

        .el-form-item {
            border: 1px solid rgba(255, 255, 255, 0.1);
            background: rgba(150, 150, 150, 0.1);
            border-radius: 5px;
            color: #454545;
        }
    }
</style>

<style lang="scss" scoped>
    $bg: #2d3a4b;
    $dark: #191930;
    #particles-js{
      width: 100%;
      height: calc(100% - 100px);
      position: absolute;
    }
    .login-container {
        min-height: 100%;
        width: 100%;
        background-color: $bg;
        overflow: hidden;

        .login-form {
            position: relative;
            width: 520px;
            max-width: 100%;
            padding: 13% 35px 0;
            margin: 0 auto;
            overflow: hidden;

            .login-border {
              -webkit-border-radius: 5px;
              border-radius: 5px;
              -moz-border-radius: 5px;
              background-clip: padding-box;
              // margin: 180px auto;
              // width: 350px;
              padding: 35px 35px 35px 35px;
              background: rgb(250, 250, 250);
              border: 1px solid rgb(230, 230, 230);
              box-shadow: 0 0 25px rgb(200, 200, 200);
            }
        }

        .tips {
            font-size: 14px;
            color: #fff;
            margin-bottom: 10px;

            span {
                &:first-of-type {
                    margin-right: 16px;
                }
            }
        }

        .svg-container {
            padding: 6px 5px 6px 15px;
            color: $dark;
            vertical-align: middle;
            width: 30px;
            display: inline-block;
        }

        .title-container {
            position: relative;

            .title {
                font-size: 26px;
                color: $dark;
                margin: 0px auto 40px auto;
                text-align: center;
                font-weight: bold;
            }
        }

        .show-pwd {
            position: absolute;
            right: 10px;
            top: 7px;
            font-size: 16px;
            color: $dark;
            cursor: pointer;
            user-select: none;
        }

        .show-captcha {
          position: absolute;
          top: 5px;
          right: 1px;
          font-size: 16px;
          color: $dark;
          cursor: pointer;
          user-select: none;
        }
    }
</style>
