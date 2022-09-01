export default [
  {
    url: '/sys/balanceDetail/list', type: 'get', response: config => {
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
              'balanceDetailId': 'f205efe4bb4def3281961e49b6103522',
              'account': 1234.36,
              'balanceType': '0',
              'balanceName': '支付宝',
              'balanceMainId': 'f9f06b53d044f5270f297959fd414e63',
              'userId': 'monezhao',
              'remark': '',
              'deleteType': 0,
              'accountDate': '2022-08-01',
              'statementDate': null,
              'countType': '1',
              'version': 1
            },
            {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'balanceDetailId': 'f4e37e3786558ad13600a984edd83580',
              'account': 5678.65,
              'balanceType': '4',
              'balanceName': '招商银行',
              'balanceMainId': 'f9f06b53d044f5270f297959fd414e63',
              'userId': 'monezhao',
              'remark': '',
              'deleteType': 0,
              'accountDate': '2022-08-01',
              'statementDate': null,
              'countType': '1',
              'version': 1
            },
            {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'balanceDetailId': '6e7654b253b3da35cf6bf1add88625fb',
              'account': 13579.07,
              'balanceType': '10',
              'balanceName': '住房公积金',
              'balanceMainId': 'f9f06b53d044f5270f297959fd414e63',
              'userId': 'monezhao',
              'remark': '',
              'deleteType': 0,
              'accountDate': '2022-08-01',
              'statementDate': null,
              'countType': '0',
              'version': 0
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
    url: '/sys/balanceDetail/save', type: 'post', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/balanceDetail/update', type: 'put', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/balanceDetail/delete', type: 'delete', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  }
]
