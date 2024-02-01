<template>
  <a-card :bordered="false">
    <a-form ref="searchFormRef" name="advanced_search" :model="searchFormState" class="ant-advanced-search-form">
      <a-row :gutter="24">
        <a-col :md="8" :lg="6">
          <a-form-item label="账户类型" name="balanceType">
            <a-select
              v-model:value="searchFormState.balanceType"
              placeholder="请选择账户类型"
              :options="codeInfoIdOptions"
              @change="getChart"
            />
          </a-form-item>
        </a-col>
        <a-col :md="10" :lg="6">
          <a-form-item label="记录时间" name="accountDate">
            <a-range-picker
              v-model:value="searchFormState.accountDate"
              picker="month"
              value-format="YYYY-MM"
              format="YYYY年MM月"
              :disabled-date="disabledDate"
              :ranges="ranges"
              @change="getChart"
              :allow-clear="false"
            />
          </a-form-item>
        </a-col>
      </a-row>
    </a-form>
    <div id="line_chart" style="width: 95%; height: 55vh; min-height: 300px; margin: 0 0.1rem" />
  </a-card>
</template>

<script setup name="statementdetail">
  import dayjs from 'dayjs'
  import tool from '@/utils/tool'
  import bizBalanceStatementApi from '@/api/biz/bizBalanceStatementApi'
  import { onMounted } from 'vue'
  import * as echarts from 'echarts'

  let searchFormState = reactive({})
  const searchFormRef = ref()
  const codeInfoIdOptions = tool.dictList('BALANCE_TYPE')
  let chart = undefined
  const disabledDate = (current) => {
    return current > dayjs().add(1, 'days')
  }
  const ranges = ref({
    今年至今: [dayjs(new Date(new Date().getFullYear(), 0)), dayjs()],
    最近一年: [dayjs().add(-1, 'y'), dayjs()],
    最近两年: [dayjs().add(-2, 'y'), dayjs()],
    最近四年: [dayjs().add(-4, 'y'), dayjs()]
  })
  const getChart = () => {
    const searchFormParam = JSON.parse(JSON.stringify(searchFormState))
    if (!searchFormParam.balanceType) {
      return
    }
    // accountDate范围查询条件重载
    if (searchFormParam.accountDate && searchFormParam.accountDate.length === 2) {
      searchFormParam.startMonth = searchFormParam.accountDate[0]
      searchFormParam.endMonth = dayjs(searchFormParam.accountDate[1] + '-01', 'YYYY-MM-DD')
        .add(1, 'months')
        .add(-1, 'days')
        .format('YYYY-MM')
    } else {
      return
    }
    delete searchFormParam.accountDate
    bizBalanceStatementApi.queryDetail(searchFormParam).then((data) => {
      let legend = []
      if (data && data.y) {
        legend = data.y.map((e) => e.name)
        data.y.map((item) => {
          item.label = {
            normal: {
              show: true, //开启显示
              position: 'top'
            }
          }
        })
      }
      if (!chart) {
        chart = echarts.init(document.getElementById('line_chart'))
        window.addEventListener('resize', () => {
          chart.resize()
        })
      }
      chart.clear()
      chart.setOption({
        title: {
          text: data.title,
          left: 'center'
        },
        xAxis: {
          name: data.xtitle,
          nameTextStyle: {
            // 名称样式
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
          left: 'right',
          data: legend
        },
        yAxis: {
          type: 'value',
          name: data.ytitle,
          nameTextStyle: {
            // 名称样式
            fontSize: 14,
            color: '#333333',
            fontWeight: 'bold'
          },
          axisLabel: {
            formatter: '￥{value}'
          }
        },
        toolbox: {
          left: 'right',
          top: 'middle',
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
        dataZoom: [
          {
            type: 'slider',
            show: true
          },
          {
            // 鼠标滚轮在区域内不能控制外部滚动条
            type: 'inside',
            // 滚轮是否触发缩放
            zoomOnMouseWheel: false,
            // 鼠标滚轮触发滚动
            moveOnMouseMove: true,
            moveOnMouseWheel: true
          }
        ],
        series: data.y
      })
    })
  }
  const reset = () => {
    const end = new Date()
    const start = new Date(new Date().getFullYear(), 0)
    searchFormState.accountDate = [dayjs(start).format('YYYY-MM'), dayjs(end).format('YYYY-MM')]
  }
  onMounted(() => {
    reset()
  })
</script>
