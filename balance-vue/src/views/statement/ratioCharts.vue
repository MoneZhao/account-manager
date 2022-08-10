<template>
  <Echart id="ratioChart" :options="options" height="60vh" width="100%" style="max-height: 640px;" />
</template>

<script>
import Echart from '@/common/echart'
export default {
  components: {
    Echart
  },
  props: {
    cdata: {
      type: Object,
      default: () => ({})
    }
  },
  data() {
    return {
      options: {}
    }
  },
  watch: {
    cdata: {
      handler(newData) {
        this.options = {
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
                formatter: params => {
                  console.log(params.data)
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
      },
      immediate: true,
      deep: true
    }
  }
}
</script>

<style lang="scss" scoped></style>
