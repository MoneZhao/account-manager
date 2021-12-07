<template>
  <div>
    <el-dialog
      title="批量导入信息"
      :width="current === 0 ? '600px' : '1800px'"
      :visible.sync="visible"
      :before-close="handleCancel"
      destroy-on-close
    >
      <el-steps :active="current" finish-status="success">
        <el-step v-for="item in steps" :key="item.id" :title="item.title" />
      </el-steps>
      <div class="steps-content">
        <div v-if="current===0">
          <upload-excel-component :on-success="handleSuccess" :before-upload="beforeUpload" />
          <div class="cautious">
            <span style="color: #9f9f9f;">上传的文件请不要超过1M, 支持xlsx、xls、csv文件</span>
            <span @click="downLoadEquipExcel">
              <i class="el-icon-info" />下载模板
            </span>
          </div>
        </div>
        <div v-if="current===1">
          <el-table :data="listData" style="marginTop: 15px;">
            <el-table-column v-for="item of tableHeader" :key="item" :prop="item" :label="item" />
            <el-table-column label="操作" width="50">
              <template slot-scope="scope">
                <!-- <a href="javascript:;" @click="removeItem(scope.$index)" style="">移除</a> -->
                <el-tooltip class="item" effect="dark" content="移除" placement="top">
                  <i class="el-icon-remove" style="color: red;cursor: pointer;" @click="removeItem(scope.$index)" />
                </el-tooltip>
              </template>
            </el-table-column>
          </el-table>
        </div>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button @click="handleCancel">取 消</el-button>
        <el-button v-show="current === 1" @click="backStep">上一步</el-button>
        <el-button v-show="current === 0" type="primary" @click="nextStep">下一步</el-button>
        <el-button v-show="current === 1" type="primary" @click="handleOk">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import UploadExcelComponent from './uploadExcel'
import { postAction } from '@/api/manage'
export default {
  components: { UploadExcelComponent },
  data() {
    return {
      visible: false,
      listData: [],
      loading: false,

      current: 0,
      steps: [
        {
          id: 1,
          title: '批量上传信息',
          content: 'First-content'
        },
        {
          id: 2,
          title: '确认信息无误',
          content: 'Second-content'
        }
      ],
      tableHeader: [],
      defaultColumn: {},
      keyMap: {},
      urlSave: '',
      urlHref: ''
      // downloadVisible: false
    }
  },
  methods: {
    show(keyMap, urlSave, urlHref, defaultColumn) {
      this.visible = true
      console.log(keyMap)
      this.keyMap = keyMap
      this.urlSave = urlSave
      this.urlHref = urlHref
      this.defaultColumn = defaultColumn
    },
    beforeUpload(file) {
      const isLt10M = file.size / 1024 / 1024 < 10

      if (isLt10M) {
        return true
      }

      this.$message({
        message: '请不要上传超过10M大小的文件.',
        type: 'warning'
      })
      return false
    },
    handleSuccess({ results, header }) {
      console.log(results)
      console.log(header)
      this.tableHeader = header
      this.listData = results
      this.nextStep()
    },
    handleCancel() {
      this.current = 0
      this.visible = false
      this.listData = []
    },
    removeItem(index) {
      this.listData.splice(index, 1)
    },

    downLoadEquipExcel() {
      console.log(this.urlHref)
      window.location.href = this.urlHref
    },

    backStep() {
      this.current--
    },
    nextStep() {
      this.current++
    },

    // 改变对象的key
    handleOk() {
      // 保存提交
      console.log(this.listData)
      const sendParamList = []
      const defaultColumn = this.defaultColumn
      this.listData.map(item => {
        let changeItem = Object.keys(item).reduce((newData, key) => {
          const newKey = this.keyMap[key] || key
          newData[newKey] = item[key]
          return newData
        }, {})
        changeItem = {
          ...defaultColumn,
          ...changeItem
        }
        console.log(changeItem)
        sendParamList.push(changeItem)
      })
      console.log(sendParamList)
      this.loading = true
      postAction(this.urlSave, sendParamList)
        .then(res => {
          if (res.code === 200) {
            this.$message.success('上传信息成功')
            this.$emit('ok')
          } else {
            this.$error(`上传信息失败：${res.data.msg}`)
          }
        })
        .finally(() => {
          this.loading = false
          this.handleCancel()
        })
    }
  }
}
</script>

<style lang="scss" scoped>
.cautious {
  text-align: center;
  margin-top: 6px;
  position: relative;
  span:nth-child(2) {
    color: gray;
    cursor: pointer;
    position: absolute;
    top: -33px;
    right: 122px;
  }
}

.steps-content {
  margin-top: 20px;
}
</style>
