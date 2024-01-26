import { baseRequest } from '@/utils/request'

const request = (url, ...arg) => baseRequest(`/biz/travelexpense/` + url, ...arg)

/**
 * 出差报销Api接口管理器
 *
 * @author monezhao
 * @date  2023/12/23 19:25
 **/
export default {
  // 获取出差报销分页
  bizTravelExpensePage(data) {
    return request('page', data, 'get')
  },
  // 获取出差报销列表
  bizTravelExpenseList(data) {
    return request('list', data, 'get')
  },
  // 提交出差报销表单 edit为true时为编辑，默认为新增
  bizTravelExpenseSubmitForm(data, edit = false) {
    return request(edit ? 'edit' : 'add', data)
  },
  // 删除出差报销
  bizTravelExpenseDelete(data) {
    return request('delete', data)
  },
  // 获取出差报销详情
  bizTravelExpenseDetail(data) {
    return request('detail', data, 'get')
  },
  // 出差报销文件上传
  bizTravelExpenseImport(data) {
    return request('import', data, 'post')
  },
  // 导出全部出差报销
  bizTravelExpenseExport(data) {
    return request('export', data, 'post', {
      responseType: 'blob'
    })
  }
}
