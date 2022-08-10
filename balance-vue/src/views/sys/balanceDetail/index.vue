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
      <el-table-column fixed type="selection" align="center" />
      <el-table-column fixed type="index" label="#" align="center" width="50" />
      <el-table-column label="账户余额" prop="account" align="center"><template slot-scope="scope"><span>{{ formatMoney(scope.row.account) }}</span></template></el-table-column>
      <el-table-column label="账户类型" prop="balanceType" align="center"><template slot-scope="scope"><span v-html="formatDictText(dicts.balanceType,scope.row.balanceType)" /></template></el-table-column>
      <el-table-column label="计入总资产" prop="countType" align="center" width="81"><template slot-scope="scope">
        <el-badge
          is-dot
          class="dot-position"
          :type="scope.row.countType === '1' ? 'success' : 'danger'"
        />
        <span v-html="formatDictText(dicts.yesOrNo,scope.row.countType)" />
      </template></el-table-column>
      <el-table-column label="备注" prop="remark" align="center"><template slot-scope="scope"><span>{{ scope.row.remark }}</span></template></el-table-column>
      <el-table-column fixed="right" label="操作" align="center">
        <template slot-scope="{row}">
          <el-dropdown trigger="click">
            <span class="el-dropdown-link">操作<i class="el-icon-arrow-down el-icon--right" /></span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item icon="el-icon-edit" @click.native="btnUpdate(row)">修改</el-dropdown-item>
              <el-dropdown-item icon="el-icon-delete" @click.native="btnDelete(row.balanceDetailId)">删除</el-dropdown-item>
              <el-dropdown-item icon="el-icon-sort" @click.native="btnCompare(row)">对比</el-dropdown-item>
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

    <el-dialog title="账户明细" :visible.sync="dialogFormDetailVisible" width="550px" append-to-body>
      <el-form ref="dataForm" :rules="rules" :model="temp" label-position="right" label-width="auto">
        <el-form-item label="账户类型" prop="balanceType"><el-select v-model="temp.balanceType" filterable placeholder="账户类型"><el-option v-for="(item, index) in dicts.balanceType" :key="index" :label="item.content" :value="item.value" /></el-select></el-form-item>
        <el-form-item label="账户余额" prop="account">
          <el-input-number
            v-model="temp.account"
            controls-position="right"
            :min="0"
            :precision="2"
            :step="1"
            style="width: 205px"
            @keyup.enter.native="dialogStatus==='create'?createData():updateData()"
          />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="temp.remark" style="width: 80%" maxlength="255" show-word-limit />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button icon="el-icon-close" @click="dialogFormDetailVisible = false">取消</el-button>
        <el-button icon="el-icon-check" type="primary" @click="dialogStatus==='create'?createData():updateData()">确定</el-button>
      </div>
    </el-dialog>

    <el-dialog :title="'余额明细对比 - (' + compareTemp.balanceName + ')'" :visible.sync="dialogCompareVisible" label-position="right" width="600px" destroy-on-close append-to-body>
      <el-form ref="compareForm" :rules="compareRules" :model="compareTemp" label-width="auto">
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="当前日期" prop="selectDate">
              <el-date-picker v-model="compareTemp.selectDate" readonly value-format="yyyy-MM-dd" format="yyyy 年 MM 月 dd 日" :picker-options="pickerOptions" type="date" style="width: 166px" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="对比日期" prop="compareDate">
              <el-date-picker v-model="compareTemp.compareDate" value-format="yyyy-MM-dd" format="yyyy 年 MM 月 dd 日" :picker-options="pickerOptions" type="date" style="width: 166px" @change="dateChange" />
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
            <el-form-item label="差值" prop="diff"><el-input v-model="diff" readonly /></el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button icon="el-icon-close" @click="dialogCompareVisible = false">取消</el-button>
        <el-button icon="el-icon-check" type="primary" @click="compareData">对比</el-button>
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
    const dayTime = this.$dayjs().add(1, 'day').valueOf()
    const yearTime = this.$dayjs().subtract(1, 'year').valueOf()
    const yearTime2 = this.$dayjs().subtract(2, 'year').valueOf()
    return {
      pickerOptions: {
        disabledDate(time) {
          return time.getTime() > dayTime
        },
        shortcuts: [{
          text: '去年今天',
          onClick(picker) {
            const date = new Date()
            date.setTime(yearTime)
            picker.$emit('pick', date)
          }
        }, {
          text: '前年今天',
          onClick(picker) {
            const date = new Date()
            date.setTime(yearTime2)
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
        balanceType: undefined,
        balanceMainId: this.balanceMainId
      },
      dialogFormDetailVisible: false,
      dialogCompareVisible: false,
      compareTemp: {
        balanceName: '',
        balanceType: '',
        selectDate: '',
        selectAccount: '',
        selectAccountFormat: '',
        compareDate: '',
        compareAccount: '',
        compareAccountFormat: ''
      },
      compareRules: {
        compareDate: [{ required: true, message: '该项不能为空', trigger: 'change' }]
      },
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
  computed: {
    diff() {
      if (this.compareTemp.selectAccount && this.compareTemp.compareAccount) {
        return this.formatMoney(this.compareTemp.selectAccount - this.compareTemp.compareAccount)
      } else {
        return ''
      }
    }
  },
  beforeCreate() {
    this.getDicts('balanceType,yesOrNo').then(({ data }) => { this.dicts = data })
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
    btnCompare(row) {
      console.log(row)
      this.dialogCompareVisible = true
      this.compareTemp.selectDate = row.accountDate
      this.compareTemp.balanceName = row.balanceName
      this.compareTemp.balanceType = row.balanceType
      this.compareTemp.selectAccount = row.account
      this.compareTemp.selectAccountFormat = this.formatMoney(row.account)
    },
    dateChange() {
      this.compareTemp.compareAccount = ''
      this.compareTemp.compareAccountFormat = ''
    },
    compareData() {
      const param = {
        accountDate: this.compareTemp.compareDate,
        balanceType: this.compareTemp.balanceType
      }
      this.$refs['compareForm'].validate((valid) => {
        if (valid) {
          postAction('/sys/balanceMain/compareDetail', param).then(res => {
            const { data, msg } = res
            if (data) {
              Message.success(msg)
              this.compareTemp.compareAccount = data.account
              this.compareTemp.compareAccountFormat = this.formatMoney(data.account)
            } else {
              Message.info(msg)
            }
          })
        }
      })
    },
    selectionChange(selectedRecords) {
      this.selectedRecords = selectedRecords
    }
  }
}
</script>

<style lang="scss" scoped>
.dot-position {
  margin-top: 10px;
  margin-right: 5px;
}
</style>
