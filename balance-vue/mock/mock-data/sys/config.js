export default [
  {
    url: '/sys/config/list', type: 'get', response: config => {
      return {
        'code': 200,
        'msg': '操作成功',
        'data': {
          'records': [{
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'configId': 'defaultPassword',
            'configName': '新建用户默认密码',
            'configValue': '1',
            'sortNo': 1,
            'remark': ''
          }], 'total': 1, 'size': 10, 'current': 1, 'searchCount': true, 'pages': 1
        }
      }
    }
  },
  {
    url: '/sys/config/save', type: 'post', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/config/update', type: 'put', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/config/delete', type: 'delete', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  }
]
