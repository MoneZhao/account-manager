<template>
  <div class="app-container">
    <div class="filter-container">
      <el-card style="border-color: #f1f1f1;" shadow="hover">
        <span style="margin-left:70%">查询范围：</span>
        <el-date-picker
          v-model="value"
          :editable="false"
          type="monthrange"
          align="right"
          unlink-panels
          range-separator="至"
          start-placeholder="开始月份"
          end-placeholder="结束月份"
          format="yyyy 年 MM 月"
          value-format="yyyy-MM"
          :picker-options="pickerOptions"
          @change="onChange"
        />
      </el-card>
      <el-card style="border-color: #f1f1f1;" shadow="hover">
        <div id="line_chart" style="height: 600px" />
      </el-card>
    </div>
  </div>
</template>

<script>
import { postAction } from '@/api/manage'
import moment from 'moment'

export default {
  'name': 'StatementTable',
  data() {
    return {
      value: [],
      pickerOptions: {
        disabledDate(time) {
          return time.getTime() > Date.now() - 8.64e6
        },
        shortcuts: [{
          text: '今年至今',
          onClick(picker) {
            const end = new Date()
            const start = new Date(new Date().getFullYear(), 0)
            picker.$emit('pick', [start, end])
          }
        }, {
          text: '最近1年',
          onClick(picker) {
            const end = new Date()
            const start = new Date()
            start.setMonth(start.getMonth() - 12)
            picker.$emit('pick', [start, end])
          }
        }, {
          text: '最近2年',
          onClick(picker) {
            const end = new Date()
            const start = new Date()
            start.setMonth(start.getMonth() - 24)
            picker.$emit('pick', [start, end])
          }
        }]
      }
    }
  },
  mounted() {
    const end = new Date()
    const start = new Date(new Date().getFullYear(), 0)
    this.value[0] = this.$moment(start).format('YYYY-MM')
    this.value[1] = this.$moment(end).format('YYYY-MM')
    this.getChart()
  },
  methods: {
    onChange(e) {
      console.log(this.value)
      this.query = {
        startMonth: this.value[0],
        endMonth: this.value[1]
      }
      this.getChart()
    },
    getChart() {
      postAction(`/sys/statement/query`, {
        startMonth: this.value[0],
        endMonth: this.value[1]
      }).then((r) => {
        const data = r.data
        const chart = this.$echarts.init(document.getElementById('line_chart'))
        const legend = data.y.map(e => e.name)
        chart.setOption({
          title: {
            text: data.title,
            left: 'left'
          },
          xAxis: {
            name: data.xtitle,
            data: data.x,
            axisPointer: {
              type: 'shadow'
            }
          },
          legend: {
            data: legend
          },
          yAxis: {
            name: data.ytitle
          },
          tooltip: {
            trigger: 'axis',
            axisPointer: {
              type: 'shadow'
            }
          },
          series: data.y
        })
      }).catch((r) => {
        console.error(r)
        this.$message.error('获取报表失败')
      })
    }
  }
}
</script>

<style lang="scss" scoped>
</style>
