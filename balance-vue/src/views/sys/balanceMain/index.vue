<template>
  <div class="app-container">
    <div class="filter-container">
      <el-button-group>
        <el-button v-permission="'sys:balanceMain:save'" icon="el-icon-plus" type="primary" class="filter-item" @click="btnCreate">新增</el-button>
        <el-button v-permission="'sys:balanceMain:delete'" icon="el-icon-delete" class="filter-item" @click="btnDelete()">批量删除</el-button>
      </el-button-group>
      <el-button-group>
        <el-button v-permission="'sys:balanceMain:import'" icon="el-icon-upload" type="primary" class="filter-item" @click="btnImport">导入</el-button>
        <el-button v-permission="'sys:balanceMain:export'" icon="el-icon-download" class="filter-item" @click="btnExport">导出当前页
        </el-button>
        <el-button v-permission="'sys:balanceMain:export'" icon="el-icon-download" class="filter-item" @click="btnExportAll">导出全部
        </el-button>
      </el-button-group>
      <div style="float: right">
        <el-date-picker v-model="listQuery.accountDate" value-format="yyyy-MM-dd" format="yyyy 年 MM 月 dd 日" :picker-options="pickerOptions" placeholder="记录时间" type="date" style="width: 200px;" class="filter-item" />
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
      @selection-change="selectionChange"
    >
      <el-table-column type="selection" align="center" />
      <el-table-column label="记录时间" prop="accountDate" align="center"><template slot-scope="scope"><span>{{ formatDate(scope.row.accountDate) }}</span></template></el-table-column>
      <el-table-column label="账户余额" prop="account" align="center"><template slot-scope="scope"><span>{{ formatMoney(scope.row.account) }}</span></template></el-table-column>
      <el-table-column label="备注" prop="remark" align="center"><template slot-scope="scope"><span>{{ scope.row.remark }}</span></template></el-table-column>
      <el-table-column label="操作" align="center" width="400px">
        <template slot-scope="{row}">
          <el-button v-permission="'sys:balanceMain:update'" icon="el-icon-edit" @click.native="btnUpdate(row)">修改</el-button>
          <el-divider direction="vertical" />
          <el-button v-permission="'sys:balanceMain:delete'" icon="el-icon-delete" @click.native="btnDelete(row.balanceMainId)">删除</el-button>
          <el-divider direction="vertical" />
          <el-button icon="el-icon-more" @click.native="btnDetail(row.balanceMainId)">详情</el-button>
          <el-divider direction="vertical" />
          <el-button icon="el-icon-sort" @click.native="btnCompare(row)">对比</el-button>
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

    <el-dialog title="账户余额" :visible.sync="dialogFormVisible" destroy-on-close>
      <el-form ref="dataForm" :rules="rules" :model="temp" label-position="right" label-width="auto">
        <el-form-item label="记录时间" prop="accountDate"><el-date-picker v-model="temp.accountDate" value-format="yyyy-MM-dd" format="yyyy 年 MM 月 dd 日" :picker-options="pickerOptions" type="date" /></el-form-item>
        <el-form-item label="备注" prop="remark"><el-input v-model="temp.remark" /></el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button icon="el-icon-close" @click="dialogFormVisible = false">取消</el-button>
        <el-button icon="el-icon-check" type="primary" @click="dialogStatus==='create'?createData():updateData()">确定</el-button>
      </div>
    </el-dialog>

    <el-dialog title="账户详情" :visible="dialogDetailVisible" destroy-on-close width="80%" :before-close="detailClose">
      <sys-balance-detail v-if="dialogDetailVisible" :balance-main-id="balanceMainId" />
    </el-dialog>

    <el-dialog title="余额对比" :visible.sync="dialogCompareVisible" label-position="right" destroy-on-close>
      <el-form ref="compareForm" :rules="compareRules" :model="compareTemp" label-width="auto">
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="当前日期" prop="selectDate">
              <el-date-picker v-model="compareTemp.selectDate" readonly value-format="yyyy-MM-dd" format="yyyy 年 MM 月 dd 日" :picker-options="pickerOptions" type="date" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="对比日期" prop="compareDate">
              <el-date-picker v-model="compareTemp.compareDate" value-format="yyyy-MM-dd" format="yyyy 年 MM 月 dd 日" :picker-options="pickerOptions" type="date" @change="dateChange" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="当前余额" prop="selectAccountFormat"><el-input v-model="compareTemp.selectAccountFormat" readonly /></el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="对比余额" prop="compareAccountFormat"><el-input v-model="compareTemp.compareAccountFormat" readonly /></el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="差值" prop="diff"><el-input v-model="compareTemp.diff" readonly /></el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button icon="el-icon-close" @click="dialogCompareVisible = false">取消</el-button>
        <el-button icon="el-icon-check" type="primary" @click="compareData">对比</el-button>
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
import SysBalanceDetail from '@/views/sys/balanceDetail'
import { getAction, putAction, postAction, deleteAction, downloadAction } from '@/api/manage'
import { Message } from 'element-ui'

export default {
  name: 'SysBalanceMain',
  components: { Pagination, SysBalanceDetail },
  data() {
    return {
      pickerOptions: {
        disabledDate(time) {
          return time.getTime() > Date.now()
        },
        shortcuts: [{
          text: '今天',
          onClick(picker) {
            picker.$emit('pick', new Date())
          }
        }, {
          text: '昨天',
          onClick(picker) {
            const date = new Date()
            date.setTime(date.getTime() - 3600 * 1000 * 24)
            picker.$emit('pick', date)
          }
        }]
      },
      dicts: [],
      records: null,
      selectedRecords: [],
      total: 0,
      listQuery: {
        current: 1,
        size: 10,
        accountDate: undefined
      },
      dialogFormVisible: false,
      dialogDetailVisible: false,
      dialogCompareVisible: false,
      balanceMainId: null,
      dialogStatus: '',
      temp: {
        accountDate: '',
        remark: ''
      },
      compareTemp: {
        selectDate: '',
        selectAccount: '',
        selectAccountFormat: '',
        compareDate: '',
        compareAccount: '',
        compareAccountFormat: '',
        diff: ''
      },
      rules: {
        accountDate: [{ required: true, message: '该项不能为空', trigger: 'change' }]
      },
      compareRules: {
        compareDate: [{ required: true, message: '该项不能为空', trigger: 'change' }]
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
    formatMoney(number, places, symbol = '￥', thousand = ',', decimal = '.') {
      number = number || 0
      places = !isNaN(places = Math.abs(places)) ? places : 2
      const negative = number < 0 ? '-' : ''
      const i = parseInt(number = Math.abs(+number || 0).toFixed(places), 10) + ''
      let j = i.length
      j = j > 3 ? j % 3 : 0
      return symbol + negative + (j ? i.substr(0, j) + thousand : '') +
        i.substr(j).replace(/(\d{3})(?=\d)/g, '$1' + thousand) +
        (places ? decimal + Math.abs(number - i).toFixed(places).slice(2) : '')
    },
    formatDate(date) {
      return this.$moment(date, 'YYYY-MM-DD').format('YYYY 年 MM 月 DD 日')
    },
    list() {
      getAction('/sys/balanceMain/list', this.listQuery).then(res => {
        const { data } = res
        this.records = data.records
        this.total = data.total
      })
    },
    btnImport() {
      this.dialogImportVisible = true
    },
    doImport(fileObj) {
      const formData = new FormData()
      formData.set('file', fileObj.file)
      postAction('/sys/balanceMain/import', formData).then(({ msg }) => {
        this.dialogImportVisible = false
        Message.success(msg)
        this.list()
      })
    },
    btnExport() {
      downloadAction('/sys/balanceMain/export', 'get', this.listQuery, 'SysBalanceMainExportCur.xlsx')
    },
    btnExportAll() {
      downloadAction('/sys/balanceMain/exportAll', 'get', '', 'SysBalanceMainExportAll.xlsx')
    },
    btnQuery() {
      this.listQuery.current = 1
      this.list()
    },
    btnReset() {
      this.listQuery = {
        current: 1,
        size: 10,
        accountDate: undefined
      }
      this.list()
    },
    resetTemp() {
      this.temp = {
        accountDate: '',
        remark: ''
      }
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
          postAction('/sys/balanceMain/save', this.temp).then(({ msg }) => {
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
          putAction('/sys/balanceMain/update', this.temp).then(({ msg }) => {
            this.dialogFormVisible = false
            Message.success(msg)
            this.list()
          })
        }
      })
    },
    btnDelete(id) {
      const ids = id ? [id] : this.selectedRecords.map(record => {
        return record.balanceMainId
      })
      if (ids.length === 0) {
        Message.error('请选择要删除的记录')
        return
      }
      this.$confirm('此操作将永久删除该文件, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteAction('/sys/balanceMain/delete', { ids: ids.toString() }).then(({ msg }) => {
          Message.success(msg)
          this.list()
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        })
      })
    },
    btnDetail(id) {
      this.balanceMainId = id
      this.dialogDetailVisible = true
    },
    btnCompare(row) {
      this.dialogCompareVisible = true
      this.compareTemp.selectDate = row.accountDate
      this.compareTemp.selectAccount = row.account
      this.compareTemp.selectAccountFormat = this.formatMoney(row.account)
    },
    compareData() {
      this.$refs['compareForm'].validate((valid) => {
        if (valid) {
          postAction('/sys/balanceMain/compare', { accountDate: this.compareTemp.compareDate }).then(res => {
            const { data, msg } = res
            if (data) {
              Message.success(msg)
              this.compareTemp.compareAccount = data.account
              this.compareTemp.compareAccountFormat = this.formatMoney(data.account)
              this.compareTemp.diff = this.formatMoney(this.compareTemp.selectAccount - this.compareTemp.compareAccount)
            } else {
              Message.info(msg)
            }
          })
        }
      })
    },
    dateChange() {
      this.compareTemp.compareAccount = ''
      this.compareTemp.compareAccountFormat = ''
    },
    detailClose() {
      this.dialogDetailVisible = false
      this.list()
    },
    selectionChange(selectedRecords) {
      this.selectedRecords = selectedRecords
    }
  }
}
</script>
