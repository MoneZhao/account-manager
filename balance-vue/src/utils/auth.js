import Cookies from 'js-cookie'

const TokenKey = 'balance_token'

export function getToken() {
  return Cookies.get(TokenKey)
}

export function setToken(token) {
  // 前端token有效期为30天
  return Cookies.set(TokenKey, token, { expires: 30 })
}

export function removeToken() {
  return Cookies.remove(TokenKey)
}
