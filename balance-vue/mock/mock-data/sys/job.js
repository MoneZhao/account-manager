export default [
  {
    url: '/sys/job/list', type: 'get', response: config => {
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
              'jobId': '4',
              'jobName': '测试4',
              'jobGroup': '测试4',
              'invokeTarget': 'balanceJob.saveTest()',
              'cronExpression': '0/15 * * * * ?',
              'misfirePolicy': '0',
              'concurrent': '1',
              'status': '0',
              'remark': ''
            },
            {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'jobId': '3',
              'jobName': '测试3',
              'jobGroup': '测试3',
              'invokeTarget': "balanceJob.hasMultipleParams('321', true, 2000L, 316.50D, 100)",
              'cronExpression': '0 0/1 * * * ?',
              'misfirePolicy': '0',
              'concurrent': '1',
              'status': '0',
              'remark': ''
            },
            {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'jobId': '2',
              'jobName': '测试2',
              'jobGroup': '测试2',
              'invokeTarget': "balanceJob.hasParam('123')",
              'cronExpression': '0 0/1 * * * ?',
              'misfirePolicy': '0',
              'concurrent': '1',
              'status': '0',
              'remark': ''
            },
            {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'jobId': '1',
              'jobName': '测试1',
              'jobGroup': '测试1',
              'invokeTarget': 'balanceJob.hasNoParam()',
              'cronExpression': '0 0/1 * * * ?',
              'misfirePolicy': '0',
              'concurrent': '1',
              'status': '0',
              'remark': ''
            }
          ],
          'total': 4,
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
    url: '/sys/job/save', type: 'post', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/job/update', type: 'put', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/job/delete', type: 'delete', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/job/changeStatus', type: 'put', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/job/run', type: 'put', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  }
]
