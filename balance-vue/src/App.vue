<template>
  <div id="app">
    <router-view />
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style lang="less">
/*element bug 高分屏错位*/
body .el-table th.gutter {
  display: table-cell !important;
}
.el-table__fixed-right {
  top: 0px;
  left: auto;
  right: 0px;
  border-left: 1px solid rgb(223, 230, 236);
  box-sizing: content-box;
}
</style>
