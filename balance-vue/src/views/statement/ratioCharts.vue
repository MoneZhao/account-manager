<template>
  <Echart id="ratioChart" :options="options" height="320px" width="100%" />
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
            formatter: '{a} <br/>{b} : ￥{c} - ({d}%)'
          },
          legend: {
            type: 'scroll',
            orient: 'vertical',
            right: 10,
            top: 40,
            bottom: 10,
            data: newData.legendData,
            selected: newData.selectdData
          },
          series: [
            {
              name: '详情信息',
              type: 'pie',
              radius: '55%',
              center: ['40%', '55%'],
              data: newData.seriesData,
              label: {
                formatter: '{b} : ￥{c}'
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
