/*
 * @Descripttion: 工具集
 * @version: 1.1
 * @LastEditors: yubaoshan
 * @LastEditTime: 2022年4月19日10:58:41
 */
import dayjs from 'dayjs'

const tool = {}

// localStorage
tool.data = {
  set(table, settings) {
    const _set = JSON.stringify(settings)
    return localStorage.setItem(table, _set)
  },
  get(table) {
    let data = localStorage.getItem(table)
    try {
      data = JSON.parse(data)
    } catch (err) {
      return null
    }
    return data
  },
  remove(table) {
    return localStorage.removeItem(table)
  },

  clear() {
    return localStorage.clear()
  }
}

// sessionStorage
tool.session = {
  set(table, settings) {
    const _set = JSON.stringify(settings)
    return sessionStorage.setItem(table, _set)
  },
  get(table) {
    let data = sessionStorage.getItem(table)
    try {
      data = JSON.parse(data)
    } catch (err) {
      return null
    }
    return data
  },
  remove(table) {
    return sessionStorage.removeItem(table)
  },
  clear() {
    return sessionStorage.clear()
  }
}

// 千分符
tool.groupSeparator = (num) => {
  num = `${num}`
  if (!num.includes('.')) num += '.'

  return num
    .replace(/(\d)(?=(\d{3})+\.)/g, ($0, $1) => {
      return `${$1},`
    })
    .replace(/\.$/, '')
}

// 获取所有字典数组
tool.dictDataAll = () => {
  return tool.data.get('DICT_TYPE_TREE_DATA')
}

// 字典翻译方法，界面插槽使用方法 {{ $TOOL.dictType('sex', record.sex) }}
tool.dictTypeData = (dictValue, value) => {
  if (value === '' || value === undefined || value === null) {
    return ''
  }
  const dictTypeTree = tool.dictDataAll()
  if (!dictTypeTree) {
    return '需重新登录'
  }
  const tree = dictTypeTree.find((item) => item.dictValue === dictValue)
  if (!tree) {
    return '无此字典'
  }
  const children = tree.children
  const dict = children.find((item) => item.dictValue === value)
  return dict ? dict.dictLabel : '无此字典项'
}

// 获取某个code下字典的列表，多用于字典下拉框
tool.dictTypeList = (dictValue) => {
  const dictTypeTree = tool.dictDataAll()
  if (!dictTypeTree) {
    return []
  }
  const tree = dictTypeTree.find((item) => item.dictValue === dictValue)
  if (tree && tree.children) {
    return tree.children
  }
  return []
}

// 获取某个code下字典的列表，基于dictTypeList 改进，保留老的，逐步替换
tool.dictList = (dictValue) => {
  const dictTypeTree = tool.dictDataAll()
  if (!dictTypeTree) {
    return []
  }
  const tree = dictTypeTree.find((item) => item.dictValue === dictValue)
  if (tree) {
    return tree.children.map((item) => {
      return {
        value: item['dictValue'],
        label: item['name']
      }
    })
  }
  return []
}

// 生成UUID
tool.snowyUuid = () => {
  let uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, (c) => {
    let r = (Math.random() * 16) | 0,
      v = c === 'x' ? r : (r & 0x3) | 0x8
    return v.toString(16)
  })
  // 首字符转换成字母
  return 'xn' + uuid.slice(2)
}

// 格式化金额
tool.formatMoney = (number, places, symbol = '￥', thousand = ',', decimal = '.') => {
  number = number || 0
  places = !isNaN((places = Math.abs(places))) ? places : 2
  const negative = number < 0 ? '-' : ''
  const i = parseInt((number = Math.abs(+number || 0).toFixed(places)), 10) + ''
  let j = i.length
  j = j > 3 ? j % 3 : 0
  return (
    symbol +
    negative +
    (j ? i.substr(0, j) + thousand : '') +
    i.substr(j).replace(/(\d{3})(?=\d)/g, '$1' + thousand) +
    (places
      ? decimal +
        Math.abs(number - i)
          .toFixed(places)
          .slice(2)
      : '')
  )
}

// 格式化日期
tool.formatDate = (date) => {
  return dayjs(date, 'YYYY-MM-DD').format('YYYY 年 MM 月 DD 日')
}

export default tool
