import { baseRequest } from '@/utils/request'

const request = (url, ...arg) => baseRequest(`/biz/statement/` + url, ...arg)

/**
 * 报表管理Api接口管理器
 *
 * @author monezhao
 * @date  2023/12/25 16:56
 **/
export default {
  // 获取账户余额分页
  listStatement(data) {
    return request('detail/listStatement', data, 'post')
  },
  // 获取账户余额分页
  queryDetail(data) {
    return request('detail/query', data, 'post')
  },
  // 获取账户余额分页
  query(data) {
    return request('query', data, 'post')
  }
}
