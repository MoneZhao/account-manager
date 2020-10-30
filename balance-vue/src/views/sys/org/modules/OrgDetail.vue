
<template>
  <div>
    <el-dialog title="机构详情" :visible.sync="dialogVisible" width="30%" :before-close="handleClose">
      <div class="detail-info">
        <el-row class="row">
          <el-col :span="12" class="col">机构名称：{{ info.orgName }}</el-col>
          <el-col :span="12" class="col">机构ID：{{ info.orgId }}</el-col>
        </el-row>
        <el-row class="row">
          <el-col :span="12" class="col">机构简称：{{ info.shortName }}</el-col>
          <el-col :span="12" class="col">备注：{{ info.remark }}</el-col>
        </el-row>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      dialogVisible: false,
      info: {}
    }
  },
  methods: {
    show(data) {
      this.info = data
      this.dialogVisible = true
    },
    handleClose() {
      this.dialogVisible = false
    },
    onSubmit() {}
  }
}
</script>

<style lang="scss" scoped>
.detail-info {
  font-size: 16px;
  padding: 15px;
  .row {
    height: 30px;
    line-height: 30px;
  }
}
</style>
