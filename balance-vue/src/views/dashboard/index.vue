<template>
  <div class="home-page">
    <el-row :gutter="8" class="head-info">
      <el-col :span="12">
        <el-card class="head-info-card box-card" shadow="hover">
          <el-row :span="12">
            <div class="head-info-avatar">
              <img alt="头像" :src="avatar">
            </div>
            <div class="head-info-count">
              <div class="head-info-welcome">
                {{ welcomeMessage }}
              </div>
              <div class="head-info-desc">
                <p>
                  {{ sysOrg ? sysOrg.orgName : "暂无部门" }} |
                  {{ sysRole ? sysRole.roleName : "暂无角色" }}
                </p>
              </div>
            </div>
          </el-row>
          <el-divider />
          <el-row :span="12">
            <div>
              <el-row>
                <el-col :span="8">
                  <head-info title="今日IP" :content="todayIp" />
                </el-col>
                <el-col :span="8">
                  <head-info title="今日访问" :content="todayVisitCount" />
                </el-col>
                <el-col :span="8">
                  <head-info title="总访问量" :content="totalVisitCount" />
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
      <el-col :span="24" class="visit-count-wrapper">
        <el-card class="visit-count box-card" shadow="hover">
          <div id="dashboard_chart" style="height: 400px" />
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
      todayIp: 0,
      todayVisitCount: 0,
      totalVisitCount: 0,
      menuList: [],
      colorList: [
        'blue-btn',
        'red-btn',
        'light-blue-btn',
        'pink-btn',
        'green-btn',
        'tiffany-btn',
        'yellow-btn'
      ],
      welcomeMessage: ''
    }
  },
  computed: {
    ...mapGetters([
      'avatar',
      'name',
      'sysUser',
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
      postAction(`/sys/user/index`, this.sysUser).then((r) => {
        const data = r.data
        this.todayIp = data.todayIp
        this.todayVisitCount = data.todayVisitCount
        this.totalVisitCount = data.totalVisitCount
        this.menuList = data.menuList
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
            text: '近七日系统访问记录',
            left: 'left'
          },
          xAxis: {
            data: dateArr
          },
          yAxis: {
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
      min-height: 260px;
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
          margin-bottom: 0.1rem;
        }
        .head-info-desc {
          color: rgba(0, 0, 0, 0.45);
          font-size: 0.8rem;
          padding: 0.2rem 0;
          p {
            margin-bottom: 0;
          }
        }
        .head-info-time {
          color: rgba(0, 0, 0, 0.45);
          font-size: 0.8rem;
          padding: 0.2rem 0;
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
.pan-btn {
  width: 170px;
  height: 55px;
  line-height: 30px;
  text-align: center;
  font-size: 16px;
  margin: 5px;
}
</style>
