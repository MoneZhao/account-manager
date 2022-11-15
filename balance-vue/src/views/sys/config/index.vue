<template>
  <div class="app-container">
    <div class="filter-container">
      <el-button-group>
        <el-button v-permission="'sys:config:save'" icon="el-icon-plus" type="primary" class="filter-item" @click="btnCreate">新增</el-button>
        <!--        <el-button v-permission="'sys:config:delete'" icon="el-icon-delete" class="filter-item" @click="btnDelete()">批量删除</el-button>-->
      </el-button-group>
      <div style="float: right">
        <el-input v-model="listQuery.configId" placeholder="系统参数ID" style="width: 200px;" class="filter-item" @keyup.enter.native="btnQuery" />
        <el-input v-model="listQuery.configName" placeholder="系统参数名称" style="width: 200px;" class="filter-item" @keyup.enter.native="btnQuery" />
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
      <!--      <el-table-column fixed type="selection" align="center" />-->
      <el-table-column fixed type="index" label="#" align="center" width="50" />
      <el-table-column label="系统参数ID" prop="configId" align="center"><template slot-scope="scope"><span>{{ scope.row.configId }}</span></template></el-table-column>
      <el-table-column label="系统参数名称" prop="configName" align="center"><template slot-scope="scope"><span>{{ scope.row.configName }}</span></template></el-table-column>
      <el-table-column label="系统参数值" prop="configValue" align="center"><template slot-scope="scope"><span>{{ scope.row.configValue }}</span></template></el-table-column>
      <el-table-column label="排序号" prop="sortNo" align="center"><template slot-scope="scope"><span>{{ scope.row.sortNo }}</span></template></el-table-column>
      <el-table-column label="备注" prop="remark" align="center"><template slot-scope="scope"><span>{{ scope.row.remark }}</span></template></el-table-column>
      <el-table-column fixed="right" label="操作" align="center">
        <template slot-scope="{row}">
          <el-dropdown trigger="click">
            <span class="el-dropdown-link">操作<i class="el-icon-arrow-down el-icon--right" /></span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item icon="el-icon-view" @click.native="btnView(row)">查看</el-dropdown-item>
              <el-dropdown-item v-if="row.canUpdate === '1'" v-permission="'sys:config:update'" icon="el-icon-edit" divided @click.native="btnUpdate(row)">修改</el-dropdown-item>
              <el-dropdown-item v-if="row.canDelete === '1'" v-permission="'sys:config:delete'" icon="el-icon-delete" divided @click.native="btnDelete(row.configId)">删除</el-dropdown-item>
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

    <el-dialog title="系统参数" :visible.sync="dialogFormVisible">
      <el-form ref="dataForm" :rules="rules" :model="temp" label-position="right" label-width="auto">
        <el-form-item label="系统参数ID" prop="configId"><el-input v-model="temp.configId" :readonly="dialogStatus==='update'" /></el-form-item>
        <el-form-item label="系统参数名称" prop="configName"><el-input v-model="temp.configName" /></el-form-item>
        <el-form-item label="系统参数值" prop="configValue"><el-input v-model="temp.configValue" /></el-form-item>
        <el-form-item v-show="dialogStatus === 'create'" label="可否修改" prop="canUpdate">
          <el-select v-model="temp.canUpdate" placeholder="可否修改">
            <el-option v-for="(item, index) in dicts.yesOrNo" :key="index" :label="item.content" :value="item.value" />
          </el-select>
        </el-form-item>
        <el-form-item v-show="dialogStatus === 'create'" label="可否删除" prop="canDelete">
          <el-select v-model="temp.canDelete" placeholder="可否删除">
            <el-option v-for="(item, index) in dicts.yesOrNo" :key="index" :label="item.content" :value="item.value" />
          </el-select>
        </el-form-item>
        <el-form-item label="排序号" prop="sortNo"><el-input v-model="temp.sortNo" /></el-form-item>
        <el-form-item label="备注" prop="remark"><el-input v-model="temp.remark" /></el-form-item>
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
  name: 'SysConfig',
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
        configId: undefined,
        configName: undefined
      },
      dialogFormVisible: false,
      dialogStatus: '',
      temp: {
        configId: undefined,
        configName: '',
        configValue: '',
        sortNo: '',
        canUpdate: '1',
        canDelete: '1',
        remark: ''
      },
      rules: {
        configId: [{ required: true, message: '该项不能为空', trigger: 'change' }],
        configName: [{ required: true, message: '该项不能为空', trigger: 'change' }],
        configValue: [{ required: true, message: '该项不能为空', trigger: 'change' }],
        sortNo: [{ required: true, message: '该项不能为空', trigger: 'change' }]
      }
    }
  },
  beforeCreate() {
    this.getDicts('yesOrNo').then(({ data }) => {
      this.dicts = data
    })
  },
  created() {
    this.list()
  },
  methods: {
    list() {
      getAction('/sys/config/list', this.listQuery).then(res => {
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
        configId: undefined,
        configName: undefined
      }
      this.list()
    },
    resetTemp() {
      this.temp = {
        configId: undefined,
        configName: '',
        configValue: '',
        canUpdate: '1',
        canDelete: '1',
        sortNo: '',
        remark: ''
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
          postAction('/sys/config/save', this.temp).then(({ msg }) => {
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
          putAction('/sys/config/update', this.temp).then(({ msg }) => {
            this.dialogFormVisible = false
            Message.success(msg)
            this.list()
          })
        }
      })
    },
    btnDelete(id) {
      const ids = id ? [id] : this.selectedRecords.map(record => {
        return record.configId
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
        deleteAction('/sys/config/delete', { ids: ids.toString() }).then(({ msg }) => {
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
