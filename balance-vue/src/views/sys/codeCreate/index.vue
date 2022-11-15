<template>
  <div class="app-container">
    <div class="filter-container">
      <el-button-group>
        <el-button v-permission="'sys:codeCreate:save'" icon="el-icon-plus" type="primary" class="filter-item" @click="btnCreate">新增</el-button>
        <el-button v-permission="'sys:codeCreate:delete'" icon="el-icon-delete" class="filter-item" @click="btnDelete()">批量删除</el-button>
      </el-button-group>
      <div style="float: right">
        <el-input v-model="listQuery.codeCreateTablename" placeholder="表名" style="width: 200px;" class="filter-item" @keyup.enter.native="btnQuery" />
        <el-input v-model="listQuery.codeCreateModule" placeholder="模块名" style="width: 200px;" class="filter-item" @keyup.enter.native="btnQuery" />
        <el-input v-model="listQuery.codeCreateFilename" placeholder="文件名" style="width: 200px;" class="filter-item" @keyup.enter.native="btnQuery" />
        <el-dropdown split-button type="primary" class="filter-item" @click="btnQuery">
          <i class="el-icon-search el-icon--left" />查询
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item icon="el-icon-zoom-out" @click.native="btnReset">重置</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
    </div>
    <el-table
      ref="multipleTable"
      :data="records"
      border
      fit
      highlight-current-row
      style="width: 100%;"
      :cell-style="{padding:'3px'}"
      @cell-dblclick="btnView"
      @selection-change="selectionChange"
    >
      <el-table-column fixed type="selection" align="center" />
      <el-table-column fixed type="index" label="#" align="center" width="50" />
      <el-table-column label="表名" prop="codeCreateTablename" align="center"><template slot-scope="scope"><span>{{ scope.row.codeCreateTablename }}</span></template></el-table-column>
      <el-table-column label="模块名" prop="codeCreateModule" align="center"><template slot-scope="scope"><span>{{ scope.row.codeCreateModule }}</span></template></el-table-column>
      <el-table-column label="文件名" prop="codeCreateFilename" align="center"><template slot-scope="scope"><span>{{ scope.row.codeCreateFilename }}</span></template></el-table-column>
      <el-table-column fixed="right" label="操作" align="center">
        <template slot-scope="{row}">
          <el-dropdown trigger="click">
            <span class="el-dropdown-link">操作<i class="el-icon-arrow-down el-icon--right" /></span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item icon="el-icon-view" @click.native="btnView(row)">查看</el-dropdown-item>
              <el-dropdown-item v-permission="'sys:codeCreate:update'" icon="el-icon-edit" divided @click.native="btnUpdate(row)">修改</el-dropdown-item>
              <el-dropdown-item v-permission="'sys:codeCreate:delete'" icon="el-icon-delete" divided @click.native="btnDelete(row.codeCreateId)">删除</el-dropdown-item>
              <el-dropdown-item v-permission="'sys:codeCreate:export'" icon="el-icon-download" divided @click.native="btnExport(row)">下载</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </template>
      </el-table-column>
    </el-table>
    <div class="pagination-position">
      <pagination
        v-show="total>0"
        :total="total"
        :current.sync="listQuery.current"
        :size.sync="listQuery.size"
        @pagination="list"
      />
    </div>

    <el-dialog title="代码在线生成" :visible.sync="dialogFormVisible">
      <el-form ref="dataForm" :rules="rules" :model="temp" label-position="right" label-width="80px">
        <el-form-item label="表名" prop="codeCreateTablename"><el-input v-model="temp.codeCreateTablename" style="width: 95%;" /></el-form-item>
        <el-form-item label="模块名" prop="codeCreateModule"><el-input v-model="temp.codeCreateModule" style="width: 95%;" /></el-form-item>
        <el-form-item label="文件名" prop="codeCreateFilename">
          <el-input v-model="temp.codeCreateFilename" style="width: 95%;" />
          <el-button icon="el-icon-plus" type="primary" class="filter-item" @click="btnImport">导入</el-button>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button icon="el-icon-close" @click="dialogFormVisible = false">取消</el-button>
        <el-button v-if="dialogStatus!=='view'" icon="el-icon-check" type="primary" @click="dialogStatus==='create'?createData():updateData()">确定</el-button>
      </div>
    </el-dialog>

    <el-dialog title="文件导入" :visible.sync="dialogImportVisible">
      <el-upload
        class="upload-demo"
        drag
        action
        :show-file-list="false"
        :http-request="doImport"
      >
        <i class="el-icon-upload" />
        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
        <div slot="tip" class="el-upload__tip">请选择需要上传的文件</div>
      </el-upload>
    </el-dialog>
  </div>
</template>

<script>
import Pagination from '@/components/Pagination'
import { getAction, putAction, postAction, deleteAction, downloadAction } from '@/api/manage'
import { Message } from 'element-ui'

export default {
  name: 'SysCodeCreate',
  components: { Pagination },
  data() {
    return {
      dicts: [],
      records: null,
      selectedRecords: [],
      total: 0,
      listQuery: {
        current: 1,
        size: 10,
        codeCreateTablename: undefined,
        codeCreateModule: undefined,
        codeCreateFilename: undefined
      },
      dialogFormVisible: false,
      dialogStatus: '',
      temp: {
        codeCreateTablename: '',
        codeCreateModule: '',
        codeCreateFilename: ''
      },
      rules: {
        codeCreateTablename: [{ required: true, message: '该项不能为空', trigger: 'change' }],
        codeCreateModule: [{ required: true, message: '该项不能为空', trigger: 'change' }],
        codeCreateFilename: [{ required: true, message: '该项不能为空', trigger: 'change' }]
      },
      dialogImportVisible: false
    }
  },
  beforeCreate() {

  },
  created() {
    this.list()
  },
  methods: {
    list() {
      getAction('/sys/codeCreate/list', this.listQuery).then(res => {
        const { data } = res
        this.records = data.records
        this.total = data.total
      })
    },
    btnQuery() {
      this.listQuery.current = 1
      this.list()
    },
    btnReset() {
      this.listQuery = {
        current: 1,
        size: 10,
        codeCreateTablename: undefined,
        codeCreateModule: undefined,
        codeCreateFilename: undefined
      }
      this.list()
    },
    resetTemp() {
      this.temp = {
        codeCreateTablename: '',
        codeCreateModule: '',
        codeCreateFilename: ''
      }
    },
    btnView(row) {
      this.temp = Object.assign({}, row)
      this.dialogStatus = 'view'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    btnCreate() {
      this.resetTemp()
      this.dialogStatus = 'create'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    createData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          postAction('/sys/codeCreate/save', this.temp).then(({ msg }) => {
            this.dialogFormVisible = false
            Message.success(msg)
            this.list()
          })
        }
      })
    },
    btnUpdate(row) {
      this.temp = Object.assign({}, row)
      this.dialogStatus = 'update'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    updateData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          putAction('/sys/codeCreate/update', this.temp).then(({ msg }) => {
            this.dialogFormVisible = false
            Message.success(msg)
            this.list()
          })
        }
      })
    },
    btnDelete(id) {
      const ids = id ? [id] : this.selectedRecords.map(record => {
        return record.sysCodecreatePk
      })
      if (ids.length === 0) {
        Message.error('请选择要删除的记录')
        return
      }
      this.$confirm('此操作将永久删除该记录, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteAction('/sys/codeCreate/delete', { ids: ids.toString() }).then(({ msg }) => {
          Message.success(msg)
          this.list()
        })
      })
    },
    selectionChange(selectedRecords) {
      this.selectedRecords = selectedRecords
    },
    btnImport() {
      this.dialogImportVisible = true
    },
    doImport(fileObj) {
      const formData = new FormData()
      formData.set('file', fileObj.file)
      postAction('/sys/codeCreate/doImport', formData).then(({ msg }) => {
        this.dialogImportVisible = false
        this.temp.codeCreateFilename = msg
      })
    },
    btnExport(row) {
      downloadAction('/sys/codeCreate/doExport', 'get', { codeCreateFilename: row.codeCreateFilename }, row.codeCreateFilename)
    }
  }
}
</script>
