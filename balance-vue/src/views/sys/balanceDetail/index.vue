<template>
  <div class="app-container">
    <div class="filter-container">
      <el-select v-model="listQuery.accountType" placeholder="账户类型" class="filter-item"><el-option v-for="(item, index) in dicts.balanceType" :key="index" :label="item.content" :value="item.value" /></el-select>
      <el-dropdown split-button type="primary" class="filter-item" @click="btnQuery">
        <i class="el-icon-search el-icon--left" />查询
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item icon="el-icon-zoom-out" @click.native="btnReset">重置</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
      <el-button-group>
        <el-button icon="el-icon-plus" type="primary" class="filter-item" @click="btnCreate">新增</el-button>
        <el-button icon="el-icon-delete" class="filter-item" @click="btnDelete()">批量删除</el-button>
      </el-button-group>
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
      <el-table-column label="账户余额" prop="account" align="center"><template slot-scope="scope"><span>{{ formatMoney(scope.row.account) }}</span></template></el-table-column>
      <el-table-column label="账户类型" prop="accountType" align="center"><template slot-scope="scope"><span v-html="formatDictText(dicts.balanceType,scope.row.accountType)" /></template></el-table-column>
      <el-table-column label="备注" prop="remark" align="center"><template slot-scope="scope"><span>{{ scope.row.remark }}</span></template></el-table-column>
      <el-table-column label="操作" align="center">
        <template slot-scope="{row}">
          <el-button icon="el-icon-edit" @click.native="btnUpdate(row)">修改</el-button>
          <el-divider direction="vertical" />
          <el-button icon="el-icon-delete" @click.native="btnDelete(row.balanceDetailId)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <pagination
      v-show="total>0"
      :total="total"
      :current.sync="listQuery.current"
      :size.sync="listQuery.size"
      @pagination="list"
    />

    <el-dialog title="账户明细" :visible.sync="dialogFormDetailVisible" append-to-body>
      <el-form ref="dataForm" :rules="rules" :model="temp" label-position="right" label-width="auto">
        <el-form-item label="账户余额" prop="account"><el-input v-model.number="temp.account" /></el-form-item>
        <el-form-item label="账户类型" prop="accountType"><el-select v-model="temp.accountType" placeholder="账户类型"><el-option v-for="(item, index) in dicts.balanceType" :key="index" :label="item.content" :value="item.value" /></el-select></el-form-item>
        <el-form-item label="备注" prop="remark"><el-input v-model="temp.remark" /></el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button icon="el-icon-close" @click="dialogFormDetailVisible = false">取消</el-button>
        <el-button icon="el-icon-check" type="primary" @click="dialogStatus==='create'?createData():updateData()">确定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import Pagination from '@/components/Pagination'
import { getAction, putAction, postAction, deleteAction } from '@/api/manage'
import { Message } from 'element-ui'

export default {
  name: 'SysBalanceDetail',
  components: { Pagination },
  props: {
    balanceMainId: {
      required: true,
      type: String
    }
  },
  data() {
    return {
      dicts: [],
      records: null,
      selectedRecords: [],
      total: 0,
      listQuery: {
        current: 1,
        size: 10,
        accountType: undefined,
        balanceMainId: this.balanceMainId
      },
      dialogFormDetailVisible: false,
      dialogStatus: '',
      temp: {
        account: '',
        accountType: '',
        remark: '',
        balanceMainId: this.balanceMainId
      },
      rules: {
        account: [{ required: true, message: '该项不能为空', trigger: 'change' }],
        accountType: [{ required: true, message: '该项不能为空', trigger: 'change' }]
      }
    }
  },
  beforeCreate() {
    this.getDicts('balanceType').then(({ data }) => { this.dicts = data })
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
    list() {
      getAction('/sys/balanceDetail/list', this.listQuery).then(res => {
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
        accountType: undefined,
        balanceMainId: this.balanceMainId
      }
      this.list()
    },
    resetTemp() {
      this.temp = {
        account: '',
        accountType: '',
        remark: '',
        balanceMainId: this.balanceMainId
      }
    },
    btnCreate() {
      this.resetTemp()
      this.dialogStatus = 'create'
      this.dialogFormDetailVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    createData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          postAction('/sys/balanceDetail/save', this.temp).then(({ msg }) => {
            this.dialogFormDetailVisible = false
            Message.success(msg)
            this.list()
          })
        }
      })
    },
    btnUpdate(row) {
      this.temp = Object.assign({}, row)
      this.dialogStatus = 'update'
      this.dialogFormDetailVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    updateData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          putAction('/sys/balanceDetail/update', this.temp).then(({ msg }) => {
            this.dialogFormDetailVisible = false
            Message.success(msg)
            this.list()
          })
        }
      })
    },
    btnDelete(id) {
      const ids = id ? [id] : this.selectedRecords.map(record => {
        return record.balanceDetailId
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
        deleteAction('/sys/balanceDetail/delete', { ids: ids.toString() }).then(({ msg }) => {
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
    selectionChange(selectedRecords) {
      this.selectedRecords = selectedRecords
    }
  }
}
</script>
