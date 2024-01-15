<template>
  <div class="app-container">
    <div class="filter-container">
      <el-button-group>
        <el-button v-permission="'sys:travelExpense:save'" icon="el-icon-plus" type="primary" class="filter-item" @click="btnCreate">新增</el-button>
        <el-button v-permission="'sys:travelExpense:delete'" icon="el-icon-delete" class="filter-item" @click="btnDelete()">批量删除</el-button>
      </el-button-group>
      <div style="float: right">
        <el-input v-model="listQuery.travelPlace" placeholder="出差地点" style="width: 200px;" class="filter-item" @keyup.enter.native="btnQuery" />
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
      @cell-dblclick="btnView"
    >
      <el-table-column fixed type="selection" align="center" />
      <el-table-column fixed type="index" label="#" align="center" width="50" />
      <el-table-column label="出差地点" prop="travelPlace" align="center"><template slot-scope="scope"><span>{{ scope.row.travelPlace }}</span></template></el-table-column>
      <el-table-column label="报销日期" prop="requestDate" align="center"><template slot-scope="scope"><span>{{ scope.row.requestDate }}</span></template></el-table-column>
      <el-table-column label="到账日期" prop="getDate" align="center"><template slot-scope="scope"><span>{{ scope.row.getDate }}</span></template></el-table-column>
      <el-table-column label="报账天数" prop="useDay" align="center">
        <template slot-scope="scope">
          <el-tag
            effect="plain"
            style="margin-left: 5px"
          >
            <span>{{ scope.row.useDay }}</span>
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="实际花费" prop="useNumber" align="center"><template slot-scope="scope"><span>{{ formatMoney(scope.row.useNumber) }}</span></template></el-table-column>
      <el-table-column label="报销金额" prop="requestNumber" align="center"><template slot-scope="scope"><span>{{ formatMoney(scope.row.requestNumber) }}</span></template></el-table-column>
      <el-table-column label="到账金额" prop="getNumber" align="center"><template slot-scope="scope"><span>{{ formatMoney(scope.row.getNumber) }}</span></template></el-table-column>
      <el-table-column label="得利" prop="addNumber" align="center">
        <template slot-scope="scope">
          <el-tag
            effect="plain"
            style="margin-left: 5px"
          >
            <span>{{ formatMoney(scope.row.addNumber) }}</span>
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="备注" prop="remark" align="center"><template slot-scope="scope"><span>{{ scope.row.remark }}</span></template></el-table-column>
      <el-table-column fixed="right" label="操作" align="center">
        <template slot-scope="{row}">
          <el-dropdown trigger="click">
            <span class="el-dropdown-link">操作<i class="el-icon-arrow-down el-icon--right" /></span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item icon="el-icon-view" @click.native="btnView(row)">查看</el-dropdown-item>
              <el-dropdown-item v-permission="'sys:travelExpense:update'" icon="el-icon-edit" divided @click.native="btnUpdate(row)">修改</el-dropdown-item>
              <el-dropdown-item v-permission="'sys:travelExpense:delete'" icon="el-icon-delete" divided @click.native="btnDelete(row.travelExpenseId)">删除</el-dropdown-item>
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

    <el-dialog title="出差报销" :visible.sync="dialogFormVisible">
      <el-form ref="dataForm" :rules="rules" :model="temp" label-position="right" label-width="auto">
        <el-row>
          <el-col :span="12"><el-form-item label="出差地点" prop="travelPlace"><el-input v-model="temp.travelPlace" maxlength="32" show-word-limit /></el-form-item></el-col>
        </el-row>
        <el-row>
          <el-col :span="12"><el-form-item label="报销日期" prop="requestDate"><el-date-picker v-model="temp.requestDate" type="date" /></el-form-item></el-col>
          <el-col :span="12"><el-form-item label="到账日期" prop="getDate"><el-date-picker v-model="temp.getDate" type="date" /></el-form-item></el-col>
        </el-row>
        <el-row>
          <el-col :span="8">
            <el-form-item label="实际花费" prop="useNumber">
              <el-input-number
                v-model="temp.useNumber"
                :max="999999999.99"
                controls-position="right"
                :min="0"
                :precision="2"
                :step="1"
              />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="报销金额" prop="requestNumber">
              <el-input-number
                v-model="temp.requestNumber"
                :max="999999999.99"
                controls-position="right"
                :min="0"
                :precision="2"
                :step="1"
              />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="到账金额" prop="getNumber">
              <el-input-number
                v-model="temp.getNumber"
                :max="999999999.99"
                controls-position="right"
                :min="0"
                :precision="2"
                :step="1"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24"><el-form-item label="备注" prop="remark"><el-input v-model="temp.remark" maxlength="255" show-word-limit /></el-form-item></el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button icon="el-icon-close" @click="dialogFormVisible = false">取消</el-button>
        <el-button v-if="dialogStatus!=='view'" icon="el-icon-check" type="primary" @click="dialogStatus==='create'?createData():updateData()">确定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import Pagination from '@/components/Pagination'
import { getAction, putAction, postAction, deleteAction } from '@/api/manage'
import { Message } from 'element-ui'

export default {
  name: 'SysTravelExpense',
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
        travelPlace: undefined
      },
      dialogFormVisible: false,
      dialogStatus: '',
      temp: {

      },
      rules: {
        travelPlace: [{ required: true, message: '该项不能为空', trigger: 'change' }],
        requestDate: [{ required: true, message: '该项不能为空', trigger: 'change' }],
        useNumber: [{ required: true, message: '该项不能为空', trigger: 'change' }],
        requestNumber: [{ required: true, message: '该项不能为空', trigger: 'change' }]
      }
    }
  },
  beforeCreate() {

  },
  created() {
    this.list()
  },
  methods: {
    list() {
      getAction('/sys/travelExpense/list', this.listQuery).then(res => {
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
        travelPlace: undefined
      }
      this.list()
    },
    resetTemp() {
      this.temp = {

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
          postAction('/sys/travelExpense/save', this.temp).then(({ msg }) => {
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
          putAction('/sys/travelExpense/update', this.temp).then(({ msg }) => {
            this.dialogFormVisible = false
            Message.success(msg)
            this.list()
          })
        }
      })
    },
    btnDelete(id) {
      const ids = id ? [id] : this.selectedRecords.map(record => {
        return record.travelExpenseId
      })
      if (ids.length == 0) {
        Message.error('请选择要删除的记录')
        return
      }
      this.$confirm('此操作将永久删除该记录, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteAction('/sys/travelExpense/delete', { ids: ids.toString() }).then(({ msg }) => {
          Message.success(msg)
          this.list()
        })
      })
    },
    selectionChange(selectedRecords) {
      this.selectedRecords = selectedRecords
    }
  }
}
</script>
