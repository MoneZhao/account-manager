export default [
  {
    url: '/sys/balanceCount/list', type: 'get', response: config => {
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
              'balanceCountId': null,
              'codeInfoId': 'balanceType-0',
              'countType': '1',
              'userId': null,
              'remark': '',
              'content': '支付宝'
            },
            {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'balanceCountId': null,
              'codeInfoId': 'balanceType-4',
              'countType': '1',
              'userId': null,
              'remark': '',
              'content': '招商银行'
            },
            {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'balanceCountId': null,
              'codeInfoId': 'balanceType-1',
              'countType': '1',
              'userId': null,
              'remark': '',
              'content': '微信钱包'
            },
            {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'balanceCountId': '031e1348a5c2b46ac8bb0a213d26161e',
              'codeInfoId': '1a6624861756622589d2887c19186d12',
              'countType': '0',
              'userId': 'monezhao',
              'remark': '',
              'content': '住房公积金'
            },
            {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'balanceCountId': null,
              'codeInfoId': '556439c2e0bcfce0b89f575ef7e58067',
              'countType': '1',
              'userId': null,
              'remark': '',
              'content': '现金'
            },
            {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'balanceCountId': null,
              'codeInfoId': 'balanceType-5',
              'countType': '1',
              'userId': null,
              'remark': '',
              'content': '建设银行'
            },
            {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'balanceCountId': null,
              'codeInfoId': 'balanceType-6',
              'countType': '1',
              'userId': null,
              'remark': '',
              'content': '农业银行'
            },
            {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'balanceCountId': null,
              'codeInfoId': 'balanceType-7',
              'countType': '1',
              'userId': null,
              'remark': '',
              'content': '工商银行'
            },
            {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'balanceCountId': null,
              'codeInfoId': 'balanceType-8',
              'countType': '1',
              'userId': null,
              'remark': '',
              'content': '邮储银行'
            },
            {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'balanceCountId': null,
              'codeInfoId': 'balanceType-9',
              'countType': '1',
              'userId': null,
              'remark': '',
              'content': '平安银行'
            }
          ],
          'total': 13,
          'size': 10,
          'current': 1,
          'orders': [],
          'optimizeCountSql': true,
          'hitCount': false,
          'searchCount': true,
          'pages': 2
        }
      }
    }
  },
  {
    url: '/sys/balanceCount/save', type: 'post', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/balanceCount/update', type: 'put', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/balanceCount/delete', type: 'delete', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  }
]
