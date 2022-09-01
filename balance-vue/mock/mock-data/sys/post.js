export default [
  {
    url: '/sys/post/list', type: 'get', response: config => {
      return {
        'code': 200,
        'msg': '操作成功',
        'data': {
          'records': [
            {
              'createBy': 'admin',
              'createDate': '2020-04-12',
              'createTime': '2020-04-12 20:45:42',
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'postId': 'boss',
              'postName': '老板',
              'sortNo': 1,
              'remark': ''
            },
            {
              'createBy': 'admin',
              'createDate': '2020-04-12',
              'createTime': '2020-04-12 20:45:24',
              'updateBy': 'admin',
              'updateDate': '2020-04-12',
              'updateTime': '2020-04-12 20:45:50',
              'postId': 'manager',
              'postName': '经理',
              'sortNo': 2,
              'remark': ''
            },
            {
              'createBy': 'admin',
              'createDate': '2020-04-25',
              'createTime': '2020-04-25 12:00:50',
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'postId': 'employee',
              'postName': '普通员工',
              'sortNo': 3,
              'remark': ''
            }
          ],
          'total': 3,
          'size': 10,
          'current': 1,
          'orders': [],
          'optimizeCountSql': true,
          'hitCount': false,
          'searchCount': true,
          'pages': 1
        }
      }
    }
  },
  {
    url: '/sys/post/save', type: 'post', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/post/update', type: 'put', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/post/delete', type: 'delete', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/post/getPostUser', type: 'get', response: config => {
      return {
        'code': 200,
        'msg': '操作成功',
        'data': {
          'records': [
            {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'userId': 'monezhao',
              'userName': '赵一鸣',
              'sex': null,
              'roleId': null,
              'orgId': '1000000000',
              'mobile': null,
              'idCardNo': null,
              'email': null,
              'status': null,
              'sortNo': null,
              'picId': null,
              'remark': null,
              'orgName': '公司总部',
              'authFilterSql': null,
              'orgList': null
            }
          ],
          'total': 1,
          'size': 10,
          'current': 1,
          'orders': [],
          'optimizeCountSql': true,
          'hitCount': false,
          'searchCount': true,
          'pages': 1
        }
      }
    }
  },
  {
    url: '/sys/post/savePostUsers', type: 'put', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/post/deletePostUsers', type: 'delete', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  }
]
