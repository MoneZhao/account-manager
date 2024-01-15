<template>
  <xn-form-container
    :title="props.monthName + ' - 账户详情 - ￥' + props.balanceMain"
    width="60%"
    :visible="visible"
    @close="onClose"
  >
    <div id="ratioChart" style="height: 60vh; width: 100%; max-height: 640px" />
    <template #footer>
      <a-button style="margin-right: 8px" @click="onClose">关闭</a-button>
    </template>
  </xn-form-container>
</template>

<script setup name="radioChart">
  import * as echarts from 'echarts'
  import bizBalanceStatementApi from '@/api/biz/bizBalanceStatementApi'
  // 抽屉状态
  const visible = ref(false)
  const props = ref({})
  let chart = undefined
  const getOption = (newData) => {
    return {
      tooltip: {
        trigger: 'item',
        formatter: '{a}<br/>{b} : ￥{c} ({d}%)'
      },
      legend: {
        type: 'scroll',
        orient: 'vertical',
        right: 10,
        top: 40,
        bottom: 10,
        data: newData.legendData,
        selected: newData.selectedData
      },
      series: [
        {
          name: '详情信息',
          type: 'pie',
          radius: '55%',
          center: ['40%', '55%'],
          data: newData.seriesData,
          label: {
            formatter: (params) => {
              const res = params.data.name + ' : ￥' + params.data.value
              return params.data.countType === '1' ? res : res + ' (不计入)'
            }
          },
          emphasis: {
            itemStyle: {
              shadowBlur: 10,
              shadowOffsetX: 0,
              shadowColor: '#999'
            }
          }
        }
      ]
    }
  }
  // 打开抽屉
  const onOpen = (monthName, monthValue, balanceMain, queryType) => {
    props.value.monthName = monthName
    props.value.balanceMain = balanceMain
    visible.value = true
    const params = {
      statementDate: monthValue,
      queryType: queryType
    }
    bizBalanceStatementApi.listStatement(params).then((data) => {
      if (!chart) {
        chart = echarts.init(document.getElementById('ratioChart'))
        window.addEventListener('resize', () => {
          chart.resize()
        })
      }
      const obj = {
        legendData: [],
        seriesData: [],
        selectedData: {}
      }
      data.map((item, index) => {
        obj.legendData.push(item.balanceName)
        const oneObj = {
          name: item.balanceName,
          value: item.account,
          countType: item.countType
        }
        obj.seriesData.push(oneObj)
        obj.selectedData[item.balanceName] = index < 10
      })
      chart.setOption(getOption(obj), true)
    })
  }
  // 关闭抽屉
  const onClose = () => {
    if (!chart) {
      chart.clear()
    }
    visible.value = false
  }
  // 抛出函数
  defineExpose({
    onOpen
  })
</script>
