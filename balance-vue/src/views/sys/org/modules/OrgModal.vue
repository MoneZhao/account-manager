
<template>
  <div>
    <el-dialog
      :title="handleType === 'add' ? '添加子机构' : '编辑当前机构'"
      :visible.sync="dialogVisible"
      :before-close="handleClose"
    >
      <div>
        <el-form
          ref="dataForm"
          :rules="rules"
          :model="temp"
          label-position="right"
          label-width="110px"
        >
          <el-form-item v-show="false" label="机构级次码" prop="orgLevelCode">
            <el-input v-model="temp.orgLevelCode" />
          </el-form-item>
          <el-form-item v-show="false" label="上级机构ID" prop="parentOrgId">
            <el-input v-model="temp.parentOrgId" />
          </el-form-item>
          <el-form-item v-show="false" label="上级机构" prop="parentOrgName">
            <el-input v-model="temp.parentOrgName" />
          </el-form-item>
          <el-row>
            <el-col :span="12">
              <el-form-item label="机构ID" prop="orgId">
                <el-input v-model="temp.orgId" :disabled="handleType==='edit'" />
              </el-form-item>
            </el-col>
            <el-col :span="12" />
          </el-row>
          <el-row>
            <el-col :span="12">
              <el-form-item label="机构名称" prop="orgName">
                <el-input v-model="temp.orgName" />
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="机构简称" prop="shortName">
                <el-input v-model="temp.shortName" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="12">
              <el-form-item label="机构类型" prop="orgType">
                <el-select v-model="temp.orgType" placeholder="机构类型">
                  <el-option
                    v-for="(item, index) in dicts.orgType"
                    :key="index"
                    :label="item.content"
                    :value="item.value"
                  />
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="12" />
          </el-row>
          <el-row>
            <el-col :span="12">
              <el-form-item label="机构级别" prop="orgLevel" value-key="value">
                <el-select v-model="temp.orgLevel" placeholder="机构级别" disabled>
                  <el-option
                    v-for="(item, index) in dicts.orgLevel"
                    :key="index"
                    :label="item.content"
                    :value="item.value"
                  />
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="是否叶子" prop="isLeaf">
                <el-select v-model="temp.isLeaf" placeholder="是否叶子" disabled>
                  <el-option
                    v-for="(item, index) in dicts.yesOrNo"
                    :key="index"
                    :label="item.content"
                    :value="item.value"
                  />
                </el-select>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="24">
              <el-form-item label="备注">
                <el-input
                  v-model="temp.remark"
                  :autosize="{ minRows: 2, maxRows: 4}"
                  type="textarea"
                  placeholder="请输入备注信息"
                />
              </el-form-item>
            </el-col>
          </el-row>
        </el-form>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button @click="handleClose">取 消</el-button>
        <el-button type="primary" @click="onSubmit">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { putAction, postAction } from '@/api/manage'
import { Message } from 'element-ui'

export default {
  data() {
    return {
      dialogVisible: false,
      handleType: 'add',

      temp: {
        orgId: undefined,
        orgName: '',
        parentOrgId: '',
        shortName: '',
        orgType: '1',
        orgLevel: '',
        orgLevelCode: '',
        remark: '',
        isLeaf: '',
        parentOrgName: ''
      },

      dicts: [],
      rules: {
        orgId: [{ required: true, message: '该项不能为空', trigger: 'change' }],
        orgName: [{ required: true, message: '该项不能为空', trigger: 'change' }],
        orgType: [{ required: true, message: '该项不能为空', trigger: 'change' }]
      }
    }
  },
  methods: {
    add(row, dicts) {
      this.dicts = dicts
      console.log(row)
      this.temp = {}
      this.temp.parentOrgName = row.label
      this.temp.parentOrgId = row.id
      this.temp.orgLevel = ''
      this.temp.orgLevelCode = ''
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })

      this.handleType = 'add'
      this.dialogVisible = true
    },
    edit(row, dicts) {
      this.temp = Object.assign({}, row.data)
      this.dicts = dicts
      this.handleType = 'edit'
      this.dialogVisible = true
    },
    handleClose() {
      this.dialogVisible = false
      this.$refs.dataForm.resetFields()
    },
    onSubmit() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          if (this.handleType === 'add') {
            postAction('/sys/org/save', this.temp).then(({ msg, data, code }) => {
              if (code === 200) {
                this.$emit('ok')
                Message.success('添加子机构成功！')
              } else {
                Message.error('添加子机构失败！')
              }
            }).finally(() => {
              this.handleClose()
            })
          } else {
            putAction('/sys/org/update', this.temp).then(({ msg, data, code }) => {
              if (code === 200) {
                this.$emit('ok')
                Message.success('编辑子机构成功！')
              } else {
                Message.error('编辑子机构失败！')
              }
            }).finally(() => {
              this.handleClose()
            })
          }
        }
      })
    }
  }
}
</script>

<style lang="scss" scoped>
</style>
