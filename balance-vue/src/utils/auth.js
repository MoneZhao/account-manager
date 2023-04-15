import Cookies from 'js-cookie'

const TokenKey = 'balance_token'

const ExpireKey = 'expire_time'

export function setExpireTime(time) {
  return Cookies.set(ExpireKey, time)
}

export function getToken() {
  return Cookies.get(TokenKey)
}

export function setToken(token) {
  // 未返回过期时间时，token有效期为会话
  const expires = Cookies.get(ExpireKey) == 'null' ? undefined : new Date(new Date() * 1 + Cookies.get(ExpireKey) * 1000)
  return Cookies.set(TokenKey, token, { expires: expires })
}

export function removeToken() {
  return Cookies.remove(TokenKey)
}
