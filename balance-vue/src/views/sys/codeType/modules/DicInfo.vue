<template>
  <el-card>
    <div slot="header" class="clearfix">
      <span>字典信息 {{ checkedRow.codeTypeName ? '- ' + checkedRow.codeTypeName : '' }}</span>
    </div>
    <div class="filter-container">
      <el-button-group>
        <el-button
          v-permission="'sys:codeInfo:save'"
          icon="el-icon-plus"
          type="primary"
          class="filter-item"
          @click="btnCodeInfoCreate"
        >新增</el-button>
        <el-button
          v-permission="'sys:codeInfo:delete'"
          icon="el-icon-delete"
          class="filter-item"
          @click="btnCodeInfoDelete()"
        >批量删除</el-button>
      </el-button-group>

      <div style="float: right;">
        <el-input
          v-model="listCodeInfoQuery.content"
          placeholder="下拉框内容"
          style="width: 120px;"
          class="filter-item"
          @keyup.enter.native="btnCodeInfoQuery"
        />
        <el-input
          v-model="listCodeInfoQuery.sortNo"
          placeholder="排序号"
          style="width: 120px;"
          class="filter-item"
          @keyup.enter.native="btnCodeInfoQuery"
        />
        <el-dropdown split-button type="primary" class="filter-item" @click="btnCodeInfoQuery">
          <i class="el-icon-search el-icon--left" />查询
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item icon="el-icon-zoom-out" @click.native="btnCodeInfoReset">重置</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
    </div>
    <el-table
      ref="codeInfoTable"
      v-loading="listCodeInfoLoading"
      :data="recordsCodeInfo"
      highlight-current-row
      element-loading-text="拼命加载中"
      @selection-change="selectionChange"
    >
      <el-table-column type="selection" align="center" />
      <el-table-column type="index" label="#" align="center" width="50" />
      <el-table-column label="下拉框内容" prop="content" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.content }}</span>
        </template>
      </el-table-column>
      <el-table-column label="下拉框值" prop="value" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.value }}</span>
        </template>
      </el-table-column>
      <el-table-column label="排序号" prop="sortNo" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.sortNo }}</span>
        </template>
      </el-table-column>
      <el-table-column label="是否显示" prop="isOk" align="center">
        <template slot-scope="scope">
          <span v-html="formatDictText(dicts.yesOrNo,scope.row.isOk)" />
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center">
        <template slot-scope="{row}">
          <el-dropdown>
            <span class="el-dropdown-link">
              操作
              <i class="el-icon-arrow-down el-icon--right" />
            </span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item icon="el-icon-view" @click.native="btnCodeInfoView(row)">查看</el-dropdown-item>
              <el-dropdown-item
                v-permission="'sys:codeInfo:update'"
                icon="el-icon-edit"
                divided
                @click.native="btnCodeInfoUpdate(row)"
              >修改</el-dropdown-item>
              <el-dropdown-item
                v-permission="'sys:codeInfo:delete'"
                icon="el-icon-delete"
                divided
                @click.native="btnCodeInfoDelete(row.codeInfoId)"
              >删除</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </template>
      </el-table-column>
    </el-table>

    <div class="pagination-position">
      <pagination
        v-show="totalCodeInfo>0"
        :total="totalCodeInfo"
        :current.sync="listCodeInfoQuery.current"
        :size.sync="listCodeInfoQuery.size"
        @pagination="listCodeInfo"
      />
    </div>

    <el-dialog title="字典信息" :visible.sync="dialogFormVisible">
      <el-form
        ref="dataForm"
        :rules="rules"
        :model="temp"
        :disabled="dialogStatus==='view'"
        label-position="right"
        label-width="140px"
      >
        <el-form-item label="下拉框内容" prop="content">
          <el-input v-model="temp.content" style="width: 90%;" />
        </el-form-item>
        <el-form-item label="下拉框值" prop="value">
          <el-input v-model="temp.value" :readonly="dialogStatus==='update'" style="width: 90%;" />
        </el-form-item>
        <el-form-item label="上级联动值" prop="parentValue">
          <el-input v-model="temp.parentValue" style="width: 90%;" />
        </el-form-item>
        <el-form-item label="排序号" prop="sortNo">
          <el-input v-model.number="temp.sortNo" style="width: 90%;" />
        </el-form-item>
        <el-form-item label="是否显示" prop="isOk">
          <el-select v-model="temp.isOk" placeholder="是否显示">
            <el-option
              v-for="item in dicts.yesOrNo"
              :key="item.value"
              :label="item.content"
              :value="item.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="备注">
          <el-input
            v-model="temp.remark"
            :autosize="{ minRows: 2, maxRows: 4}"
            type="textarea"
            placeholder="请输入备注信息"
            style="width: 90%;"
          />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button icon="el-icon-close" @click="dialogFormVisible = false">取消</el-button>
        <el-button
          v-if="dialogStatus!=='view'"
          icon="el-icon-check"
          type="primary"
          @click="dialogStatus==='create'?createCodeInfoData():updateCodeInfoData()"
        >确定</el-button>
      </div>
    </el-dialog>
  </el-card>
</template>

<script>
import Pagination from '@/components/Pagination' // secondary package based on el-pagination
import { getAction, putAction, postAction, deleteAction } from '@/api/manage'
import { Message } from 'element-ui'
import bus from './bus'

export default {
  name: 'SysCodeInfo',
  components: { Pagination },
  data() {
    return {
      dicts: [],
      total: 0,
      selectedRecords: [],
      recordsCodeInfo: null,
      totalCodeInfo: 0,
      listCodeInfoLoading: false,
      listCodeInfoQuery: {
        current: 1,
        size: 10,
        codeTypeId: undefined,
        sortNo: undefined,
        content: undefined
      },
      currCodeTypeId: '',
      dialogFormVisible: false,
      dialogStatus: '',
      temp: {
        codeTypeId: this.currCodeTypeId,
        value: '',
        content: '',
        parentValue: '',
        sortNo: '',
        isOk: '1',
        remark: ''
      },
      rules: {
        content: [{ required: true, message: '该项不能为空', trigger: 'change' }],
        value: [{ required: true, message: '该项不能为空', trigger: 'change' }],
        isOk: [{ required: true, message: '该项不能为空', trigger: 'change' }],
        sortNo: [{ required: true, message: '该项不能为空', trigger: 'change' }]
      },

      checkedRow: {}
    }
  },
  beforeCreate() {
    this.getDicts('yesOrNo').then(({ data }) => { this.dicts = data })
  },
  created() {
    bus.$on('checkedRow', (data) => {
      this.checkedRow = data
      this.listCodeInfoQuery.codeTypeId = data.codeTypeId
      this.currCodeTypeId = data.codeTypeId
      this.listCodeInfo()
    })
  },
  methods: {
    listCodeInfo() {
      // if (!this.checkedRow.codeTypeName) {
      //   Message.error('请先选择代码类别')
      //   return
      // }
      this.listCodeInfoLoading = true
      // this.listCodeInfoQuery.codeTypeId = this.currCodeTypeId
      getAction('/sys/codeInfo/list', this.listCodeInfoQuery).then(res => {
        const { data } = res
        this.recordsCodeInfo = data.records
        this.totalCodeInfo = data.total
        this.listCodeInfoLoading = false
      })
    },
    btnCodeInfoQuery() {
      this.listCodeInfoQuery.current = 1
      this.listCodeInfo()
    },
    btnCodeInfoReset() {
      this.listCodeInfoQuery = {
        current: 1,
        size: 10,
        codeTypeId: this.currCodeTypeId,
        sortNo: undefined,
        content: undefined
      }
      this.listCodeInfo()
    },
    resetTemp() {
      this.temp = {
        codeTypeId: this.currCodeTypeId,
        value: '',
        content: '',
        parentValue: '',
        sortNo: '',
        isOk: '1',
        remark: ''
      }
    },
    btnCodeInfoView(row) {
      this.temp = Object.assign({}, row)
      this.dialogStatus = 'view'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    btnCodeInfoCreate() {
      if (!this.checkedRow.codeTypeName) {
        Message.error('请先选择代码类别')
        return
      }
      this.resetTemp()
      this.dialogStatus = 'create'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    createCodeInfoData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          postAction('/sys/codeInfo/save', this.temp).then(({ msg }) => {
            this.dialogFormVisible = false
            Message.success(msg)
            this.listCodeInfo()
          })
        }
      })
    },
    btnCodeInfoUpdate(row) {
      this.temp = Object.assign({}, row) // copy obj
      this.dialogStatus = 'update'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    updateCodeInfoData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          putAction('/sys/codeInfo/update', this.temp).then(({ msg }) => {
            this.dialogFormVisible = false
            Message.success(msg)
            this.listCodeInfo()
          })
        }
      })
    },
    btnCodeInfoDelete(id) {
      const ids = id ? [id] : this.selectedRecords.map(record => {
        return record.codeInfoId
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
        deleteAction('/sys/codeInfo/delete', { ids: ids.toString() }).then(({ msg }) => {
          Message.success(msg)
          this.listCodeInfo()
        })
      })
    },
    selectionChange(selectedRecords) {
      this.selectedRecords = selectedRecords
    }
  }
}
</script>
