export default [
  {
    url: '/sys/codeCreate/list', type: 'get', response: config => {
      return {
        'code': 200,
        'msg': '操作成功',
        'data': {
          'records': [],
          'total': 0,
          'size': 10,
          'current': 1,
          'orders': [],
          'optimizeCountSql': true,
          'hitCount': false,
          'searchCount': true,
          'pages': 0
        }
      }
    }
  },
  {
    url: '/sys/codeCreate/save', type: 'post', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/codeCreate/update', type: 'put', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/codeCreate/delete', type: 'delete', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  }
]
