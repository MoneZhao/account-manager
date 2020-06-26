export default [
  {
    url: '/sys/login', type: 'post', response: config => {
      return {
        'code': 200,
        'msg': '操作成功',
        'data': { 'token': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkYXRlIjoxNTY5NjcyMTQxLCJ1c2VySWQiOiJhZG1pbiJ9.EgQSnMzslbHa_fgN2mVy_n6FUGjzJnWlsx6FUIhCb20' }
      }
    }
  },
  {
    url: '/sys/logout', type: 'post', response: config => {
      return {
        'code': 200,
        'msg': '操作成功'
      }
    }
  },
  {
    url: '/sys/user/getUserInfo', type: 'get', response: config => {
      return {
        'code': 200, 'msg': '操作成功', 'data': {
          'token': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkYXRlIjoxNTkxODU4MzY3LCJ1c2VySWQiOiJtb25lemhhbyJ9.2nirLUcL3dKifrNPZbIdsxQK6CTumZ-7xF_J0Kr_kzc',
          'sysUser': {
            'createBy': 'admin',
            'createDate': '2020-05-28',
            'createTime': '2020-05-28 09:00:42',
            'updateBy': 'admin',
            'updateDate': '2020-06-08',
            'updateTime': '2020-06-08 06:52:39',
            'userId': 'monezhao',
            'userName': '赵一鸣',
            'sex': '1',
            'roleId': 'queryRole',
            'orgId': '1000000000',
            'mobile': 'xx',
            'idCardNo': 'xx',
            'email': 'xx',
            'status': '1',
            'sortNo': 2,
            'remark': '',
            'orgName': null,
            'authFilterSql': null
          },
          'sysOrg': {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': 'admin',
            'updateDate': '2020-05-28',
            'updateTime': '2020-05-28 03:12:44',
            'orgId': '1000000000',
            'orgName': '总部',
            'parentOrgId': '',
            'shortName': '总部',
            'orgType': '1',
            'orgLevel': '1',
            'orgLevelCode': '1000000000',
            'remark': '',
            'isLeaf': '0',
            'parentOrgName': null,
            'authFilterSql': null
          },
          'sysRole': {
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
          },
          'sysRoles': [{
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
          }],
          'routes': [{
            'routeId': 'balance',
            'path': '/balance',
            'component': '',
            'redirect': '',
            'hidden': false,
            'name': 'balance',
            'routeParentId': null,
            'meta': { 'title': '账户余额', 'icon': 'tree', 'isCache': true, 'affix': false },
            'children': [{
              'routeId': 'sysBalanceMain',
              'path': 'balanceMain',
              'component': 'views/sys/balanceMain/index',
              'redirect': null,
              'hidden': false,
              'name': 'SysBalanceMain',
              'routeParentId': 'balance',
              'meta': { 'title': '余额列表', 'icon': 'list', 'isCache': true, 'affix': false },
              'children': null
            }]
          }],
          'funcIds': ['sysBalanceMain-1', 'sysBalanceMain-2', 'sysBalanceMain-3'],
          'permissions': ['sys:balanceMain:delete', 'sys:balanceMain:update', 'sys:balanceMain:save', 'sys:balanceMain:list'],
          'loginTime': 1591858367465,
          'ipAddr': '127.0.0.1'
        }
      }
    }
  },
  {
    url: '/sys/codeInfo/getSysCodeInfos', type: 'get', response: config => {
      return {
        'code': 200, 'msg': '操作成功', 'data': {
          'logType': [{
            'createBy': 'user2',
            'createDate': '2019-09-03',
            'createTime': '2019-09-03 00:52:34',
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeInfoId': 'logType-1',
            'codeTypeId': 'logType',
            'value': '1',
            'content': '登录日志',
            'parentValue': '',
            'sortNo': 1,
            'remark': '',
            'isOk': '1'
          }, {
            'createBy': 'user2',
            'createDate': '2019-09-03',
            'createTime': '2019-09-03 00:52:56',
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeInfoId': 'logType-2',
            'codeTypeId': 'logType',
            'value': '2',
            'content': '操作日志',
            'parentValue': '',
            'sortNo': 2,
            'remark': '',
            'isOk': '1'
          }, {
            'createBy': 'user2',
            'createDate': '2019-09-03',
            'createTime': '2019-09-03 00:52:09',
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeInfoId': 'logType-3',
            'codeTypeId': 'logType',
            'value': '3',
            'content': '定时任务',
            'parentValue': '',
            'sortNo': 3,
            'remark': '',
            'isOk': '1'
          }],
          'userSex': [{
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeInfoId': 'userSex-1',
            'codeTypeId': 'userSex',
            'value': '1',
            'content': '男',
            'parentValue': '',
            'sortNo': 1,
            'remark': '',
            'isOk': '1'
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeInfoId': 'userSex-2',
            'codeTypeId': 'userSex',
            'value': '2',
            'content': '女',
            'parentValue': '',
            'sortNo': 2,
            'remark': '',
            'isOk': '1'
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeInfoId': 'userSex-3',
            'codeTypeId': 'userSex',
            'value': '3',
            'content': '未知',
            'parentValue': '',
            'sortNo': 3,
            'remark': '',
            'isOk': '1'
          }],
          'orgType': [{
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeInfoId': 'orgType-1',
            'codeTypeId': 'orgType',
            'value': '1',
            'content': '普通机构',
            'parentValue': null,
            'sortNo': 1,
            'remark': null,
            'isOk': '1'
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeInfoId': 'orgType-2',
            'codeTypeId': 'orgType',
            'value': '2',
            'content': '部门',
            'parentValue': '',
            'sortNo': 2,
            'remark': '',
            'isOk': '1'
          }],
          'userStatus': [{
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeInfoId': 'userStatus-1',
            'codeTypeId': 'userStatus',
            'value': '1',
            'content': '在职',
            'parentValue': '',
            'sortNo': 1,
            'remark': '',
            'isOk': '1'
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeInfoId': 'userStatus-2',
            'codeTypeId': 'userStatus',
            'value': '2',
            'content': '离职',
            'parentValue': '',
            'sortNo': 2,
            'remark': '',
            'isOk': '1'
          }],
          'sourceStrategy': [{
            'createBy': 'admin',
            'createDate': '2019-09-01',
            'createTime': '2019-09-01 13:58:04',
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeInfoId': 'sourceStrategy-1',
            'codeTypeId': 'sourceStrategy',
            'value': '1',
            'content': '用户录入',
            'parentValue': '',
            'sortNo': 1,
            'remark': '',
            'isOk': '1'
          }, {
            'createBy': 'admin',
            'createDate': '2019-09-01',
            'createTime': '2019-09-01 11:40:19',
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeInfoId': 'sourceStrategy-2',
            'codeTypeId': 'sourceStrategy',
            'value': '2',
            'content': '系统提供',
            'parentValue': '',
            'sortNo': 2,
            'remark': '',
            'isOk': '1'
          }],
          'entityType': [{
            'createBy': 'admin',
            'createDate': '2019-09-01',
            'createTime': '2019-09-01 11:40:55',
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeInfoId': 'entityType-1',
            'codeTypeId': 'entityType',
            'value': '1',
            'content': '角色',
            'parentValue': '',
            'sortNo': 1,
            'remark': '',
            'isOk': '1'
          }, {
            'createBy': 'admin',
            'createDate': '2019-09-01',
            'createTime': '2019-09-01 11:41:12',
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeInfoId': 'entityType-2',
            'codeTypeId': 'entityType',
            'value': '2',
            'content': '用户',
            'parentValue': '',
            'sortNo': 2,
            'remark': '',
            'isOk': '1'
          }],
          'orgLevel': [{
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeInfoId': 'orgLevel-1',
            'codeTypeId': 'orgLevel',
            'value': '1',
            'content': '一级',
            'parentValue': null,
            'sortNo': 1,
            'remark': null,
            'isOk': '1'
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeInfoId': 'orgLevel-2',
            'codeTypeId': 'orgLevel',
            'value': '2',
            'content': '二级',
            'parentValue': '',
            'sortNo': 2,
            'remark': '',
            'isOk': '1'
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeInfoId': 'orgLevel-3',
            'codeTypeId': 'orgLevel',
            'value': '3',
            'content': '三级',
            'parentValue': '',
            'sortNo': 3,
            'remark': '',
            'isOk': '1'
          }, {
            'createBy': 'admin',
            'createDate': '2019-09-07',
            'createTime': '2019-09-07 21:09:18',
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeInfoId': 'orgLevel-4',
            'codeTypeId': 'orgLevel',
            'value': '4',
            'content': '四级',
            'parentValue': '',
            'sortNo': 4,
            'remark': '',
            'isOk': '1'
          }],
          'yesOrNo': [{
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeInfoId': 'yesOrNo-1',
            'codeTypeId': 'yesOrNo',
            'value': '1',
            'content': '是',
            'parentValue': '',
            'sortNo': 1,
            'remark': '',
            'isOk': ''
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeInfoId': 'yesOrNo-0',
            'codeTypeId': 'yesOrNo',
            'value': '0',
            'content': '否',
            'parentValue': '',
            'sortNo': 2,
            'remark': '',
            'isOk': ''
          }]
        }
      }
    }
  },
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
  },
  {
    url: '/sys/codeType/list', type: 'get', response: config => {
      return {
        'code': 200, 'msg': '操作成功', 'data': {
          'records': [{
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeTypeId': 'yesOrNo',
            'codeTypeName': '是否',
            'sortNo': 1,
            'remark': null
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeTypeId': 'userSex',
            'codeTypeName': '用户性别',
            'sortNo': 2,
            'remark': ''
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeTypeId': 'orgLevel',
            'codeTypeName': '机构级别',
            'sortNo': 3,
            'remark': null
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeTypeId': 'orgType',
            'codeTypeName': '机构类型',
            'sortNo': 4,
            'remark': null
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeTypeId': 'entityType',
            'codeTypeName': '实体类型',
            'sortNo': 5,
            'remark': ''
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeTypeId': 'sourceStrategy',
            'codeTypeName': '数据源策略',
            'sortNo': 6,
            'remark': ''
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeTypeId': 'logType',
            'codeTypeName': '日志类型',
            'sortNo': 7,
            'remark': ''
          }], 'total': 7, 'size': 10, 'current': 1, 'searchCount': true, 'pages': 1
        }
      }
    }
  },
  {
    url: '/sys/codeType/save', type: 'post', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/codeType/update', type: 'put', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/codeType/delete', type: 'delete', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/codeInfo/list', type: 'get', response: config => {
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
            'codeInfoId': 'yesOrNo-1',
            'codeTypeId': 'yesOrNo',
            'value': '1',
            'content': '是',
            'parentValue': '',
            'sortNo': 1,
            'remark': '',
            'isOk': ''
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'codeInfoId': 'yesOrNo-0',
            'codeTypeId': 'yesOrNo',
            'value': '0',
            'content': '否',
            'parentValue': '',
            'sortNo': 2,
            'remark': '',
            'isOk': ''
          }], 'total': 2, 'size': 10, 'current': 1, 'searchCount': true, 'pages': 1
        }
      }
    }
  },
  {
    url: '/sys/codeInfo/save', type: 'post', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/codeInfo/update', type: 'put', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/codeInfo/delete', type: 'delete', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/menu/getTreeData', type: 'get', response: config => {
      return {
        'code': 200, 'msg': '操作成功', 'data': [{
          'id': 'sys',
          'label': '系统管理',
          'parentId': null,
          'disabled': null,
          'isLeaf': false,
          'data': {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'menuId': 'sys',
            'menuName': '系统管理',
            'parentMenuId': '',
            'menuIcon': 'tools',
            'menuUrl': '/sys',
            'menuPermissions': null,
            'component': '',
            'redirect': '',
            'hidden': '0',
            'isRoute': '1',
            'routeName': 'Sys',
            'isCache': '1',
            'affix': '0',
            'isLeaf': '0',
            'sortNo': 10000,
            'parentMenuName': null
          },
          'children': [{
            'id': 'sysConfig',
            'label': '参数管理',
            'parentId': 'sys',
            'disabled': null,
            'isLeaf': true,
            'data': {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'menuId': 'sysConfig',
              'menuName': '参数管理',
              'parentMenuId': 'sys',
              'menuIcon': 'list',
              'menuUrl': 'config',
              'menuPermissions': 'sys:config:list,sys:config:listByQw',
              'component': 'views/sys/config/index',
              'redirect': null,
              'hidden': '0',
              'isRoute': '1',
              'routeName': 'SysConfig',
              'isCache': '1',
              'affix': '0',
              'isLeaf': '1',
              'sortNo': 10100,
              'parentMenuName': '系统管理'
            },
            'children': null
          }, {
            'id': 'sysCodeType',
            'label': '代码类别',
            'parentId': 'sys',
            'disabled': null,
            'isLeaf': true,
            'data': {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'menuId': 'sysCodeType',
              'menuName': '代码类别',
              'parentMenuId': 'sys',
              'menuIcon': 'list',
              'menuUrl': 'codeType',
              'menuPermissions': 'sys:codeType:list,sys:codeType:listByQw',
              'component': 'views/sys/codeType/index',
              'redirect': null,
              'hidden': '0',
              'isRoute': '1',
              'routeName': 'SysCodeType',
              'isCache': '1',
              'affix': '0',
              'isLeaf': '1',
              'sortNo': 10200,
              'parentMenuName': '系统管理'
            },
            'children': null
          }, {
            'id': 'sysCodeInfo',
            'label': '代码信息',
            'parentId': 'sys',
            'disabled': null,
            'isLeaf': true,
            'data': {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'menuId': 'sysCodeInfo',
              'menuName': '代码信息',
              'parentMenuId': 'sys',
              'menuIcon': 'list',
              'menuUrl': 'codeInfo',
              'menuPermissions': 'sys:codeType:list,sys:codeInfo:list,sys:codeInfo:listByQw',
              'component': 'views/sys/codeInfo/index',
              'redirect': null,
              'hidden': '0',
              'isRoute': '1',
              'routeName': 'SysCodeInfo',
              'isCache': '1',
              'affix': '0',
              'isLeaf': '1',
              'sortNo': 10300,
              'parentMenuName': '系统管理'
            },
            'children': null
          }, {
            'id': 'sysMenu',
            'label': '菜单管理',
            'parentId': 'sys',
            'disabled': null,
            'isLeaf': true,
            'data': {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'menuId': 'sysMenu',
              'menuName': '菜单管理',
              'parentMenuId': 'sys',
              'menuIcon': 'tree',
              'menuUrl': 'menu',
              'menuPermissions': 'sys:menu:list,sys:menu:listByQw,sys:menu:getTreeData',
              'component': 'views/sys/menu/index',
              'redirect': null,
              'hidden': '0',
              'isRoute': '1',
              'routeName': 'SysMenu',
              'isCache': '1',
              'affix': '0',
              'isLeaf': '1',
              'sortNo': 10400,
              'parentMenuName': '系统管理'
            },
            'children': null
          }, {
            'id': 'sysFunc',
            'label': '功能管理',
            'parentId': 'sys',
            'disabled': null,
            'isLeaf': true,
            'data': {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'menuId': 'sysFunc',
              'menuName': '功能管理',
              'parentMenuId': 'sys',
              'menuIcon': 'tree',
              'menuUrl': 'func',
              'menuPermissions': 'sys:func:list,sys:func:listByQw,sys:menu:getTreeData',
              'component': 'views/sys/func/index',
              'redirect': null,
              'hidden': '0',
              'isRoute': '1',
              'routeName': 'SysFunc',
              'isCache': '1',
              'affix': '0',
              'isLeaf': '1',
              'sortNo': 10500,
              'parentMenuName': '系统管理'
            },
            'children': null
          }, {
            'id': 'sysOrg',
            'label': '机构管理',
            'parentId': 'sys',
            'disabled': null,
            'isLeaf': true,
            'data': {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'menuId': 'sysOrg',
              'menuName': '机构管理',
              'parentMenuId': 'sys',
              'menuIcon': 'tree',
              'menuUrl': 'org',
              'menuPermissions': 'sys:org:list,sys:org:listByQw,sys:org:getTreeData',
              'component': 'views/sys/org/index',
              'redirect': null,
              'hidden': '0',
              'isRoute': '1',
              'routeName': 'SysOrg',
              'isCache': '1',
              'affix': '0',
              'isLeaf': '1',
              'sortNo': 10600,
              'parentMenuName': '系统管理'
            },
            'children': null
          }, {
            'id': 'sysRole',
            'label': '角色管理',
            'parentId': 'sys',
            'disabled': null,
            'isLeaf': true,
            'data': {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'menuId': 'sysRole',
              'menuName': '角色管理',
              'parentMenuId': 'sys',
              'menuIcon': 'list',
              'menuUrl': 'role',
              'menuPermissions': 'sys:role:list,sys:role:listByQw',
              'component': 'views/sys/role/index',
              'redirect': null,
              'hidden': '0',
              'isRoute': '1',
              'routeName': 'SysRole',
              'isCache': '1',
              'affix': '0',
              'isLeaf': '1',
              'sortNo': 10700,
              'parentMenuName': '系统管理'
            },
            'children': null
          }, {
            'id': 'sysUser',
            'label': '用户管理',
            'parentId': 'sys',
            'disabled': null,
            'isLeaf': true,
            'data': {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'menuId': 'sysUser',
              'menuName': '用户管理',
              'parentMenuId': 'sys',
              'menuIcon': 'list',
              'menuUrl': 'user',
              'menuPermissions': 'sys:user:list,sys:user:listByQw,sys:role:listAll',
              'component': 'views/sys/user/index',
              'redirect': null,
              'hidden': '0',
              'isRoute': '1',
              'routeName': 'SysUser',
              'isCache': '1',
              'affix': '0',
              'isLeaf': '1',
              'sortNo': 10800,
              'parentMenuName': '系统管理'
            },
            'children': null
          }, {
            'id': 'sysDataPermission',
            'label': '数据权限',
            'parentId': 'sys',
            'disabled': null,
            'isLeaf': true,
            'data': {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'menuId': 'sysDataPermission',
              'menuName': '数据权限',
              'parentMenuId': 'sys',
              'menuIcon': 'list',
              'menuUrl': 'dataPermission',
              'menuPermissions': 'sys:dataPermission:list,sys:dataPermission:listByQw',
              'component': 'views/sys/dataPermission/index',
              'redirect': null,
              'hidden': '0',
              'isRoute': '1',
              'routeName': 'SysDataPermission',
              'isCache': '1',
              'affix': '0',
              'isLeaf': '1',
              'sortNo': 10900,
              'parentMenuName': '系统管理'
            },
            'children': null
          }, {
            'id': 'sysLog',
            'label': '系统日志',
            'parentId': 'sys',
            'disabled': null,
            'isLeaf': true,
            'data': {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'menuId': 'sysLog',
              'menuName': '系统日志',
              'parentMenuId': 'sys',
              'menuIcon': 'list',
              'menuUrl': 'log',
              'menuPermissions': 'sys:log:list,sys:log:listByQw',
              'component': 'views/sys/log/index',
              'redirect': null,
              'hidden': '0',
              'isRoute': '1',
              'routeName': 'SysLog',
              'isCache': '1',
              'affix': '0',
              'isLeaf': '1',
              'sortNo': 11000,
              'parentMenuName': '系统管理'
            },
            'children': null
          }]
        }]
      }
    }
  },
  {
    url: '/sys/menu/save', type: 'post', response: config => {
      return {
        'code': 200,
        'msg': '操作成功',
        'data': {
          'createBy': 'admin',
          'createDate': '2019-09-28',
          'createTime': '2019-09-28 20:03:38',
          'updateBy': null,
          'updateDate': null,
          'updateTime': null,
          'menuId': '1',
          'menuName': '1',
          'parentMenuId': 'sys',
          'menuIcon': '',
          'menuUrl': '1',
          'menuPermissions': '',
          'component': '',
          'redirect': '',
          'hidden': '0',
          'isRoute': '1',
          'routeName': '',
          'isCache': '1',
          'affix': '0',
          'isLeaf': '1',
          'sortNo': 1,
          'parentMenuName': '系统管理'
        }
      }
    }
  },
  {
    url: '/sys/menu/update', type: 'put', response: config => {
      return {
        'code': 200,
        'msg': '操作成功',
        'data': {
          'createBy': null,
          'createDate': null,
          'createTime': null,
          'updateBy': 'admin',
          'updateDate': '2019-09-28',
          'updateTime': '2019-09-28 20:03:40',
          'menuId': '1',
          'menuName': '1',
          'parentMenuId': 'sys',
          'menuIcon': '',
          'menuUrl': '1',
          'menuPermissions': '',
          'component': '',
          'redirect': '',
          'hidden': '0',
          'isRoute': '1',
          'routeName': '',
          'isCache': '1',
          'affix': '0',
          'isLeaf': '1',
          'sortNo': 1,
          'parentMenuName': '系统管理'
        }
      }
    }
  },
  {
    url: '/sys/menu/delete', type: 'delete', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
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
  },
  {
    url: '/sys/org/getTreeData', type: 'get', response: config => {
      return {
        'code': 200, 'msg': '操作成功', 'data': [{
          'id': '1000000000',
          'label': '总行',
          'parentId': null,
          'disabled': null,
          'isLeaf': false,
          'data': {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'orgId': '1000000000',
            'orgName': '总行',
            'parentOrgId': '',
            'shortName': '总行',
            'orgType': '1',
            'orgLevel': '1',
            'orgLevelCode': '1000000000',
            'remark': '',
            'isLeaf': '0',
            'parentOrgName': '总行',
            'authFilterSql': null
          },
          'children': [{
            'id': '1010000000',
            'label': '北京分行',
            'parentId': '1000000000',
            'disabled': null,
            'isLeaf': false,
            'data': {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'orgId': '1010000000',
              'orgName': '北京分行',
              'parentOrgId': '1000000000',
              'shortName': '',
              'orgType': '1',
              'orgLevel': '2',
              'orgLevelCode': '1000000000,1010000000',
              'remark': '',
              'isLeaf': '0',
              'parentOrgName': '北京分行',
              'authFilterSql': null
            },
            'children': null
          }, {
            'id': '1050000000',
            'label': '福建分行',
            'parentId': '1000000000',
            'disabled': null,
            'isLeaf': false,
            'data': {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'orgId': '1050000000',
              'orgName': '福建分行',
              'parentOrgId': '1000000000',
              'shortName': '',
              'orgType': '1',
              'orgLevel': '2',
              'orgLevelCode': '1000000000,1050000000',
              'remark': '',
              'isLeaf': '0',
              'parentOrgName': '福建分行',
              'authFilterSql': null
            },
            'children': [{
              'id': '1050100000',
              'label': '福州分行',
              'parentId': '1050000000',
              'disabled': null,
              'isLeaf': true,
              'data': {
                'createBy': null,
                'createDate': null,
                'createTime': null,
                'updateBy': null,
                'updateDate': null,
                'updateTime': null,
                'orgId': '1050100000',
                'orgName': '福州分行',
                'parentOrgId': '1050000000',
                'shortName': '',
                'orgType': '1',
                'orgLevel': '3',
                'orgLevelCode': '1000000000,1050000000,1050100000',
                'remark': '',
                'isLeaf': '1',
                'parentOrgName': '福州分行',
                'authFilterSql': null
              },
              'children': null
            }, {
              'id': '1050200000',
              'label': '厦门分行',
              'parentId': '1050000000',
              'disabled': null,
              'isLeaf': true,
              'data': {
                'createBy': null,
                'createDate': null,
                'createTime': null,
                'updateBy': null,
                'updateDate': null,
                'updateTime': null,
                'orgId': '1050200000',
                'orgName': '厦门分行',
                'parentOrgId': '1050000000',
                'shortName': '',
                'orgType': '1',
                'orgLevel': '3',
                'orgLevelCode': '1000000000,1050000000,1050200000',
                'remark': '',
                'isLeaf': '1',
                'parentOrgName': '厦门分行',
                'authFilterSql': null
              },
              'children': null
            }, {
              'id': '1050300000',
              'label': '莆田分行',
              'parentId': '1050000000',
              'disabled': null,
              'isLeaf': true,
              'data': {
                'createBy': null,
                'createDate': null,
                'createTime': null,
                'updateBy': null,
                'updateDate': null,
                'updateTime': null,
                'orgId': '1050300000',
                'orgName': '莆田分行',
                'parentOrgId': '1050000000',
                'shortName': '',
                'orgType': '1',
                'orgLevel': '3',
                'orgLevelCode': '1000000000,1050000000,1050300000',
                'remark': '',
                'isLeaf': '1',
                'parentOrgName': '莆田分行',
                'authFilterSql': null
              },
              'children': null
            }, {
              'id': '1050400000',
              'label': '漳州分行',
              'parentId': '1050000000',
              'disabled': null,
              'isLeaf': true,
              'data': {
                'createBy': null,
                'createDate': null,
                'createTime': null,
                'updateBy': null,
                'updateDate': null,
                'updateTime': null,
                'orgId': '1050400000',
                'orgName': '漳州分行',
                'parentOrgId': '1050000000',
                'shortName': '',
                'orgType': '1',
                'orgLevel': '3',
                'orgLevelCode': '1000000000,1050000000,1050400000',
                'remark': '',
                'isLeaf': '1',
                'parentOrgName': '漳州分行',
                'authFilterSql': null
              },
              'children': null
            }, {
              'id': '1050500000',
              'label': '泉州分行',
              'parentId': '1050000000',
              'disabled': null,
              'isLeaf': false,
              'data': {
                'createBy': null,
                'createDate': null,
                'createTime': null,
                'updateBy': null,
                'updateDate': null,
                'updateTime': null,
                'orgId': '1050500000',
                'orgName': '泉州分行',
                'parentOrgId': '1050000000',
                'shortName': '',
                'orgType': '1',
                'orgLevel': '3',
                'orgLevelCode': '1000000000,1050000000,1050500000',
                'remark': '',
                'isLeaf': '0',
                'parentOrgName': '泉州分行',
                'authFilterSql': null
              },
              'children': [{
                'id': '1050501000',
                'label': '丰泽支行',
                'parentId': '1050500000',
                'disabled': null,
                'isLeaf': true,
                'data': {
                  'createBy': null,
                  'createDate': null,
                  'createTime': null,
                  'updateBy': null,
                  'updateDate': null,
                  'updateTime': null,
                  'orgId': '1050501000',
                  'orgName': '丰泽支行',
                  'parentOrgId': '1050500000',
                  'shortName': '',
                  'orgType': '1',
                  'orgLevel': '4',
                  'orgLevelCode': '1000000000,1050000000,1050500000,1050501000',
                  'remark': '',
                  'isLeaf': '1',
                  'parentOrgName': '丰泽支行',
                  'authFilterSql': null
                },
                'children': null
              }, {
                'id': '1050502000',
                'label': '鲤城支行',
                'parentId': '1050500000',
                'disabled': null,
                'isLeaf': true,
                'data': {
                  'createBy': null,
                  'createDate': null,
                  'createTime': null,
                  'updateBy': null,
                  'updateDate': null,
                  'updateTime': null,
                  'orgId': '1050502000',
                  'orgName': '鲤城支行',
                  'parentOrgId': '1050500000',
                  'shortName': '',
                  'orgType': '1',
                  'orgLevel': '4',
                  'orgLevelCode': '1000000000,1050000000,1050500000,1050502000',
                  'remark': '',
                  'isLeaf': '1',
                  'parentOrgName': '鲤城支行',
                  'authFilterSql': null
                },
                'children': null
              }]
            }]
          }]
        }]
      }
    }
  },
  {
    url: '/sys/org/save', type: 'post', response: config => {
      return {
        'code': 200,
        'msg': '操作成功',
        'data': {
          'createBy': 'admin',
          'createDate': '2019-09-28',
          'createTime': '2019-09-28 20:04:22',
          'updateBy': null,
          'updateDate': null,
          'updateTime': null,
          'orgId': '1',
          'orgName': '1',
          'parentOrgId': '1000000000',
          'shortName': '',
          'orgType': '1',
          'orgLevel': '2',
          'orgLevelCode': '1000000000,1',
          'remark': '1',
          'isLeaf': '1',
          'parentOrgName': '总行',
          'authFilterSql': null
        }
      }
    }
  },
  {
    url: '/sys/org/update', type: 'put', response: config => {
      return {
        'code': 200,
        'msg': '操作成功',
        'data': {
          'createBy': null,
          'createDate': null,
          'createTime': null,
          'updateBy': 'admin',
          'updateDate': '2019-09-28',
          'updateTime': '2019-09-28 20:04:25',
          'orgId': '1',
          'orgName': '1',
          'parentOrgId': '1000000000',
          'shortName': '',
          'orgType': '1',
          'orgLevel': '2',
          'orgLevelCode': '1000000000,1',
          'remark': '1',
          'isLeaf': '1',
          'parentOrgName': '1',
          'authFilterSql': null
        }
      }
    }
  },
  {
    url: '/sys/org/delete', type: 'delete', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
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
    url: '/sys/org/getSelectTreeData', type: 'get', response: config => {
      return {
        'code': 200, 'msg': '操作成功', 'data': [{
          'id': '1000000000',
          'label': '总行',
          'parentId': null,
          'disabled': null,
          'isLeaf': false,
          'data': {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'orgId': '1000000000',
            'orgName': '总行',
            'parentOrgId': '',
            'shortName': '总行',
            'orgType': '1',
            'orgLevel': '1',
            'orgLevelCode': '1000000000',
            'remark': '',
            'isLeaf': '0',
            'parentOrgName': '总行',
            'authFilterSql': null
          },
          'children': [{
            'id': '1010000000',
            'label': '北京分行',
            'parentId': '1000000000',
            'disabled': null,
            'isLeaf': false,
            'data': {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'orgId': '1010000000',
              'orgName': '北京分行',
              'parentOrgId': '1000000000',
              'shortName': '',
              'orgType': '1',
              'orgLevel': '2',
              'orgLevelCode': '1000000000,1010000000',
              'remark': '',
              'isLeaf': '0',
              'parentOrgName': '北京分行',
              'authFilterSql': null
            },
            'children': null
          }, {
            'id': '1050000000',
            'label': '福建分行',
            'parentId': '1000000000',
            'disabled': null,
            'isLeaf': false,
            'data': {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'orgId': '1050000000',
              'orgName': '福建分行',
              'parentOrgId': '1000000000',
              'shortName': '',
              'orgType': '1',
              'orgLevel': '2',
              'orgLevelCode': '1000000000,1050000000',
              'remark': '',
              'isLeaf': '0',
              'parentOrgName': '福建分行',
              'authFilterSql': null
            },
            'children': [{
              'id': '1050100000',
              'label': '福州分行',
              'parentId': '1050000000',
              'disabled': null,
              'isLeaf': true,
              'data': {
                'createBy': null,
                'createDate': null,
                'createTime': null,
                'updateBy': null,
                'updateDate': null,
                'updateTime': null,
                'orgId': '1050100000',
                'orgName': '福州分行',
                'parentOrgId': '1050000000',
                'shortName': '',
                'orgType': '1',
                'orgLevel': '3',
                'orgLevelCode': '1000000000,1050000000,1050100000',
                'remark': '',
                'isLeaf': '1',
                'parentOrgName': '福州分行',
                'authFilterSql': null
              },
              'children': null
            }, {
              'id': '1050200000',
              'label': '厦门分行',
              'parentId': '1050000000',
              'disabled': null,
              'isLeaf': true,
              'data': {
                'createBy': null,
                'createDate': null,
                'createTime': null,
                'updateBy': null,
                'updateDate': null,
                'updateTime': null,
                'orgId': '1050200000',
                'orgName': '厦门分行',
                'parentOrgId': '1050000000',
                'shortName': '',
                'orgType': '1',
                'orgLevel': '3',
                'orgLevelCode': '1000000000,1050000000,1050200000',
                'remark': '',
                'isLeaf': '1',
                'parentOrgName': '厦门分行',
                'authFilterSql': null
              },
              'children': null
            }, {
              'id': '1050300000',
              'label': '莆田分行',
              'parentId': '1050000000',
              'disabled': null,
              'isLeaf': true,
              'data': {
                'createBy': null,
                'createDate': null,
                'createTime': null,
                'updateBy': null,
                'updateDate': null,
                'updateTime': null,
                'orgId': '1050300000',
                'orgName': '莆田分行',
                'parentOrgId': '1050000000',
                'shortName': '',
                'orgType': '1',
                'orgLevel': '3',
                'orgLevelCode': '1000000000,1050000000,1050300000',
                'remark': '',
                'isLeaf': '1',
                'parentOrgName': '莆田分行',
                'authFilterSql': null
              },
              'children': null
            }, {
              'id': '1050400000',
              'label': '漳州分行',
              'parentId': '1050000000',
              'disabled': null,
              'isLeaf': true,
              'data': {
                'createBy': null,
                'createDate': null,
                'createTime': null,
                'updateBy': null,
                'updateDate': null,
                'updateTime': null,
                'orgId': '1050400000',
                'orgName': '漳州分行',
                'parentOrgId': '1050000000',
                'shortName': '',
                'orgType': '1',
                'orgLevel': '3',
                'orgLevelCode': '1000000000,1050000000,1050400000',
                'remark': '',
                'isLeaf': '1',
                'parentOrgName': '漳州分行',
                'authFilterSql': null
              },
              'children': null
            }, {
              'id': '1050500000',
              'label': '泉州分行',
              'parentId': '1050000000',
              'disabled': null,
              'isLeaf': false,
              'data': {
                'createBy': null,
                'createDate': null,
                'createTime': null,
                'updateBy': null,
                'updateDate': null,
                'updateTime': null,
                'orgId': '1050500000',
                'orgName': '泉州分行',
                'parentOrgId': '1050000000',
                'shortName': '',
                'orgType': '1',
                'orgLevel': '3',
                'orgLevelCode': '1000000000,1050000000,1050500000',
                'remark': '',
                'isLeaf': '0',
                'parentOrgName': '泉州分行',
                'authFilterSql': null
              },
              'children': [{
                'id': '1050501000',
                'label': '丰泽支行',
                'parentId': '1050500000',
                'disabled': null,
                'isLeaf': true,
                'data': {
                  'createBy': null,
                  'createDate': null,
                  'createTime': null,
                  'updateBy': null,
                  'updateDate': null,
                  'updateTime': null,
                  'orgId': '1050501000',
                  'orgName': '丰泽支行',
                  'parentOrgId': '1050500000',
                  'shortName': '',
                  'orgType': '1',
                  'orgLevel': '4',
                  'orgLevelCode': '1000000000,1050000000,1050500000,1050501000',
                  'remark': '',
                  'isLeaf': '1',
                  'parentOrgName': '丰泽支行',
                  'authFilterSql': null
                },
                'children': null
              }, {
                'id': '1050502000',
                'label': '鲤城支行',
                'parentId': '1050500000',
                'disabled': null,
                'isLeaf': true,
                'data': {
                  'createBy': null,
                  'createDate': null,
                  'createTime': null,
                  'updateBy': null,
                  'updateDate': null,
                  'updateTime': null,
                  'orgId': '1050502000',
                  'orgName': '鲤城支行',
                  'parentOrgId': '1050500000',
                  'shortName': '',
                  'orgType': '1',
                  'orgLevel': '4',
                  'orgLevelCode': '1000000000,1050000000,1050500000,1050502000',
                  'remark': '',
                  'isLeaf': '1',
                  'parentOrgName': '鲤城支行',
                  'authFilterSql': null
                },
                'children': null
              }]
            }]
          }]
        }]
      }
    }
  },
  {
    url: '/sys/user/listSelectUser', type: 'get', response: config => {
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
            'userId': 'admin',
            'userName': 'admin',
            'sex': '1',
            'roleId': 'admin',
            'orgId': '1000000000',
            'mobile': '18888888888',
            'idCardNo': 'xxx',
            'email': 'xxx@yyy.zz',
            'status': '1',
            'sortNo': 1,
            'remark': '1',
            'orgName': '总行',
            'authFilterSql': null
          }], 'total': 1, 'size': 10, 'current': 1, 'searchCount': true, 'pages': 1
        }
      }
    }
  },
  {
    url: '/sys/role/saveRoleUsers', type: 'post', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/role/getRoleUser', type: 'get', response: config => {
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
            'userId': 'admin',
            'userName': 'admin',
            'sex': null,
            'roleId': null,
            'orgId': '1000000000',
            'mobile': null,
            'idCardNo': null,
            'email': null,
            'status': null,
            'sortNo': null,
            'remark': null,
            'orgName': '总行',
            'authFilterSql': null
          }], 'total': 1, 'size': 10, 'current': 1, 'searchCount': true, 'pages': 1
        }
      }
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
  },
  {
    url: '/sys/user/list', type: 'get', response: config => {
      return {
        'code': 200, 'msg': '操作成功', 'data': {
          'records': [{
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'userId': 'admin',
            'userName': 'admin',
            'sex': '1',
            'roleId': 'admin',
            'orgId': '1000000000',
            'mobile': '18888888888',
            'idCardNo': 'xxx',
            'email': 'xxx@yyy.zz',
            'status': '1',
            'sortNo': 1,
            'remark': '1',
            'orgName': '总行',
            'authFilterSql': null
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'userId': 'swai',
            'userName': 'swai',
            'sex': '1',
            'roleId': 'managerRole',
            'orgId': '1050500000',
            'mobile': '18888888888',
            'idCardNo': '1',
            'email': '1',
            'status': '1',
            'sortNo': 3,
            'remark': '',
            'orgName': '泉州分行',
            'authFilterSql': null
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'userId': 'zxf',
            'userName': '庄晓芳',
            'sex': '2',
            'roleId': 'managerRole',
            'orgId': '1050200000',
            'mobile': '18888888888',
            'idCardNo': '1',
            'email': '1',
            'status': '1',
            'sortNo': 4,
            'remark': '',
            'orgName': '厦门分行',
            'authFilterSql': null
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'userId': 'lizhi1',
            'userName': '离职用户1',
            'sex': '1',
            'roleId': 'queryRole',
            'orgId': '1050501000',
            'mobile': '18888888888',
            'idCardNo': '1',
            'email': '1',
            'status': '2',
            'sortNo': 5,
            'remark': '',
            'orgName': '丰泽支行',
            'authFilterSql': null
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'userId': 'lizhi2',
            'userName': '离职用户2',
            'sex': '2',
            'roleId': 'queryRole',
            'orgId': '1050500000',
            'mobile': '18888888888',
            'idCardNo': '1',
            'email': '1',
            'status': '2',
            'sortNo': 6,
            'remark': '',
            'orgName': '泉州分行',
            'authFilterSql': null
          }], 'total': 5, 'size': 10, 'current': 1, 'searchCount': true, 'pages': 1
        }
      }
    }
  },
  {
    url: '/sys/org/getSelectTreeData', type: 'get', response: config => {
      return {
        'code': 200, 'msg': '操作成功', 'data': [{
          'id': '1000000000',
          'label': '总行',
          'parentId': null,
          'disabled': null,
          'isLeaf': false,
          'data': {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'orgId': '1000000000',
            'orgName': '总行',
            'parentOrgId': '',
            'shortName': '总行',
            'orgType': '1',
            'orgLevel': '1',
            'orgLevelCode': '1000000000',
            'remark': '',
            'isLeaf': '0',
            'parentOrgName': '总行',
            'authFilterSql': null
          },
          'children': [{
            'id': '1010000000',
            'label': '北京分行',
            'parentId': '1000000000',
            'disabled': null,
            'isLeaf': false,
            'data': {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'orgId': '1010000000',
              'orgName': '北京分行',
              'parentOrgId': '1000000000',
              'shortName': '',
              'orgType': '1',
              'orgLevel': '2',
              'orgLevelCode': '1000000000,1010000000',
              'remark': '',
              'isLeaf': '0',
              'parentOrgName': '北京分行',
              'authFilterSql': null
            },
            'children': null
          }, {
            'id': '1050000000',
            'label': '福建分行',
            'parentId': '1000000000',
            'disabled': null,
            'isLeaf': false,
            'data': {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'orgId': '1050000000',
              'orgName': '福建分行',
              'parentOrgId': '1000000000',
              'shortName': '',
              'orgType': '1',
              'orgLevel': '2',
              'orgLevelCode': '1000000000,1050000000',
              'remark': '',
              'isLeaf': '0',
              'parentOrgName': '福建分行',
              'authFilterSql': null
            },
            'children': [{
              'id': '1050100000',
              'label': '福州分行',
              'parentId': '1050000000',
              'disabled': null,
              'isLeaf': true,
              'data': {
                'createBy': null,
                'createDate': null,
                'createTime': null,
                'updateBy': null,
                'updateDate': null,
                'updateTime': null,
                'orgId': '1050100000',
                'orgName': '福州分行',
                'parentOrgId': '1050000000',
                'shortName': '',
                'orgType': '1',
                'orgLevel': '3',
                'orgLevelCode': '1000000000,1050000000,1050100000',
                'remark': '',
                'isLeaf': '1',
                'parentOrgName': '福州分行',
                'authFilterSql': null
              },
              'children': null
            }, {
              'id': '1050200000',
              'label': '厦门分行',
              'parentId': '1050000000',
              'disabled': null,
              'isLeaf': true,
              'data': {
                'createBy': null,
                'createDate': null,
                'createTime': null,
                'updateBy': null,
                'updateDate': null,
                'updateTime': null,
                'orgId': '1050200000',
                'orgName': '厦门分行',
                'parentOrgId': '1050000000',
                'shortName': '',
                'orgType': '1',
                'orgLevel': '3',
                'orgLevelCode': '1000000000,1050000000,1050200000',
                'remark': '',
                'isLeaf': '1',
                'parentOrgName': '厦门分行',
                'authFilterSql': null
              },
              'children': null
            }, {
              'id': '1050300000',
              'label': '莆田分行',
              'parentId': '1050000000',
              'disabled': null,
              'isLeaf': true,
              'data': {
                'createBy': null,
                'createDate': null,
                'createTime': null,
                'updateBy': null,
                'updateDate': null,
                'updateTime': null,
                'orgId': '1050300000',
                'orgName': '莆田分行',
                'parentOrgId': '1050000000',
                'shortName': '',
                'orgType': '1',
                'orgLevel': '3',
                'orgLevelCode': '1000000000,1050000000,1050300000',
                'remark': '',
                'isLeaf': '1',
                'parentOrgName': '莆田分行',
                'authFilterSql': null
              },
              'children': null
            }, {
              'id': '1050400000',
              'label': '漳州分行',
              'parentId': '1050000000',
              'disabled': null,
              'isLeaf': true,
              'data': {
                'createBy': null,
                'createDate': null,
                'createTime': null,
                'updateBy': null,
                'updateDate': null,
                'updateTime': null,
                'orgId': '1050400000',
                'orgName': '漳州分行',
                'parentOrgId': '1050000000',
                'shortName': '',
                'orgType': '1',
                'orgLevel': '3',
                'orgLevelCode': '1000000000,1050000000,1050400000',
                'remark': '',
                'isLeaf': '1',
                'parentOrgName': '漳州分行',
                'authFilterSql': null
              },
              'children': null
            }, {
              'id': '1050500000',
              'label': '泉州分行',
              'parentId': '1050000000',
              'disabled': null,
              'isLeaf': false,
              'data': {
                'createBy': null,
                'createDate': null,
                'createTime': null,
                'updateBy': null,
                'updateDate': null,
                'updateTime': null,
                'orgId': '1050500000',
                'orgName': '泉州分行',
                'parentOrgId': '1050000000',
                'shortName': '',
                'orgType': '1',
                'orgLevel': '3',
                'orgLevelCode': '1000000000,1050000000,1050500000',
                'remark': '',
                'isLeaf': '0',
                'parentOrgName': '泉州分行',
                'authFilterSql': null
              },
              'children': [{
                'id': '1050501000',
                'label': '丰泽支行',
                'parentId': '1050500000',
                'disabled': null,
                'isLeaf': true,
                'data': {
                  'createBy': null,
                  'createDate': null,
                  'createTime': null,
                  'updateBy': null,
                  'updateDate': null,
                  'updateTime': null,
                  'orgId': '1050501000',
                  'orgName': '丰泽支行',
                  'parentOrgId': '1050500000',
                  'shortName': '',
                  'orgType': '1',
                  'orgLevel': '4',
                  'orgLevelCode': '1000000000,1050000000,1050500000,1050501000',
                  'remark': '',
                  'isLeaf': '1',
                  'parentOrgName': '丰泽支行',
                  'authFilterSql': null
                },
                'children': null
              }, {
                'id': '1050502000',
                'label': '鲤城支行',
                'parentId': '1050500000',
                'disabled': null,
                'isLeaf': true,
                'data': {
                  'createBy': null,
                  'createDate': null,
                  'createTime': null,
                  'updateBy': null,
                  'updateDate': null,
                  'updateTime': null,
                  'orgId': '1050502000',
                  'orgName': '鲤城支行',
                  'parentOrgId': '1050500000',
                  'shortName': '',
                  'orgType': '1',
                  'orgLevel': '4',
                  'orgLevelCode': '1000000000,1050000000,1050500000,1050502000',
                  'remark': '',
                  'isLeaf': '1',
                  'parentOrgName': '鲤城支行',
                  'authFilterSql': null
                },
                'children': null
              }]
            }]
          }]
        }]
      }
    }
  },
  {
    url: '/sys/user/save', type: 'post', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/user/list', type: 'get', response: config => {
      return {
        'code': 200, 'msg': '操作成功', 'data': {
          'records': [{
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'userId': 'admin',
            'userName': 'admin',
            'sex': '1',
            'roleId': 'admin',
            'orgId': '1000000000',
            'mobile': '18888888888',
            'idCardNo': 'xxx',
            'email': 'xxx@yyy.zz',
            'status': '1',
            'sortNo': 1,
            'remark': '1',
            'orgName': '总行',
            'authFilterSql': null
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'userId': 'swai',
            'userName': 'swai',
            'sex': '1',
            'roleId': 'managerRole',
            'orgId': '1050500000',
            'mobile': '18888888888',
            'idCardNo': '1',
            'email': '1',
            'status': '1',
            'sortNo': 3,
            'remark': '',
            'orgName': '泉州分行',
            'authFilterSql': null
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'userId': 'zxf',
            'userName': '庄晓芳',
            'sex': '2',
            'roleId': 'managerRole',
            'orgId': '1050200000',
            'mobile': '18888888888',
            'idCardNo': '1',
            'email': '1',
            'status': '1',
            'sortNo': 4,
            'remark': '',
            'orgName': '厦门分行',
            'authFilterSql': null
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'userId': 'lizhi1',
            'userName': '离职用户1',
            'sex': '1',
            'roleId': 'queryRole',
            'orgId': '1050501000',
            'mobile': '18888888888',
            'idCardNo': '1',
            'email': '1',
            'status': '2',
            'sortNo': 5,
            'remark': '',
            'orgName': '丰泽支行',
            'authFilterSql': null
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'userId': 'lizhi2',
            'userName': '离职用户2',
            'sex': '2',
            'roleId': 'queryRole',
            'orgId': '1050500000',
            'mobile': '18888888888',
            'idCardNo': '1',
            'email': '1',
            'status': '2',
            'sortNo': 6,
            'remark': '',
            'orgName': '泉州分行',
            'authFilterSql': null
          }], 'total': 5, 'size': 10, 'current': 1, 'searchCount': true, 'pages': 1
        }
      }
    }
  },
  {
    url: '/sys/user/update', type: 'put', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/user/delete', type: 'delete', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/log/list', type: 'get', response: config => {
      return {
        'code': 200, 'msg': '操作成功', 'data': {
          'records': [{
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'logId': '03c15b4a1dd68f0a07ca5232ad5b0373',
            'logType': '2',
            'logContent': '删除数据权限',
            'operateType': null,
            'userId': 'admin',
            'userName': 'admin',
            'ip': '127.0.0.1',
            'method': 'com.swai.modules.sys.controller.SysDataPermissionController.delete()',
            'requestUrl': '/swai/sys/dataPermission/delete',
            'requestParam': '"11"',
            'requestType': null,
            'operateResult': '操作成功',
            'costTime': 9
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'logId': '7c032ab34a116322adbfb932a3677ecc',
            'logType': '2',
            'logContent': '修改数据权限',
            'operateType': null,
            'userId': 'admin',
            'userName': 'admin',
            'ip': '127.0.0.1',
            'method': 'com.swai.modules.sys.controller.SysDataPermissionController.update()',
            'requestUrl': '/swai/sys/dataPermission/update',
            'requestParam': '{"dataPermissionId":"11","dataPermissionName":"11","entityType":"1","entityId":"","tableName":"","className":"","columnName":"","sourceStrategy":"1","operate":"","value":"","sourceProvider":"","sourceProviderParams":""}',
            'requestType': null,
            'operateResult': '操作成功',
            'costTime': 21
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'logId': 'f085204fd5343f86011a3cb9e62d8dd0',
            'logType': '2',
            'logContent': '新增数据权限',
            'operateType': null,
            'userId': 'admin',
            'userName': 'admin',
            'ip': '127.0.0.1',
            'method': 'com.swai.modules.sys.controller.SysDataPermissionController.save()',
            'requestUrl': '/swai/sys/dataPermission/save',
            'requestParam': '{"dataPermissionId":"11","dataPermissionName":"11","entityType":"1","entityId":"","tableName":"","className":"","columnName":"","sourceStrategy":"","operate":"","value":"","sourceProvider":"","sourceProviderParams":""}',
            'requestType': null,
            'operateResult': '操作成功',
            'costTime': 28
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'logId': '7e8a2ff2b631596d2e3c5d0adc72ae09',
            'logType': '2',
            'logContent': '新增数据权限',
            'operateType': null,
            'userId': 'admin',
            'userName': 'admin',
            'ip': '127.0.0.1',
            'method': 'com.swai.modules.sys.controller.SysDataPermissionController.save()',
            'requestUrl': '/swai/sys/dataPermission/save',
            'requestParam': '{"dataPermissionId":"1","dataPermissionName":"1","entityType":"1","entityId":"","tableName":"","className":"","columnName":"","sourceStrategy":"","operate":"","value":"","sourceProvider":"","sourceProviderParams":""}',
            'requestType': null,
            'operateResult': '\r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'\r\n### The error may involve com.swai.modules.sys.mapper.SysDataPermissionMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO T_SYS_DATA_PERMISSION  ( data_permission_id, data_permission_name, entity_type, entity_id, table_name, class_name, column_name, source_strategy, operate, value, source_provider, source_provider_params, create_by, create_date, create_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'\n; Duplicate entry \'1\' for key \'PRIMARY\'; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'',
            'costTime': 145
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'logId': 'e37bb438f74f47482b82303dccf3ccd2',
            'logType': '2',
            'logContent': '删除用户',
            'operateType': null,
            'userId': 'admin',
            'userName': 'admin',
            'ip': '127.0.0.1',
            'method': 'com.swai.modules.sys.controller.SysUserController.delete()',
            'requestUrl': '/swai/sys/user/delete',
            'requestParam': '"1"',
            'requestType': null,
            'operateResult': '操作成功',
            'costTime': 22
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'logId': 'e2278e147b8a6dbe041b57f45364b7bf',
            'logType': '2',
            'logContent': '修改用户',
            'operateType': null,
            'userId': 'admin',
            'userName': 'admin',
            'ip': '127.0.0.1',
            'method': 'com.swai.modules.sys.controller.SysUserController.update()',
            'requestUrl': '/swai/sys/user/update',
            'requestParam': '{"userId":"1","userName":"1","sex":"1","roleId":"queryRole","orgId":"1000000000","mobile":"1","idCardNo":"1","email":"1","status":"1","sortNo":1,"remark":"","orgName":"总行"}',
            'requestType': null,
            'operateResult': '操作成功',
            'costTime': 27
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'logId': '7c622d6009686512dea2a0a335e44c8c',
            'logType': '2',
            'logContent': '新增用户',
            'operateType': null,
            'userId': 'admin',
            'userName': 'admin',
            'ip': '127.0.0.1',
            'method': 'com.swai.modules.sys.controller.SysUserController.save()',
            'requestUrl': '/swai/sys/user/save',
            'requestParam': '{"userId":"1","userName":"1","sex":"1","roleId":"queryRole","orgId":"1000000000","mobile":"1","idCardNo":"1","email":"1","status":"1","sortNo":1,"remark":"","orgName":"总行"}',
            'requestType': null,
            'operateResult': '操作成功',
            'costTime': 48
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'logId': 'ebbdce3ae34d969379f0c0e1ea640aa2',
            'logType': '2',
            'logContent': '删除角色',
            'operateType': null,
            'userId': 'admin',
            'userName': 'admin',
            'ip': '127.0.0.1',
            'method': 'com.swai.modules.sys.controller.SysRoleController.delete()',
            'requestUrl': '/swai/sys/role/delete',
            'requestParam': '"1"',
            'requestType': null,
            'operateResult': '操作成功',
            'costTime': 22
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'logId': '9b4cd3568c62241c57fa569a4f54d410',
            'logType': '2',
            'logContent': '删除角色用户',
            'operateType': null,
            'userId': 'admin',
            'userName': 'admin',
            'ip': '127.0.0.1',
            'method': 'com.swai.modules.sys.controller.SysRoleController.deleteRoleUsers()',
            'requestUrl': '/swai/sys/role/deleteRoleUsers',
            'requestParam': '"1","admin"',
            'requestType': null,
            'operateResult': '操作成功',
            'costTime': 17
          }, {
            'createBy': null,
            'createDate': null,
            'createTime': null,
            'updateBy': null,
            'updateDate': null,
            'updateTime': null,
            'logId': '7799668815625a6647165698b02b3007',
            'logType': '2',
            'logContent': '保存角色用户',
            'operateType': null,
            'userId': 'admin',
            'userName': 'admin',
            'ip': '127.0.0.1',
            'method': 'com.swai.modules.sys.controller.SysRoleController.saveRoleUsers()',
            'requestUrl': '/swai/sys/role/saveRoleUsers',
            'requestParam': '{"roleId":"1","userId":"admin"}',
            'requestType': null,
            'operateResult': '操作成功',
            'costTime': 51
          }], 'total': 111, 'size': 10, 'current': 1, 'searchCount': true, 'pages': 12
        }
      }
    }
  },
  {
    url: '/sys/user/index', type: 'post', response: config => {
      return {
        'code': 200,
        'msg': '操作成功',
        'data': {
          'totalVisitCount': 24,
          'todayVisitCount': 9,
          'todayIp': 1,
          'lastSevenVisitCount': [{ 'days': '06-11', 'count': 9 }, { 'days': '06-08', 'count': 10 }],
          'lastSevenUserVisitCount': [{ 'days': '06-08', 'count': 2 }, { 'days': '06-11', 'count': 3 }]
        }
      }
    }
  },
  {
    url: '/balance/sys/balanceMain/list', type: 'get', response: config => {
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
            'balanceMainId': '0521d4c69499dd91996d5b1c90c634d2',
            'account': 10000.0,
            'accountDate': '2020-06-11',
            'remark': ''
          }], 'total': 1, 'size': 10, 'current': 1, 'orders': [], 'hitCount': false, 'searchCount': true, 'pages': 1
        }
      }
    }
  }
]
