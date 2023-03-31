<template>
  <div class="app-container">
    <div class="filter-container">
      <el-card style="border-color: #f1f1f1;margin-bottom: 5px" shadow="hover">
        <span style="margin-left:4rem">账户类型：</span>
        <el-select v-model="temp.balanceType" placeholder="账户类型" class="filter-item" @change="onChange"><el-option v-for="(item, index) in dicts.balanceType" :key="index" :label="item.content" :value="item.value" /></el-select>
        <span style="margin-left:2rem">查询范围：</span>
        <el-date-picker
          v-model="temp.value"
          :editable="false"
          :clearable="false"
          type="monthrange"
          align="right"
          unlink-panels
          range-separator="-"
          start-placeholder="开始月份"
          end-placeholder="结束月份"
          format="yyyy 年 MM 月"
          value-format="yyyy-MM"
          :picker-options="pickerOptions"
          style="width: 245px"
          @change="onChange"
        />
      </el-card>
      <el-card style="border-color: #f1f1f1;" shadow="hover">
        <div id="line_chart" style="width: 95%;height: 55vh;margin: 0 .1rem" />
      </el-card>
    </div>

    <el-dialog :title="`${yearMonth.name} - 账户详情`" :visible.sync="dialogVisible" width="80%" :before-close="handleClose">
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
      dicts: [],
      temp: {
        value: [],
        balanceType: ''
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
        vaue: ''
      },
      ratioData: {
        legendData: [],
        selectdData: [],
        seriesData: []
      },
      dialogVisible: false,
      chart: undefined
    }
  },
  beforeCreate() {
    this.getDicts('balanceType').then(({ data }) => { this.dicts = data })
  },
  mounted() {
    const end = new Date()
    const start = new Date(new Date().getFullYear(), 0)
    this.$set(this.temp, 'value', [this.$moment(start).format('YYYY-MM'), this.$moment(end).format('YYYY-MM')])
    // this.getChart()
  },
  methods: {
    handleClose() {
      this.dialogVisible = false
    },
    onChange() {
      if (this.temp.value && this.temp.value.length === 2 && this.temp.balanceType) {
        this.getChart()
      }
    },
    getChart() {
      postAction(`/sys/statement/detail/query`, {
        startMonth: this.temp.value[0],
        endMonth: this.temp.value[1],
        balanceType: this.temp.balanceType
      }).then((r) => {
        const data = r.data
        const legend = data.y.map(e => e.name)
        if (!this.chart) {
          this.chart = this.$echarts.init(document.getElementById('line_chart'))
          window.addEventListener('resize', () => {
            this.chart.resize()
          })
        }
        this.chart.setOption({
          title: {
            text: data.title,
            left: 'left'
          },
          xAxis: {
            name: data.xtitle,
            nameTextStyle: {// 名称样式
              fontSize: 14,
              color: '#333333',
              fontWeight: 'bold'
            },
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
            name: data.ytitle,
            nameTextStyle: {// 名称样式
              fontSize: 14,
              color: '#333333',
              fontWeight: 'bold'
            },
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
      })
    }
  }
}
</script>

<style lang="scss" scoped>
</style>
