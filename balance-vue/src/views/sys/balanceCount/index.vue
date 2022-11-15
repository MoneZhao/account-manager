<template>
  <div class="app-container">
    <div class="filter-container">
      <!-- <el-button-group>
        <el-button v-permission="'sys:balanceCount:save'" icon="el-icon-plus" type="primary" class="filter-item" @click="btnCreate">新增</el-button>
        <el-button v-permission="'sys:balanceCount:delete'" icon="el-icon-delete" class="filter-item" @click="btnDelete()">批量删除</el-button>
      </el-button-group> -->
      <div style="float: right">
        <el-select v-model="listQuery.codeInfoId" placeholder="账户类型" class="filter-item"><el-option v-for="(item, index) in dicts.balanceType" :key="index" :label="item.content" :value="item.codeInfoId" /></el-select>
        <el-select v-model="listQuery.countType" placeholder="是否计入总资产" class="filter-item"><el-option v-for="(item, index) in dicts.yesOrNo" :key="index" :label="item.content" :value="item.value" /></el-select>
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
    >
      <!-- <el-table-column fixed type="selection" align="center" /> -->
      <el-table-column fixed type="index" label="#" align="center" width="50" />
      <!-- <el-table-column label="账户类型id" prop="codeInfoId" align="center"><template slot-scope="scope"><span>{{ scope.row.codeInfoId }}</span></template></el-table-column> -->
      <el-table-column label="账户类型" prop="content" align="center"><template slot-scope="scope"><span>{{ scope.row.content }}</span></template></el-table-column>
      <!-- <el-table-column label="是否计入总资产" prop="countType" align="center"><template slot-scope="scope"><span v-html="formatDictText(dicts.yesOrNo,scope.row.countType)" /></template></el-table-column> -->
      <el-table-column label="备注" prop="remark" align="center"><template slot-scope="scope"><span>{{ scope.row.remark }}</span></template></el-table-column>
      <el-table-column fixed="right" label="是否计入总资产" align="center">
        <template slot-scope="{row}">
          <el-switch
            v-model="row.countType"
            active-color="#13ce66"
            inactive-color="#ff4949"
            active-value="1"
            inactive-value="0"
            active-text="计入"
            inactive-text="不计入"
            @change="change(row)"
          />
          <!-- <el-dropdown trigger="click">
            <span class="el-dropdown-link">操作<i class="el-icon-arrow-down el-icon--right" /></span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item icon="el-icon-view" @click.native="btnView(row)">查看</el-dropdown-item>
              <el-dropdown-item v-permission="'sys:balanceCount:update'" icon="el-icon-edit" divided @click.native="btnUpdate(row)">修改</el-dropdown-item>
              <el-dropdown-item v-permission="'sys:balanceCount:delete'" icon="el-icon-delete" divided @click.native="btnDelete(row.balanceCountId)">删除</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown> -->
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

    <!-- <el-dialog title="计入总资产" :visible.sync="dialogFormVisible">
      <el-form ref="dataForm" :rules="rules" :model="temp" label-position="right" label-width="auto">
        <el-form-item label="账户类型id" prop="codeInfoId"><el-input v-model="temp.codeInfoId" maxlength="32" show-word-limit /></el-form-item>
        <el-form-item label="是否计入总资产" prop="countType"><el-select v-model="temp.countType" placeholder="是否计入总资产"><el-option v-for="(item, index) in dicts.yesOrNo" :key="index" :label="item.content" :value="item.value" /></el-select></el-form-item>
        <el-form-item label="所属用户" prop="userId"><el-input v-model="temp.userId" maxlength="32" show-word-limit /></el-form-item>
        <el-form-item label="备注" prop="remark"><el-input v-model="temp.remark" maxlength="255" show-word-limit /></el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button icon="el-icon-close" @click="dialogFormVisible = false">取消</el-button>
        <el-button v-if="dialogStatus!=='view'" icon="el-icon-check" type="primary" @click="dialogStatus==='create'?createData():updateData()">确定</el-button>
      </div>
    </el-dialog> -->
  </div>
</template>

<script>
import Pagination from '@/components/Pagination'
import { getAction, putAction } from '@/api/manage'
import { Message } from 'element-ui'

export default {
  name: 'SysBalanceCount',
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
        codeInfoId: undefined,
        countType: undefined
      },
      dialogFormVisible: false,
      dialogStatus: '',
      temp: {

      },
      rules: {
        codeInfoId: [{ required: true, message: '该项不能为空', trigger: 'change' }],
        countType: [{ required: true, message: '该项不能为空', trigger: 'change' }],
        userId: [{ required: true, message: '该项不能为空', trigger: 'change' }]
      }
    }
  },
  beforeCreate() {
    this.getDicts('yesOrNo,balanceType').then(({ data }) => { this.dicts = data })
  },
  created() {
    this.list()
  },
  mounted() {
    this.$message({
      center: true,
      showClose: true,
      message: '修改完后需要在余额列表中更新账户余额'
    })
  },
  methods: {
    list() {
      getAction('/sys/balanceCount/list', this.listQuery).then(res => {
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
        codeInfoId: undefined,
        countType: undefined
      }
      this.list()
    },
    resetTemp() {
      this.temp = {

      }
    },
    change(row) {
      const temp = Object.assign({}, row)
      console.log(temp)
      putAction('/sys/balanceCount/update', temp).then(({ msg }) => {
        // this.dialogFormVisible = false
        Message.success(msg)
      }).catch(e => {
        this.list()
      })
    }
    // btnView(row) {
    //   this.temp = Object.assign({}, row)
    //   this.dialogStatus = 'view'
    //   this.dialogFormVisible = true
    //   this.$nextTick(() => {
    //     this.$refs['dataForm'].clearValidate()
    //   })
    // },
    // btnCreate() {
    //   this.resetTemp()
    //   this.dialogStatus = 'create'
    //   this.dialogFormVisible = true
    //   this.$nextTick(() => {
    //     this.$refs['dataForm'].clearValidate()
    //   })
    // },
    // createData() {
    //   this.$refs['dataForm'].validate((valid) => {
    //     if (valid) {
    //       postAction('/sys/balanceCount/save', this.temp).then(({ msg }) => {
    //         this.dialogFormVisible = false
    //         Message.success(msg)
    //         this.list()
    //       })
    //     }
    //   })
    // },
    // btnUpdate(row) {
    //   this.temp = Object.assign({}, row)
    //   this.dialogStatus = 'update'
    //   this.dialogFormVisible = true
    //   this.$nextTick(() => {
    //     this.$refs['dataForm'].clearValidate()
    //   })
    // },
    // updateData() {
    //   this.$refs['dataForm'].validate((valid) => {
    //     if (valid) {
    //       putAction('/sys/balanceCount/update', this.temp).then(({ msg }) => {
    //         this.dialogFormVisible = false
    //         Message.success(msg)
    //         this.list()
    //       })
    //     }
    //   })
    // },
    // btnDelete(id) {
    //   const ids = id ? [id] : this.selectedRecords.map(record => {
    //     return record.balanceCountId
    //   })
    //   if (ids.length == 0) {
    //     Message.error('请选择要删除的记录')
    //     return
    //   }
    //   this.$confirm('此操作将永久删除该记录, 是否继续?', '提示', {
    //     confirmButtonText: '确定',
    //     cancelButtonText: '取消',
    //     type: 'warning'
    //   }).then(() => {
    //     deleteAction('/sys/balanceCount/delete', { ids: ids.toString() }).then(({ msg }) => {
    //       Message.success(msg)
    //       this.list()
    //     })
    //   })
    // },
    // selectionChange(selectedRecords) {
    //   this.selectedRecords = selectedRecords
    // }
  }
}
</script>
