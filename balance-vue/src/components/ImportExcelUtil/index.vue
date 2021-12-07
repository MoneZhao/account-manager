<template>
  <div>
    <el-button-group>
      <slot name="prefix" />
      <el-button v-show="showImport" icon="el-icon-upload" type="primary" @click="uploadExcel">导入
      </el-button>
      <el-button v-show="showExport" icon="el-icon-download" type="primary" @click="btnExport">导出选中
      </el-button>
      <slot name="suffix" />
    </el-button-group>

    <import-modal ref="importModal" @ok="importOk" />
  </div>
</template>

<script>
import ImportModal from '@/components/ImportExcelUtil/importModal'
import { Message } from 'element-ui'
import { parseTime } from '@/utils'

export default {
  name: 'ImportExcelUtil',
  components: { ImportModal },
  props: {
    keyMap: {
      required: true,
      type: Object
    },
    urlSave: {
      required: true,
      type: String
    },
    urlHref: {
      required: true,
      type: String
    },
    defaultColumn: {
      type: Object,
      default: () => {}
    },
    timeColumn: {
      type: Array,
      default: () => []
    },
    showImport: {
      type: Boolean,
      default: true
    },
    showExport: {
      type: Boolean,
      default: true
    },
    exportList: {
      type: Array,
      default: () => []
    }
  },
  data() {
    return {
    }
  },
  mounted() {
  },
  methods: {
    btnExport() {
      console.log(this.exportList)
      const keyMap = Object.assign({}, this.keyMap)
      import('@/vendor/Export2Excel').then(excel => {
        const tHeader = Object.keys(keyMap)
        const filterVal = Object.values(keyMap)
        if (!this.exportList || this.exportList.length === 0) {
          Message.error('请选择要导出的信息')
          return
        }
        const data = this.formatJson(filterVal, this.exportList)
        excel.export_json_to_excel({
          header: tHeader,
          data,
          filename: '导出信息'
        })
        this.$message.success('导出成功')
      })
    },
    formatJson(filterVal, jsonData) {
      return jsonData.map(v =>
        filterVal.map(j => {
          if (this.timeColumn.includes(j)) {
            return parseTime(v[j])
          } else {
            return v[j]
          }
        })
      )
    },
    uploadExcel() {
      this.$refs.importModal.show(this.keyMap, this.urlSave, this.urlHref, this.defaultColumn)
    },
    importOk() {
      this.$emit('importOk')
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
