<template>
  <a-card :bordered="false">
    <a-form ref="searchFormRef" name="advanced_search" :model="searchFormState" class="ant-advanced-search-form">
      <a-row :gutter="24">
        <a-col :md="6" :lg="6" :xl="6" :xxl="6">
          <a-form-item label="查询类别" name="queryType">
            <a-select v-model:value="searchFormState.queryType" placeholder="请选择查询类别" @change="queryTypeChange">
              <a-select-option v-for="item in queryTypes" :key="item.typeId" :value="item.typeId">
                {{ item.typeName }}
              </a-select-option>
            </a-select>
          </a-form-item>
        </a-col>
        <a-col :md="12" :lg="12" :xl="8" :xxl="6">
          <a-form-item label="记录时间" name="accountDate">
            <a-range-picker
              v-model:value="searchFormState.accountDate"
              :picker="pickerMod"
              :value-format="valueFormat"
              :format="format"
              :disabled-date="disabledDate"
              :ranges="ranges"
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
    <div id="line_chart" style="width: 95%; height: 65vh; min-height: 300px; margin: 0 0.1rem" />
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
  let pickerMod = $ref('month')
  let valueFormat = $ref('YYYY-MM')
  let format = $ref('YYYY年MM月')
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
    // 今年至今: [dayjs(new Date(new Date().getFullYear(), 0)), dayjs()],
    最近一年: [dayjs().add(-1, 'y'), dayjs()],
    最近两年: [dayjs().add(-2, 'y'), dayjs()],
    最近四年: [dayjs().add(-4, 'y'), dayjs()]
  })
  const getChart = () => {
    const searchFormParam = JSON.parse(JSON.stringify(searchFormState))
    // accountDate范围查询条件重载
    if (searchFormParam.accountDate && searchFormParam.accountDate.length === 2) {
      if (searchFormState.queryType == 0) {
        searchFormParam.startMonth = searchFormParam.accountDate[0]
        searchFormParam.endMonth = dayjs(searchFormParam.accountDate[1] + '-01', 'YYYY-MM-DD')
          .add(1, 'months')
          .add(-1, 'days')
          .format('YYYY-MM')
      } else {
        searchFormParam.startMonth = searchFormParam.accountDate[0] + '-01'
        searchFormParam.endMonth = searchFormParam.accountDate[1] + '-01'
      }
    }
    delete searchFormParam.accountDate
    bizBalanceStatementApi.query(searchFormParam).then((data) => {
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
        chart.getZr().on('click', (params) => {
          const pointInPixel = [params.offsetX, params.offsetY]
          if (chart.containPixel('grid', pointInPixel)) {
            const xIndex = chart.convertFromPixel({ seriesIndex: 0 }, [params.offsetX, params.offsetY])[0]
            const handleIndex = Number(xIndex)
            // 获得图表中点击的列
            const month = chart.getOption().xAxis[0].data[handleIndex]
            const value = chart.getOption().series[0].data[handleIndex]
            formatYearMonth(month, value)
            // chart._dom.childNodes[1].style.display = 'none'
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
    pickerMod = 'month'
    valueFormat = 'YYYY-MM'
    format = 'YYYY年MM月'
    const end = new Date()
    const start = new Date(new Date().getFullYear(), 0)
    searchFormState.accountDate = [dayjs(start).format('YYYY-MM'), dayjs(end).format('YYYY-MM')]
    getChart()
  }
  const queryTypeChange = () => {
    pickerMod = searchFormState.queryType != 0 ? 'year' : 'month'
    valueFormat = searchFormState.queryType != 0 ? 'YYYY' : 'YYYY-MM'
    format = searchFormState.queryType != 0 ? 'YYYY年' : 'YYYY年MM月'
    const end = new Date()
    const start = new Date(new Date().getFullYear(), 0)
    searchFormState.accountDate = [dayjs(start).format('YYYY-MM'), dayjs(end).format('YYYY-MM')]
    getChart()
  }
  onMounted(() => {
    reset()
  })
</script>
