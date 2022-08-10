<template>
  <div class="app-container">
    <div class="filter-container">
      <el-card style="border-color: #f1f1f1;" shadow="hover">
        <span style="margin-left:4rem">查询范围：</span>
        <el-date-picker
          v-model="temp.value"
          :editable="false"
          type="monthrange"
          align="right"
          unlink-panels
          range-separator="-"
          start-placeholder="开始月份"
          end-placeholder="结束月份"
          format="yyyy 年 MM 月"
          value-format="yyyy-MM"
          :picker-options="pickerOptions"
          @change="onChange"
        />
      </el-card>
      <el-card style="border-color: #f1f1f1;" shadow="hover">
        <div id="line_chart" style="width: 95%;height: 55vh;margin: 0 .1rem" />
      </el-card>
    </div>

    <el-dialog :title="title" :visible.sync="dialogVisible" width="80%" :before-close="handleClose">
      <RatioChart v-if="dialogVisible" :cdata="ratioData" />
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">关 闭</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { getAction, postAction } from '@/api/manage'
import RatioChart from '../ratioCharts'

export default {
  'name': 'StatementTable',
  components: {
    RatioChart
  },
  data() {
    return {
      temp: {
        value: []
      },
      pickerOptions: {
        disabledDate(time) {
          const now = new Date()
          return time.getTime() > now.setMonth(now.getMonth() + 1)
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
      },
      yearMonth: {
        name: '',
        value: ''
      },
      balanceMain: undefined,
      ratioData: {
        legendData: [],
        selectedData: [],
        seriesData: []
      },
      dialogVisible: false,
      chart: undefined
    }
  },
  computed: {
    title() {
      return this.yearMonth.name + ' - 账户详情 - ￥' + this.balanceMain
    }
  },
  mounted() {
    const end = new Date()
    const start = new Date(new Date().getFullYear(), 0)
    this.$set(this.temp, 'value', [this.$moment(start).format('YYYY-MM'), this.$moment(end).format('YYYY-MM')])
    this.getChart()
  },
  methods: {
    handleClose() {
      this.dialogVisible = false
    },
    onChange() {
      if (this.temp.value && this.temp.value.length === 2) {
        this.getChart()
      }
    },
    formatYearMonth(month) {
      if (!month.includes('年')) {
        month = this.temp.value[0].split('-')[0] + '年' + month
      }

      this.yearMonth.name = month
      month = month.substring(0, 7)
      this.yearMonth.value = month.replace('年', '-')

      this.getRatioData()
      this.dialogVisible = true
    },
    async getRatioData() {
      const obj = {
        legendData: [],
        seriesData: [],
        selectedData: {}
      }
      const params = {
        statementDate: this.yearMonth.value
      }
      const {
        data
      } = await getAction('sys/balanceDetail/listStatement', params)
      data.map((item, index) => {
        obj.legendData.push(item.balanceName)
        const oneObj = {
          name: item.balanceName,
          value: item.account,
          countType: item.countType
        }
        obj.seriesData.push(oneObj)
        obj.selectedData[item.equipmentName] = index < 20
      })
      this.ratioData = obj
    },
    getChart() {
      postAction(`/sys/statement/query`, {
        startMonth: this.temp.value[0],
        endMonth: this.temp.value[1]
      }).then((r) => {
        const data = r.data
        const legend = data.y.map(e => e.name)
        if (!this.chart) {
          this.chart = this.$echarts.init(document.getElementById('line_chart'))
        }
        this.chart.setOption({
          title: {
            text: data.title,
            left: 'left'
          },
          xAxis: {
            name: data.xTitle,
            data: data.x,
            axisPointer: {
              type: 'shadow'
            },
            axisLabel: {
              interval: 0,
              rotate: 40
            }
          },
          legend: {
            data: legend
          },
          yAxis: {
            type: 'value',
            name: data.yTitle,
            axisLabel: {
              formatter: '￥{value}'
            }
          },
          toolbox: {
            feature: {
              dataView: { show: true, readOnly: true },
              saveAsImage: { show: true }
            }
          },
          tooltip: {
            trigger: 'axis',
            axisPointer: {
              type: 'cross',
              crossStyle: {
                color: '#999'
              }
            }
          },
          series: data.y
        })
        window.addEventListener('resize', () => {
          this.chart.resize()
        })
        this.chart.getZr().on('click', params => {
          const pointInPixel = [params.offsetX, params.offsetY]
          if (this.chart.containPixel('grid', pointInPixel)) {
            const xIndex = this.chart.convertFromPixel({ seriesIndex: 0 }, [params.offsetX, params.offsetY])[0]
            const handleIndex = Number(xIndex)
            // 获得图表中点击的列
            const month = this.chart.getOption().xAxis[0].data[handleIndex]
            const value = this.chart.getOption().series[0].data[handleIndex]
            this.balanceMain = value
            this.formatYearMonth(month)
            this.chart._dom.childNodes[1].style.display = 'none'
          }
        })
      })
    }
  }
}
</script>

<style lang="scss" scoped>
</style>
