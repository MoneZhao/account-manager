<template>
  <div class="home-page">
    <el-row :gutter="8" class="head-info">
      <el-card class="head-info-card">
        <el-col :span="12">
          <div class="head-info-avatar">
            <img alt="头像" :src="avatar">
          </div>
          <div class="head-info-count">
            <div class="head-info-welcome">
              {{ welcomeMessage }}
            </div>
            <div class="head-info-desc">
              <p>{{ sysOrg ? sysOrg.orgName : '暂无部门' }} | {{ sysRole ? sysRole.roleName : '暂无角色' }}</p>
            </div>
          </div>
        </el-col>
        <el-col :span="12">
          <div>
            <el-row class="more-info">
              <el-col :span="12" />
              <el-col :span="4">
                <head-info title="今日IP" :content="todayIp" />
              </el-col>
              <el-col :span="4">
                <head-info title="今日访问" :content="todayVisitCount" />
              </el-col>
              <el-col :span="4">
                <head-info title="总访问量" :content="totalVisitCount" />
              </el-col>
            </el-row>
          </div>
        </el-col>
      </el-card>
    </el-row>
    <el-row :gutter="8" class="count-info">
      <el-col :span="24" class="visit-count-wrapper">
        <el-card class="visit-count">
          <apex-chart ref="count" type="bar" height="400" :options="chartOptions" :series="series" />
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>
<script>
import { mapGetters } from 'vuex'
import HeadInfo from '@/components/HeadInfo'
import { postAction } from '@/api/manage'

export default {
  name: 'Dashboard',
  components: { HeadInfo },
  data() {
    return {
      series: [],
      chartOptions: {
        chart: {
          toolbar: {
            show: false
          }
        },
        plotOptions: {
          bar: {
            horizontal: false,
            columnWidth: '50%'
          }
        },
        dataLabels: {
          enabled: true
        },
        stroke: {
          show: true,
          width: 2,
          colors: ['transparent']
        },
        xaxis: {
          categories: []
        },
        fill: {
          opacity: 1
        }
      },
      todayIp: 0,
      todayVisitCount: 0,
      totalVisitCount: 0,
      welcomeMessage: ''
    }
  },
  computed: {
    ...mapGetters([
      'avatar',
      'name',
      'sysRole',
      'sysOrg'
    ])
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
        '要不要和朋友打局LOL',
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
    getChart() {
      const params = {
        userName: this.name
      }
      postAction(`/sys/user/index`, params).then((r) => {
        const data = r.data
        this.todayIp = data.todayIp
        this.todayVisitCount = data.todayVisitCount
        this.totalVisitCount = data.totalVisitCount
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
        this.$refs.count.updateSeries([
          {
            name: '您',
            data: sevenUserVisitCount
          },
          {
            name: '总数',
            data: sevenVisitCount
          }
        ], true)
        this.$refs.count.updateOptions({
          xaxis: {
            categories: dateArr
          },
          title: {
            text: '近七日系统访问记录',
            align: 'left'
          }
        }, true, true)
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
        padding: .5rem;
        border-color: #f1f1f1;
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
          .head-info-welcome {
            font-size: 1.05rem;
            margin-bottom: .1rem;
          }
          .head-info-desc {
            color: rgba(0, 0, 0, 0.45);
            font-size: .8rem;
            padding: .2rem 0;
            p {
              margin-bottom: 0;
            }
          }
          .head-info-time {
            color: rgba(0, 0, 0, 0.45);
            font-size: .8rem;
            padding: .2rem 0;
          }
        }
      }
    }
    .count-info {
      padding: 10px;
      .visit-count-wrapper {
        .visit-count {
          border-color: #f1f1f1;
        }
      }
    }
  }
</style>
