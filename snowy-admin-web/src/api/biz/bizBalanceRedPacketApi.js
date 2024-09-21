import { baseRequest } from '@/utils/request'

const request = (url, ...arg) => baseRequest(`/biz/balanceredpacket/` + url, ...arg)

/**
 * 红包记账Api接口管理器
 *
 * @author monezhao
 * @date  2024/06/21 16:24
 **/
export default {
  // 获取红包记账分页
  bizBalanceRedPacketPage(data) {
    return request('page', data, 'get')
  },
  // 获取红包记账列表
  bizBalanceRedPacketList(data) {
    return request('list', data, 'get')
  },
  // 提交红包记账表单 edit为true时为编辑，默认为新增
  bizBalanceRedPacketSubmitForm(data, edit = false) {
    return request(edit ? 'edit' : 'add', data)
  },
  // 删除红包记账
  bizBalanceRedPacketDelete(data) {
    return request('delete', data)
  },
  // 获取红包记账详情
  bizBalanceRedPacketDetail(data) {
    return request('detail', data, 'get')
  }
}
