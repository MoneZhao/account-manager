import { baseRequest } from '@/utils/request'

const request = (url, ...arg) => baseRequest(`/biz/balancemain/` + url, ...arg)

/**
 * 账户余额Api接口管理器
 *
 * @author monezhao
 * @date  2023/12/25 16:56
 **/
export default {
  // 获取账户余额分页
  bizBalanceMainPage(data) {
    return request('page', data, 'get')
  },
  // 获取账户余额回收站分页
  bizBalanceMainPageDelete(data) {
    return request('pageDelete', data, 'get')
  },
  // 获取账户余额列表
  bizBalanceMainList(data) {
    return request('list', data, 'get')
  },
  // 提交账户余额表单 edit为true时为编辑，默认为新增
  bizBalanceMainSubmitForm(data, edit = false) {
    return request(edit ? 'edit' : 'add', data)
  },
  // 删除账户余额
  bizBalanceMainDelete(data) {
    return request('delete', data)
  },
  // 获取账户余额详情
  bizBalanceMainDetail(data) {
    return request('detail', data, 'get')
  },
  // 账户余额复制
  bizBalanceMainCopy(data) {
    return request('copy', data)
  },
  // 更新全部账户余额
  bizBalanceMainFixBatch(data) {
    return request('fixBatch', data)
  },
  // 更新全部账户余额
  bizBalanceMainRestore(data) {
    return request('restore', data, 'get')
  },
  // 账户余额对比
  bizBalanceMainCompare(data) {
    return request('compare', data, 'post')
  },
  // 账户详情对比
  bizBalanceMainCompareDetail(data) {
    return request('compareDetail', data, 'post')
  }
}
