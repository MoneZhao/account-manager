import user from './user'
import codeInfo from './codeInfo'
import config from './config'
import codeType from './codeType'
import menu from './menu'
import func from './func'
import org from './org'
import role from './role'
import log from './log'
import codeCreate from './codeCreate'
import picUpDown from './picUpDown'
import post from './post'
import jobLog from './jobLog'
import job from './job'

export default [
  {
    url: '/sys/useCaptcha', type: 'get', response: config => {
      return { 'code': 200, 'msg': '1', 'data': null }
    }
  },
  {
    url: '/sys/login', type: 'post', response: config => {
      return {
        'code': 200,
        'msg': '操作成功',
        'data': {
          'code': 200,
          'msg': '操作成功',
          'data': {
            'token': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkYXRlIjoxNjYxOTk3ODAwLCJ1c2VySWQiOiJtb25lemhhbyJ9.O8nymZR_1V2dLyUluQmaSkeyByvFocjJaxy4-Gu_Pzo'
          }
        }
      }
    }
  },
  {
    url: '/sys/logout', type: 'post', response: config => {
      return { 'code': 200, 'msg': '注销成功！', 'data': null }
    }
  },
  {
    url: '/sys/monitor/server/getServerInfo', type: 'get', response: config => {
      return {
        'code': 200,
        'msg': '操作成功',
        'data': {
          'cpu': {
            'cpuNum': 8,
            'total': 80900.0,
            'sys': 11.87,
            'used': 23.73,
            'wait': 0.0,
            'free': 64.4
          },
          'mem': { 'total': 16.0, 'used': 10.29, 'free': 5.71, 'usage': 64.34 },
          'jvm': {
            'total': 1580.0,
            'max': 3641.0,
            'free': 799.26,
            'version': '1.8.0_231',
            'home': '/Library/Java/JavaVirtualMachines/jdk1.8.0_231.jdk/Contents/Home/jre',
            'name': 'Java HotSpot(TM) 64-Bit Server VM',
            'startTime': '2022-09-01 09:56:20',
            'usage': 49.41,
            'used': 780.74,
            'runTime': '0天1小时42分钟'
          },
          'sys': {
            'computerName': 'zhaoyimingdeMacBook-Pro',
            'computerIp': '192.168.51.202',
            'userDir': '/Users/monezhao/Movies/balance',
            'osName': 'Mac OS X',
            'osArch': 'x86_64'
          },
          'sysFiles': [
            {
              'dirName': '/',
              'sysTypeName': 'apfs',
              'typeName': 'Macintosh HD',
              'total': '233.5 GB',
              'free': '43.4 GB',
              'used': '190.0 GB',
              'usage': 81.4
            },
            {
              'dirName': '/System/Volumes/Data',
              'sysTypeName': 'apfs',
              'typeName': 'Macintosh HD - 数据',
              'total': '233.5 GB',
              'free': '43.4 GB',
              'used': '190.0 GB',
              'usage': 81.4
            },
            {
              'dirName': '/private/var/vm',
              'sysTypeName': 'apfs',
              'typeName': 'VM',
              'total': '233.5 GB',
              'free': '43.4 GB',
              'used': '190.0 GB',
              'usage': 81.4
            }
          ]
        }
      }
    }
  },
  ...user,
  ...menu,
  ...func,
  ...org,
  ...log,
  ...role,
  ...codeInfo,
  ...codeCreate,
  ...config,
  ...codeType,
  ...post,
  ...picUpDown,
  ...job,
  ...jobLog
]
