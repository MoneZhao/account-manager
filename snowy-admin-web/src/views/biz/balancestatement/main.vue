<template>
  <a-card :bordered="false">
    <a-form ref="searchFormRef" name="advanced_search" :model="searchFormState" class="ant-advanced-search-form">
      <a-row :gutter="24">
        <a-col :span="6">
          <a-form-item label="查询类别" name="queryType">
            <a-select v-model:value="searchFormState.queryType" placeholder="请选择查询类别" @change="queryTypeChange">
              <a-select-option v-for="item in queryTypes" :key="item.typeId" :value="item.typeId">
                {{ item.typeName }}
              </a-select-option>
            </a-select>
          </a-form-item>
        </a-col>
        <a-col :span="6">
          <a-form-item label="记录时间" name="accountDate">
            <a-range-picker
              v-model:value="searchFormState.accountDate"
              picker="month"
              value-format="YYYY-MM"
              format="YYYY年MM月"
              :disabled-date="disabledDate"
              :ranges="ranges"
              :disabled="disabledDatePicker"
              :allow-clear="false"
              @change="getChart"
            />
          </a-form-item>
        </a-col>
        <a-col :span="6">
          <!-- <a-button type="primary" @click="getChart">查询</a-button> -->
          <a-button style="margin: 0 8px" @click="reset">重置</a-button>
        </a-col>
      </a-row>
    </a-form>
    <div id="line_chart" style="width: 95%; height: 55vh; margin: 0 0.1rem" />
    <RadioChart ref="radioChartRef" />
  </a-card>
</template>

<script setup name="statementmain">
  import dayjs from 'dayjs'
  import bizBalanceStatementApi from '@/api/biz/bizBalanceStatementApi'
  import { onMounted } from 'vue'
  import * as echarts from 'echarts'
  import RadioChart from './radioChart.vue'

  let searchFormState = reactive({})
  const searchFormRef = ref()
  let chart = undefined
  const queryTypes = [
    {
      typeId: '0',
      typeName: '月'
    },
    {
      typeId: '1',
      typeName: '年'
    }
  ]
  const disabledDate = (current) => {
    return current > dayjs().add(1, 'days')
  }
  const ranges = ref({
    今年至今: [dayjs(new Date(new Date().getFullYear(), 0)), dayjs()],
    最近一年: [dayjs().add(-1, 'y'), dayjs()],
    最近两年: [dayjs().add(-2, 'y'), dayjs()]
  })
  const getChart = () => {
    const searchFormParam = JSON.parse(JSON.stringify(searchFormState))
    // accountDate范围查询条件重载
    if (searchFormParam.accountDate && searchFormParam.accountDate.length === 2) {
      searchFormParam.startMonth = searchFormParam.accountDate[0]
      searchFormParam.endMonth = dayjs(searchFormParam.accountDate[1] + '-01', 'YYYY-MM-DD')
        .add(1, 'months')
        .add(-1, 'days')
        .format('YYYY-MM')
    }
    delete searchFormParam.accountDate
    bizBalanceStatementApi.query(searchFormParam).then((data) => {
      let legend = []
      if (data && data.y) {
        legend = data.y.map((e) => e.name)
      }
      if (!chart) {
        chart = echarts.init(document.getElementById('line_chart'))
        window.addEventListener('resize', () => {
          chart.resize()
        })
        chart.getZr().on('click', (params) => {
          const pointInPixel = [params.offsetX, params.offsetY]
          if (chart.containPixel('grid', pointInPixel)) {
            const xIndex = chart.convertFromPixel({ seriesIndex: 0 }, [params.offsetX, params.offsetY])[0]
            const handleIndex = Number(xIndex)
            // 获得图表中点击的列
            const month = chart.getOption().xAxis[0].data[handleIndex]
            const value = chart.getOption().series[0].data[handleIndex]
            formatYearMonth(month, value)
            chart._dom.childNodes[1].style.display = 'none'
          }
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
        series: data.y
      })
    })
  }
  const radioChartRef = ref()
  const formatYearMonth = (month, balanceMain) => {
    if (!month.includes('年')) {
      month = searchFormState.accountDate[0].split('-')[0] + '年' + month
    }
    let monthName = month
    month = month.substring(0, 7)
    let monthValue = month.replace('年', '-')
    radioChartRef.value.onOpen(monthName, monthValue, balanceMain, searchFormState.queryType)
  }
  const reset = () => {
    searchFormState.queryType = '0'
    disabledDatePicker.value = false
    const end = new Date()
    const start = new Date(new Date().getFullYear(), 0)
    searchFormState.accountDate = [dayjs(start).format('YYYY-MM'), dayjs(end).format('YYYY-MM')]
    getChart()
  }
  const disabledDatePicker = ref(false)
  const queryTypeChange = () => {
    disabledDatePicker.value = searchFormState.queryType != 0
    getChart()
  }
  onMounted(() => {
    reset()
  })
</script>
