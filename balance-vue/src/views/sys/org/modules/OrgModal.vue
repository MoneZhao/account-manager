
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
          <el-row>
            <el-col :span="12">
              <el-form-item label="机构ID" prop="orgId">
                <el-input v-model="temp.orgId" :disabled="handleType==='edit'" />
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="上级机构" prop="parentOrgId">
                <tree-select
                  :options="treeData"
                  :value="temp.parentOrgId"
                  :disabled="temp.orgId==='1000000000'"
                  @getNode="getNode($event)"
                  @getValue="getValue($event)"
                />
              </el-form-item>
            </el-col>
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
import { putAction, postAction, getAction } from '@/api/manage'
import { Message } from 'element-ui'
import TreeSelect from '@/components/TreeSelect'

export default {
  components: { TreeSelect },
  data() {
    const validateParentOrg = (rule, value, callback) => {
      if (this.temp.orgId === '1000000000') {
        if (value) {
          callback(new Error('顶层节点不能选择父节点'))
        } else {
          callback()
        }
      } else {
        if (!value) {
          callback(new Error('该项不能为空'))
        } else {
          callback()
        }
      }
    }
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
        parentOrgId: [{ validator: validateParentOrg, trigger: 'blur' }],
        orgName: [{ required: true, message: '该项不能为空', trigger: 'change' }],
        orgType: [{ required: true, message: '该项不能为空', trigger: 'change' }]
      },
      treeData: [],
      treeLoading: false
    }
  },
  methods: {
    add(row, dicts) {
      this.dicts = dicts
      this.temp = {}
      this.temp.parentOrgName = row.label
      this.temp.parentOrgId = row.id
      this.temp.orgLevel = ''
      this.temp.orgLevelCode = ''
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })

      this.handleType = 'add'
      this.getTreeData()
    },
    edit(row, dicts) {
      this.temp = Object.assign({}, row.data)
      this.dicts = dicts
      this.handleType = 'edit'
      this.getTreeData()
    },
    handleClose() {
      this.dialogVisible = false
      this.$refs.dataForm.resetFields()
    },
    getTreeData() {
      this.treeLoading = true
      getAction('/sys/org/getTreeData', {}).then(res => {
        const { data } = res
        this.removeCurrentNode(data[0], this.temp.orgId)
        console.log(data)
        this.treeData = data
        this.treeLoading = false
        this.dialogVisible = true
      })
    },
    removeCurrentNode(tree, currentKey) {
      if (tree.children && tree.children.length > 0) {
        for (let i = 0; i < tree.children.length; i++) {
          if (tree.children[i].id == currentKey) {
            tree.children.splice(i, 1)
            return
          } else {
            this.removeCurrentNode(tree.children[i], currentKey)
          }
        }
      }
    },
    getNode(value) {
    },
    getValue(value) {
      console.log(value)
      this.temp.parentOrgId = value
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
