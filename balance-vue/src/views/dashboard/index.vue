<template>
  <div class="home-page">
    <el-row :gutter="8" class="head-info">
      <el-col :span="12">
        <el-card class="head-info-card box-card" shadow="hover">
          <el-row :span="12">
            <div class="head-info-avatar">
              <img v-if="avatar" alt="头像" :src="avatar">
              <img v-else alt="头像" :src="defaultAvatar">
            </div>
            <div class="head-info-count">
              <div class="head-info-welcome">
                {{ welcomeMessage }}
              </div>
              <div class="head-info-desc">
                <el-row :span="24">
                  <el-col :span="8">部门: {{ sysOrg ? sysOrg.orgName : "暂无部门" }}</el-col>
                  <el-col :span="6">角色: {{ sysRole ? sysRole.roleName : "暂无角色" }}</el-col>
                  <el-col :span="10">本机IP: {{ ipAddr }}</el-col>
                </el-row>
              </div>
            </div>
          </el-row>
          <el-divider />
          <el-row :span="12">
            <div>
              <el-row>
                <el-col :span="8">
                  <head-info title="今日登录IP" :content="todayIp" />
                </el-col>
                <el-col :span="8">
                  <head-info title="今日登录次数" :content="todayVisitCount" />
                </el-col>
                <el-col :span="8">
                  <head-info title="总登录次数" :content="totalVisitCount" />
                </el-col>
              </el-row>
            </div>
          </el-row>
        </el-card>
      </el-col>
      <el-col :span="12">
        <el-card class="head-info-card box-card" shadow="hover">
          <div slot="header" class="clearfix">
            <span>快捷方式</span>
          </div>
          <span>
            <div
              v-for="(value, index) in menuList"
              :key="index"
              style="float: left"
            >
              <router-link
                :to="value.path"
                :class="['pan-btn', colorList[index % 7]]"
              >
                <svg-icon :icon-class="value.icon" />
                {{ value.name }}
              </router-link>
            </div>
          </span>
        </el-card>
      </el-col>
    </el-row>
    <el-row :gutter="8" class="count-info">
      <el-col :span="18" class="visit-count-wrapper">
        <el-card class="visit-count box-card" shadow="hover">
          <div id="dashboard_chart" style="height: 400px" />
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card shadow="hover">
          <el-descriptions title="近七日访问IP" class="ipItem" :column="1" border>
            <el-descriptions-item
              v-for="(item,index) in ipList"
              :key="item"
              :label="index + 1"
              :label-style="{'text-align':'center','font-size': '16px'}"
              :content-style="{'text-align':'center','font-size': '16px'}"
            >
              {{ item }}
            </el-descriptions-item>
          </el-descriptions>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>
<script>
import { mapGetters } from 'vuex'
import HeadInfo from '@/components/HeadInfo'
import { getAction, postAction } from '@/api/manage'

export default {
  name: 'Dashboard',
  components: { HeadInfo },
  data() {
    return {
      ipAddr: '',
      todayIp: 0,
      todayVisitCount: 0,
      totalVisitCount: 0,
      colorList: [
        'blue-btn',
        'red-btn',
        'light-blue-btn',
        'pink-btn',
        'green-btn',
        'tiffany-btn',
        'yellow-btn'
      ],
      welcomeMessage: '',
      ipList: []
    }
  },
  computed: {
    ...mapGetters([
      'avatar',
      'defaultAvatar',
      'name',
      'sysUser',
      'sysRole',
      'sysOrg',
      'menuList'
    ])
  },
  created() {
    this.ipAddr = this.getIpAddr()
  },
  mounted() {
    this.welcomeMessage = this.welcome()
    this.getChart()
  },
  methods: {
    welcome() {
      const date = new Date()
      const hour = date.getHours()
      const time = hour < 6 ? '早上好' : (hour <= 11 ? '上午好' : (hour <= 13 ? '中午好' : (hour <= 18 ? '下午好' : '晚上好')))
      const welcomeArr = [
        '喝杯咖啡休息下吧☕',
        '要不要和朋友约个饭',
        '几天没见又更好看了呢😍',
        '今天又写了几个Bug🐞呢',
        '今天在群里吹水了吗',
        '今天吃了什么好吃的呢',
        '今天您微笑了吗😊',
        '今天帮助别人解决问题了吗',
        '准备吃些什么呢',
        '周末要不要去看电影？'
      ]
      const index = Math.floor((Math.random() * welcomeArr.length))
      return `${time}，${this.name}，${welcomeArr[index]}`
    },
    getIpAddr() {
      getAction('/actuator/getRequestIp').then((r) => {
        this.ipAddr = r.msg
      })
    },
    getChart() {
      postAction(`/sys/user/index`, this.sysUser).then((r) => {
        const data = r.data
        this.todayIp = data.todayIp
        this.todayVisitCount = data.todayVisitCount
        this.totalVisitCount = data.totalVisitCount
        this.ipList = data.lastSevenVisitIp
        const sevenVisitCount = []
        const dateArr = []
        for (let i = 6; i >= 0; i--) {
          // const time = this.$moment('2020-06-05', 'YYYY-MM-DD').subtract(i, 'days').format('MM-DD')
          const time = this.$moment().subtract(i, 'days').format('MM-DD')
          let contain = false
          for (const o of data.lastSevenVisitCount) {
            if (o.days === time) {
              contain = true
              sevenVisitCount.push(o.count)
            }
          }
          if (!contain) {
            sevenVisitCount.push(0)
          }
          dateArr.push(time)
        }
        const sevenUserVisitCount = []
        for (let i = 6; i >= 0; i--) {
          // const time = this.$moment('2020-06-05', 'YYYY-MM-DD').subtract(i, 'days').format('MM-DD')
          const time = this.$moment().subtract(i, 'days').format('MM-DD')
          let contain = false
          for (const o of data.lastSevenUserVisitCount) {
            if (o.days === time) {
              contain = true
              sevenUserVisitCount.push(o.count)
            }
          }
          if (!contain) {
            sevenUserVisitCount.push(0)
          }
        }
        const chart = this.$echarts.init(document.getElementById('dashboard_chart'))
        chart.setOption({
          title: {
            text: '近七日系统登录记录',
            left: 'left'
          },
          xAxis: {
            name: '日期',
            nameTextStyle: {// 名称样式
              fontSize: 14,
              color: '#333333',
              fontWeight: 'bold'
            },
            data: dateArr
          },
          yAxis: {
            name: '访问数量',
            nameTextStyle: {// 名称样式
              fontSize: 14,
              color: '#333333',
              fontWeight: 'bold'
            },
            minInterval: 1
          },
          legend: {
            data: ['您', '总数']
          },
          tooltip: {
            trigger: 'axis',
            axisPointer: {
              type: 'shadow'
            }
          },
          series: [
            {
              name: '您',
              type: 'bar',
              barWidth: '30%', // 柱图宽度
              barGap: '10%', // 柱图间距
              data: sevenUserVisitCount
            },
            {
              name: '总数',
              type: 'bar',
              barWidth: '30%', // 柱图宽度
              barGap: '10%', // 柱图间距
              data: sevenVisitCount
            }
          ]
        })
      }).catch((r) => {
        console.error(r)
        this.$message.error('获取首页信息失败')
      })
    }
  }
}
</script>
<style lang="scss" scoped>
.home-page {
  .head-info {
    padding: 10px;
    .head-info-card {
      padding: 0.5rem;
      border-color: #f1f1f1;
      min-height: 280px;
      .head-info-avatar {
        display: inline-block;
        float: left;
        margin-right: 1rem;
        img {
          width: 5rem;
          border-radius: 2px;
        }
      }
      .head-info-count {
        display: inline-block;
        float: left;
        width: 80%;
        .head-info-welcome {
          font-size: 1.05rem;
          margin-bottom: 1rem;
        }
        .head-info-desc {
          color: #555555;
          font-size: 0.95rem;
          padding: 0.2rem 0;
        }
      }
    }
  }
  .count-info {
    padding: 0px 10px;
    .visit-count-wrapper {
      .visit-count {
        border-color: #f1f1f1;
      }
    }
  }
}
.pan-btn {
  width: 170px;
  height: 55px;
  line-height: 30px;
  text-align: center;
  font-size: 16px;
  margin: 5px;
}
.ipItem {
  margin-bottom: 18px;
  height: 382px;
}
</style>
