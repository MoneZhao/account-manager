export default [
  {
    url: '/sys/func/list', type: 'get', response: config => {
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
            'funcId': 'sysConfig-1',
            'funcName': '新增',
            'menuId': 'sysConfig',
            'funcPermissions': 'sys:config:save',
            'remark': '',
            'sortNo': 1
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'funcId': 'sysConfig-2',
            'funcName': '修改',
            'menuId': 'sysConfig',
            'funcPermissions': 'sys:config:update',
            'remark': '',
            'sortNo': 2
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'funcId': 'sysConfig-3',
            'funcName': '删除',
            'menuId': 'sysConfig',
            'funcPermissions': 'sys:config:delete',
            'remark': '',
            'sortNo': 3
          }], 'total': 3, 'size': 10, 'current': 1, 'searchCount': true, 'pages': 1
        }
      }
    }
  },
  {
    url: '/sys/func/save', type: 'post', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/func/update', type: 'put', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/func/delete', type: 'delete', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  }
]
