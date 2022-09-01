export default [
  {
    url: '/sys/balanceMain/list', type: 'get', response: config => {
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
              'balanceMainId': 'f9f06b53d044f5270f297959fd414e63',
              'account': 123.01,
              'accountDate': '2022-08-01',
              'userId': 'monezhao',
              'userName': '赵一鸣',
              'remark': '',
              'deleteType': 0,
              'version': 4,
              'details': null
            },
            {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'balanceMainId': '503a9f6b468e9a49180b76d4645fa0bd',
              'account': 456.5,
              'accountDate': '2022-07-01',
              'userId': 'monezhao',
              'userName': '赵一鸣',
              'remark': '',
              'deleteType': 0,
              'version': 9,
              'details': null
            },
            {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'balanceMainId': '1c99c603c1c75c83647cccd2c70b541d',
              'account': 789.37,
              'accountDate': '2022-06-01',
              'userId': 'monezhao',
              'userName': '赵一鸣',
              'remark': '',
              'deleteType': 0,
              'version': 5,
              'details': null
            },
            {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'balanceMainId': '871f20f6e7a72692e5be8e75124f95e3',
              'account': 963.14,
              'accountDate': '2022-05-01',
              'userId': 'monezhao',
              'userName': '赵一鸣',
              'remark': '',
              'deleteType': 0,
              'version': 9,
              'details': null
            },
            {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'balanceMainId': 'fb2df14d1550968605d34ad911b62195',
              'account': 852.69,
              'accountDate': '2022-04-01',
              'userId': 'monezhao',
              'userName': '赵一鸣',
              'remark': '',
              'deleteType': 0,
              'version': 5,
              'details': null
            },
            {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'balanceMainId': '863b7702764b259548dc0bb8aecbb633',
              'account': 741.38,
              'accountDate': '2022-03-01',
              'userId': 'monezhao',
              'userName': '赵一鸣',
              'remark': '',
              'deleteType': 0,
              'version': 6,
              'details': null
            },
            {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'balanceMainId': '81790882e36708c873fce99642c36e7a',
              'account': 753.84,
              'accountDate': '2022-02-01',
              'userId': 'monezhao',
              'userName': '赵一鸣',
              'remark': '',
              'deleteType': 0,
              'version': 4,
              'details': null
            },
            {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'balanceMainId': '29a33c4490c495ea4847704bb271a7ed',
              'account': 951.29,
              'accountDate': '2022-01-01',
              'userId': 'monezhao',
              'userName': '赵一鸣',
              'remark': '',
              'deleteType': 0,
              'version': 7,
              'details': null
            },
            {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'balanceMainId': 'e0cd0aeeeeef3b22611f9dd41aadf5c5',
              'account': 987.21,
              'accountDate': '2021-12-01',
              'userId': 'monezhao',
              'userName': '赵一鸣',
              'remark': '',
              'deleteType': 0,
              'version': 5,
              'details': null
            },
            {
              'createBy': null,
              'createDate': null,
              'createTime': null,
              'updateBy': null,
              'updateDate': null,
              'updateTime': null,
              'balanceMainId': '76af64db1de41253c7744cde012e7884',
              'account': 654.14,
              'accountDate': '2021-11-01',
              'userId': 'monezhao',
              'userName': '赵一鸣',
              'remark': '',
              'deleteType': 0,
              'version': 4,
              'details': null
            }
          ],
          'total': 68,
          'size': 10,
          'current': 1,
          'orders': [],
          'optimizeCountSql': true,
          'hitCount': false,
          'searchCount': true,
          'pages': 7
        }
      }
    }
  },
  {
    url: '/sys/balanceMain/save', type: 'post', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/balanceMain/update', type: 'put', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/balanceMain/delete', type: 'delete', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/balanceMain/import', type: 'post', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/balanceMain/export', type: 'get', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/balanceMain/exportAll', type: 'get', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/balanceMain/fix', type: 'put', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/balanceMain/fixBatch', type: 'put', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/balanceMain/copy', type: 'put', response: config => {
      return { 'code': 200, 'msg': '操作成功', 'data': null }
    }
  },
  {
    url: '/sys/balanceMain/compareDetail', type: 'post', response: config => {
      return {
        'code': 200,
        'msg': '查询成功',
        'data': {
          'createBy': 'monezhao',
          'createDate': '2021-09-01',
          'createTime': '2021-09-01 08:10:23',
          'updateBy': null,
          'updateDate': null,
          'updateTime': null,
          'balanceDetailId': '85e9a4f3b19c1cbaeead70fed69b3b6c',
          'account': 453.67,
          'balanceType': '0',
          'balanceName': null,
          'balanceMainId': 'e76e98bf645c4ecb2353c2c88a1eb6d5',
          'userId': 'monezhao',
          'remark': '',
          'deleteType': 0,
          'accountDate': null,
          'statementDate': null,
          'countType': '1',
          'version': 1
        }
      }
    }
  },
  {
    url: '/sys/balanceMain/compare', type: 'post', response: config => {
      return {
        'code': 200,
        'msg': '查询成功',
        'data': {
          'createBy': 'monezhao',
          'createDate': '2021-09-01',
          'createTime': '2021-09-01 08:09:29',
          'updateBy': 'monezhao',
          'updateDate': '2021-09-01',
          'updateTime': '2021-09-01 08:09:56',
          'balanceMainId': 'e76e98bf645c4ecb2353c2c88a1eb6d5',
          'account': 658.56,
          'accountDate': '2021-09-01',
          'userId': 'monezhao',
          'userName': null,
          'remark': '',
          'deleteType': 0,
          'version': 2,
          'details': null
        }
      }
    }
  }
]
