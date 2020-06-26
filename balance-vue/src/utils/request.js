import axios from 'axios'
import { MessageBox, Message, Loading } from 'element-ui'
import store from '@/store'
import { getToken } from '@/utils/auth'

const service = axios.create({
  baseURL: process.env.VUE_APP_BASE_API, // url = base url + request url
  withCredentials: true, // send cookies when cross-domain requests
  responseType: 'json',
  validateStatus(status) {
    // 200 外的状态码都认定为失败
    return status === 200
  },
  timeout: 6000 // request timeout
})

service.interceptors.request.use(
  config => {
    // Loading.service({ text: 'Loading...' })
    if (store.getters.token) {
      config.headers['token'] = getToken()
    }
    return config
  },
  error => {
    Message.error('请求超时!')
    return Promise.reject(error)
  }
)

service.interceptors.response.use(
  response => {
    // Loading.service().close()
    const res = response.data

    if (res && res.code && res.code !== 200) {
      if (res.code === 801 || res.code === 802 || res.code === 803) {
        MessageBox.confirm('登录超时，请重新登录', '提示', {
          confirmButtonText: '重新登录',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          store.dispatch('user/resetToken').then(() => {
            location.reload()
          })
        })
      } else {
        Message.error(res.msg || 'error')
      }
      return Promise.reject(res.msg || 'error')
    } else {
      // 打印后台返回数据，用于mock数据
      // let uri = response.config.url.replace(response.config.baseURL,'')
      // let log = '{url:"' + uri + '",type:"' + response.config.method + '",response: config => {return '+ JSON.stringify(res) +'}},'
      return res
    }
  },
  error => {
    // Loading.service().close()
    Message.error(error.message)
    return Promise.reject(error)
  }
)

export default service
