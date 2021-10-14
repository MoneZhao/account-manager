import { isExternal } from '@/utils/validate'
import Layout from '@/layout'
import { getAction } from '@/api/manage'

export function getDicts(codeTypeIds) {
  return getAction('/sys/codeInfo/getSysCodeInfos', { codeTypeIds })
}

export function formatDictText(dicts, values) {
  if (!(Array.isArray(dicts) && dicts.length > 0)) {
    return values
  }
  if (!values) {
    return ''
  }
  const valueArr = values.split(',')
  const contentArr = []
  dicts.forEach(dict => {
    for (let i = 0; i < valueArr.length; i++) {
      if (valueArr[i] === dict.value) {
        contentArr.push(dict.content)
        break
      }
    }
  })
  return contentArr.toString()
}

export function formatMoney(number, places, symbol = '￥', thousand = ',', decimal = '.') {
  number = number || 0
  places = !isNaN(places = Math.abs(places)) ? places : 2
  const negative = number < 0 ? '-' : ''
  const i = parseInt(number = Math.abs(+number || 0).toFixed(places), 10) + ''
  let j = i.length
  j = j > 3 ? j % 3 : 0
  return symbol + negative + (j ? i.substr(0, j) + thousand : '') +
    i.substr(j).replace(/(\d{3})(?=\d)/g, '$1' + thousand) +
    (places ? decimal + Math.abs(number - i).toFixed(places).slice(2) : '')
}
