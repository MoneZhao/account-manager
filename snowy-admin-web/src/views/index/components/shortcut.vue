<template>
  <a-card :bordered="false">
    <template #title> 快捷方式 </template>
    <a-row :gutter="10">
      <a-col :span="6" :key="shortcut.id" v-for="(shortcut, index) in shortcutList">
        <shortcutCard
          :icon="shortcut.icon ? shortcut.icon : 'menu-outlined'"
          :label="shortcut.title"
          :color="getColor(index)"
          @click="leaveFor(shortcut.path)"
        />
      </a-col>
    </a-row>
  </a-card>
</template>

<script setup name="shortcut">
  import router from '@/router'
  import userCenterApi from '@/api/sys/userCenterApi'
  import shortcutCard from '@/components/ShortcutCard/index.vue'
  import { onMounted } from 'vue'
  const shortcutList = ref([])

  onMounted(() => {
    // 进来后执行查询
    getUserLoginWorkbench()
  })

  const getUserLoginWorkbench = () => {
    userCenterApi.userLoginWorkbench().then((data) => {
      shortcutList.value = JSON.parse(data).shortcut
    })
  }

  const leaveFor = (url = '/') => {
    router.replace({
      path: url
    })
  }

  // 颜色列表
  const colorList = ['#7265E6', '#FFBF00', '#00A2AE', '#F56A00', '#1890FF', '#606D80']
  const getColor = (index) => {
    return colorList[index % colorList.length]
  }
  // // 获取随机颜色
  // const randomColor = () => {
  //   return colorList[randomNum(0, colorList.length - 1)]
  // }
  // // 获取minNum到maxNum内的随机数
  // const randomNum = (minNum, maxNum) => {
  //   switch (arguments.length) {
  //     case 1:
  //       return parseInt(Math.random() * minNum + 1, 10)
  //       // eslint-disable-next-line no-unreachable
  //       break
  //     case 2:
  //       return parseInt(Math.random() * (maxNum - minNum + 1) + minNum, 10)
  //       // eslint-disable-next-line no-unreachable
  //       break
  //     default:
  //       return 0
  //       // eslint-disable-next-line no-unreachable
  //       break
  //   }
  // }
</script>

<style scoped>
  .ant-list-item {
    padding: 8px 0px !important;
  }
</style>
