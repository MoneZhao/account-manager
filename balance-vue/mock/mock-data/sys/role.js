export default [
  {
    url: '/sys/role/list', type: 'get', response: config => {
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
            'roleId': 'admin',
            'roleName': 'admin',
            'sortNo': 1,
            'remark': '超级管理员'
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'roleId': 'queryRole',
            'roleName': '查询角色',
            'sortNo': 2,
            'remark': '查询角色'
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'roleId': 'managerRole',
            'roleName': '管理角色',
            'sortNo': 3,
            'remark': '管理角色'
          }], 'total': 3, 'size': 10, 'current': 1, 'searchCount': true, 'pages': 1
        }
      }
    }
  },
  {
    url: '/sys/role/save', type: 'post', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/role/update', type: 'put', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/role/getRolePermissions', type: 'get', response: config => {
      return {
        'code': 200, 'msg': '操作成功', 'data': {
          'permissionTree': [{
            'id': 'sys',
            'label': '系统管理',
            'parentId': null,
            'disabled': null,
            'isLeaf': null,
            'data': {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'rolePermissionId': null,
              'roleId': null,
              'permissionType': '1',
              'menuOrFuncId': 'sys',
              'menuOrFuncName': '系统管理'
            },
            'children': [{
              'id': 'sysConfig',
              'label': '参数管理',
              'parentId': 'sys',
              'disabled': null,
              'isLeaf': false,
              'data': {
                'createBy': null,
                'createDate': null,
                'createTime': null,
                'updateBy': null,
                'updateDate': null,
                'updateTime': null,
                'rolePermissionId': null,
                'roleId': null,
                'permissionType': '1',
                'menuOrFuncId': 'sysConfig',
                'menuOrFuncName': '参数管理'
              },
              'children': [{
                'id': 'sysConfig-1',
                'label': '新增',
                'parentId': null,
                'disabled': null,
                'isLeaf': true,
                'data': {
                  'createBy': null,
                  'createDate': null,
                  'createTime': null,
                  'updateBy': null,
                  'updateDate': null,
                  'updateTime': null,
                  'rolePermissionId': null,
                  'roleId': null,
                  'permissionType': '2',
                  'menuOrFuncId': 'sysConfig-1',
                  'menuOrFuncName': '新增'
                },
                'children': null
              }, {
                'id': 'sysConfig-2',
                'label': '修改',
                'parentId': null,
                'disabled': null,
                'isLeaf': true,
                'data': {
                  'createBy': null,
                  'createDate': null,
                  'createTime': null,
                  'updateBy': null,
                  'updateDate': null,
                  'updateTime': null,
                  'rolePermissionId': null,
                  'roleId': null,
                  'permissionType': '2',
                  'menuOrFuncId': 'sysConfig-2',
                  'menuOrFuncName': '修改'
                },
                'children': null
              }, {
                'id': 'sysConfig-3',
                'label': '删除',
                'parentId': null,
                'disabled': null,
                'isLeaf': true,
                'data': {
                  'createBy': null,
                  'createDate': null,
                  'createTime': null,
                  'updateBy': null,
                  'updateDate': null,
                  'updateTime': null,
                  'rolePermissionId': null,
                  'roleId': null,
                  'permissionType': '2',
                  'menuOrFuncId': 'sysConfig-3',
                  'menuOrFuncName': '删除'
                },
                'children': null
              }]
            }]
          }], 'permissions': []
        }
      }
    }
  },
  {
    url: '/sys/role/saveRolePermissions', type: 'post', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/role/getRoleUser', type: 'get', response: config => {
      return {
        'code': 200,
        'msg': '操作成功',
        'data': { 'records': [], 'total': 0, 'size': 10, 'current': 1, 'searchCount': true, 'pages': 0 }
      }
    }
  },
  {
    url: '/sys/role/saveRoleUsers', type: 'post', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/role/deleteRoleUsers', type: 'delete', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/role/delete', type: 'delete', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/role/listAll', type: 'get', response: config => {
      return {
        'code': 200,
        'msg': '操作成功',
        'data': [{
          'createBy': null,
          'createDate': null,
          'createTime': null,
          'updateBy': 'admin',
          'updateDate': '2019-09-15',
          'updateTime': '2019-09-15 16:52:45',
          'roleId': 'admin',
          'roleName': 'admin',
          'sortNo': 1,
          'remark': '超级管理员'
        }, {
          'createBy': 'admin',
          'createDate': '2019-09-07',
          'createTime': '2019-09-07 21:10:19',
          'updateBy': 'admin',
          'updateDate': '2019-09-15',
          'updateTime': '2019-09-15 18:15:52',
          'roleId': 'queryRole',
          'roleName': '查询角色',
          'sortNo': 2,
          'remark': '查询角色'
        }, {
          'createBy': 'admin',
          'createDate': '2019-09-15',
          'createTime': '2019-09-15 18:15:46',
          'updateBy': 'admin',
          'updateDate': '2019-09-15',
          'updateTime': '2019-09-15 17:07:14',
          'roleId': 'managerRole',
          'roleName': '管理角色',
          'sortNo': 3,
          'remark': '管理角色'
        }]
      }
    }
  }
]
