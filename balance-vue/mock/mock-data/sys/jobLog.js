export default [
  {
    url: '/sys/jobLog/list', type: 'get', response: config => {
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
              'jobLogId': 'a1e75d6fe06c1998a2e5aca9a7b8ff2c',
              'jobName': '测试2',
              'jobGroup': '测试2',
              'invokeTarget': "balanceJob.hasParam('123')",
              'jobMessage': '测试2 总共耗时：13毫秒',
              'status': '1',
              'exceptionInfo': null,
              'startTime': '2020-06-12 11:09:41',
              'stopTime': '2020-06-12 11:09:41'
            },
            {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'jobLogId': 'f80db85ce37ccdec84c27fd2baddfbff',
              'jobName': '测试2',
              'jobGroup': '测试2',
              'invokeTarget': "balanceJob.hasParam('123')",
              'jobMessage': '测试2 总共耗时：23毫秒',
              'status': '1',
              'exceptionInfo': null,
              'startTime': '2020-06-12 11:09:41',
              'stopTime': '2020-06-12 11:09:41'
            },
            {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'jobLogId': '10284665458c4f97c2df10327194b4ff',
              'jobName': '测试1',
              'jobGroup': '测试1',
              'invokeTarget': 'balanceJob.hasNoParam()',
              'jobMessage': '测试1 总共耗时：26毫秒',
              'status': '1',
              'exceptionInfo': null,
              'startTime': '2020-06-12 11:09:27',
              'stopTime': '2020-06-12 11:09:27'
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
  }
]
