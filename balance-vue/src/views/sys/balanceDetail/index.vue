<template>
  <div class="app-container">
    <div class="filter-container">
      <el-button-group>
        <el-button icon="el-icon-plus" type="primary" class="filter-item" @click="btnCreate">新增</el-button>
        <el-button icon="el-icon-delete" class="filter-item" @click="btnDelete()">批量删除</el-button>
      </el-button-group>
      <div style="float: right">
        <el-select v-model="listQuery.balanceType" placeholder="账户类型" class="filter-item"><el-option v-for="(item, index) in dicts.balanceType" :key="index" :label="item.content" :value="item.value" /></el-select>
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
      @cell-dblclick="btnUpdate"
      @selection-change="selectionChange"
    >
      <el-table-column type="selection" align="center" />
      <el-table-column type="index" label="#" align="center" width="50" />
      <el-table-column label="账户余额" prop="account" align="center"><template slot-scope="scope"><span>{{ formatMoney(scope.row.account) }}</span></template></el-table-column>
      <el-table-column label="账户类型" prop="balanceType" align="center"><template slot-scope="scope"><span v-html="formatDictText(dicts.balanceType,scope.row.balanceType)" /></template></el-table-column>
      <el-table-column label="备注" prop="remark" align="center"><template slot-scope="scope"><span>{{ scope.row.remark }}</span></template></el-table-column>
      <el-table-column label="操作" align="center">
        <template slot-scope="{row}">
          <el-button icon="el-icon-edit" @click.native="btnUpdate(row)">修改</el-button>
          <el-divider direction="vertical" />
          <el-button icon="el-icon-delete" @click.native="btnDelete(row.balanceDetailId)">删除</el-button>
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

    <el-dialog title="账户明细" :visible.sync="dialogFormDetailVisible" append-to-body>
      <el-form ref="dataForm" :rules="rules" :model="temp" label-position="right" label-width="auto">
        <el-form-item label="账户类型" prop="balanceType"><el-select v-model="temp.balanceType" filterable placeholder="账户类型"><el-option v-for="(item, index) in dicts.balanceType" :key="index" :label="item.content" :value="item.value" /></el-select></el-form-item>
        <el-form-item label="账户余额" prop="account">
          <el-input-number
            v-model="temp.account"
            controls-position="right"
            :min="0"
            :precision="2"
            :step="1"
            @keyup.enter.native="dialogStatus==='create'?createData():updateData()"
          />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="temp.remark" style="width: 60%" maxlength="255" show-word-limit />
        </el-form-item>
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
        balanceType: undefined,
        balanceMainId: this.balanceMainId
      },
      dialogFormDetailVisible: false,
      dialogStatus: '',
      temp: {
        account: '',
        balanceType: '',
        remark: '',
        balanceMainId: this.balanceMainId
      },
      rules: {
        account: [{ required: true, message: '该项不能为空', trigger: 'change' }],
        balanceType: [{ required: true, message: '该项不能为空', trigger: 'change' }]
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
        balanceType: undefined,
        balanceMainId: this.balanceMainId
      }
      this.list()
    },
    resetTemp() {
      this.temp = {
        account: '',
        balanceType: '',
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
      this.$confirm('此操作将永久删除该记录, 是否继续?', '提示', {
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
