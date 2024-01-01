import { baseRequest } from '@/utils/request'

const request = (url, ...arg) => baseRequest(`/biz/balancedetail/` + url, ...arg)

/**
 * 账户明细Api接口管理器
 *
 * @author monezhao
 * @date  2023/12/25 16:57
 **/
export default {
  // 获取账户明细分页
  bizBalanceDetailPage(data) {
    return request('page', data, 'get')
  },
  // 获取账户明细列表
  bizBalanceDetailList(data) {
    return request('list', data, 'get')
  },
  // 提交账户明细表单 edit为true时为编辑，默认为新增
  bizBalanceDetailSubmitForm(data, edit = false) {
    return request(edit ? 'edit' : 'add', data)
  },
  // 删除账户明细
  bizBalanceDetailDelete(data) {
    return request('delete', data)
  },
  // 获取账户明细详情
  bizBalanceDetailDetail(data) {
    return request('detail', data, 'get')
  }
}
