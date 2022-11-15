<template>
  <el-dialog v-if="dialogVisible" custom-class="cron-box-dialog-first" :visible.sync="dialogVisible">
    <div slot="title" style="font-size:16px;color:#666666;">cron表达式生成器</div>
    <el-tabs v-model="activeName" tab-position="left" style="height: 310px;">
      <el-tab-pane label="快捷生成" name="first">
        <CronDefault v-if="activeName == 'first'" ref="CronDefault" />
      </el-tab-pane>
      <el-tab-pane label="自定义生成" name="second">
        <CronExc v-if="activeName == 'second'" ref="CronExc" />
      </el-tab-pane>
    </el-tabs>
    <div slot="footer">
      <el-button size="mini" type="primary" @click="confirmClick">确定</el-button>
      <el-button size="mini" @click="dialogVisible = false">取消</el-button>
    </div>
  </el-dialog>
</template>
<script>
import CronExc from '../cron-custom/index'
import CronDefault from '../cron-default/index'
export default {
  components: {
    CronExc,
    CronDefault
  },
  data() {
    return {
      dialogVisible: false,
      activeName: 'first',
      result: '' // 最终的结果表达式
    }
  },
  methods: {
    // 确定生成表达式
    confirmClick() {
      if (this.activeName == 'first') {
        this.result = this.$refs['CronDefault'].cronExpression
      } else {
        this.result = this.$refs['CronExc'].cronExpression
      }
      this.$emit('cronResult', this.result)
      this.dialogVisible = false
    }
  }
}
</script>
<style lang="css">
.cron-box-dialog-first {
  width: 800px;
}
.cron-box-dialog-first .el-dialog__header {
  padding: 10px;
  text-align: center;
}
.cron-box-dialog-first .el-dialog__header .el-dialog__headerbtn {
  top: 12px;
  right: 8px;
}
.cron-box-dialog-first .el-dialog__body {
  padding: 0 10px;
}
.cron-box-dialog-first .el-dialog__footer {
  padding: 10px;
  text-align: center;
}
</style>
