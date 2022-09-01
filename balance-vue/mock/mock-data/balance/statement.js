export default [
  {
    url: '/sys/statement/query', type: 'post', response: config => {
      return {
        'code': 200,
        'msg': '操作成功',
        'data': {
          'x': [
            '01月',
            '02月',
            '03月',
            '04月',
            '05月',
            '06月',
            '07月',
            '08月',
            '09月'
          ],
          'y': [
            {
              'name': '账户余额',
              'type': 'bar',
              'smooth': null,
              'data': [
                123.29,
                456.84,
                789.38,
                987.69,
                654.14,
                321.37,
                963.5,
                852.01,
                null
              ]
            },
            {
              'name': '账户余额增长',
              'type': 'line',
              'smooth': true,
              'data': [
                null,
                789.55,
                456.54,
                123.31,
                987.45,
                654.23,
                321.13,
                963.51,
                null
              ]
            }
          ],
          'title': '账户余额曲线',
          'ytitle': '账户余额',
          'xtitle': '月份'
        }
      }
    }
  },
  {
    url: '/sys/statement/detail/query', type: 'post', response: config => {
      return {
        'code': 200,
        'msg': '操作成功',
        'data': {
          'x': [
            '01月',
            '02月',
            '03月',
            '04月',
            '05月',
            '06月',
            '07月',
            '08月',
            '09月'
          ],
          'y': [
            {
              'name': '账户余额',
              'type': 'bar',
              'smooth': null,
              'data': [
                789.92, 456.92, 123.92, 897.92, 654.92, 321.92, 963.07,
                852.07, 0
              ]
            },
            {
              'name': '账户余额增长',
              'type': 'line',
              'smooth': true,
              'data': [
                null,
                3220.0,
                3220.0,
                3220.0,
                3220.0,
                3220.0,
                4270.15,
                3220.0,
                3220.07
              ]
            }
          ],
          'title': '账户余额曲线',
          'ytitle': '账户余额',
          'xtitle': '月份'
        }
      }
    }
  }
]
