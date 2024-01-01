import { baseRequest } from '@/utils/request'

const request = (url, ...arg) => baseRequest(`/biz/balancecount/` + url, ...arg)

/**
 * 计入总资产Api接口管理器
 *
 * @author monezhao
 * @date  2023/12/23 21:12
 **/
export default {
  // 获取计入总资产分页
  bizBalanceCountPage(data) {
    return request('page', data, 'get')
  },
  // 获取计入总资产列表
  bizBalanceCountList(data) {
    return request('list', data, 'get')
  },
  // 提交计入总资产表单 edit为true时为编辑，默认为新增
  bizBalanceCountSubmitForm(data, edit = false) {
    return request(edit ? 'edit' : 'add', data)
  },
  // 删除计入总资产
  bizBalanceCountDelete(data) {
    return request('delete', data)
  },
  // 获取计入总资产详情
  bizBalanceCountDetail(data) {
    return request('detail', data, 'get')
  }
}
