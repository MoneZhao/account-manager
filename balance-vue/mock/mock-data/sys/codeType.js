export default [
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
  }
]
