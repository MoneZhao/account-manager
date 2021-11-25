<template>
  <div class="app-container">
    <div class="filter-container">
      <el-button-group>
        <el-button v-permission="'sys:post:save'" icon="el-icon-plus" type="primary" class="filter-item" @click="btnCreate">新增</el-button>
        <el-button v-permission="'sys:post:delete'" icon="el-icon-delete" class="filter-item" @click="btnDelete()">批量删除</el-button>
      </el-button-group>
      <div style="float: right">
        <el-input v-model="listQuery.postName" placeholder="岗位名称" style="width: 200px;" class="filter-item" @keyup.enter.native="btnQuery" />
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
      <el-table-column type="index" label="#" align="center" width="50" />
      <el-table-column label="岗位id" prop="postId" align="center"><template slot-scope="scope"><span>{{ scope.row.postId }}</span></template></el-table-column>
      <el-table-column label="岗位名称" prop="postName" align="center"><template slot-scope="scope"><span>{{ scope.row.postName }}</span></template></el-table-column>
      <el-table-column label="备注" prop="remark" align="center"><template slot-scope="scope"><span>{{ scope.row.remark }}</span></template></el-table-column>
      <el-table-column label="排序号" prop="sortNo" align="center"><template slot-scope="scope"><span>{{ scope.row.sortNo }}</span></template></el-table-column>
      <el-table-column label="操作" align="center">
        <template slot-scope="{row}">
          <el-dropdown>
            <span class="el-dropdown-link">操作<i class="el-icon-arrow-down el-icon--right" /></span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item icon="el-icon-view" @click.native="btnView(row)">查看</el-dropdown-item>
              <el-dropdown-item v-permission="'sys:post:update'" icon="el-icon-edit" divided @click.native="btnUpdate(row)">修改</el-dropdown-item>
              <el-dropdown-item v-permission="'sys:post:delete'" icon="el-icon-delete" divided @click.native="btnDelete(row.postId)">删除</el-dropdown-item>
              <el-dropdown-item v-permission="'sys:post:getPostUser'" icon="el-icon-setting" divided @click.native="btnPostUser(row.postId, row.postName)">分配用户</el-dropdown-item>
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

    <el-dialog title="岗位" :visible.sync="dialogFormVisible">
      <el-form ref="dataForm" :rules="rules" :model="temp" :disabled="dialogStatus==='view'" label-position="right" label-width="auto">
        <el-form-item label="岗位名称" prop="postName"><el-input v-model="temp.postName" /></el-form-item>
        <el-form-item label="排序号" prop="sortNo"><el-input v-model="temp.sortNo" /></el-form-item>
        <el-form-item label="备注" prop="remark"><el-input v-model="temp.remark" /></el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button icon="el-icon-close" @click="dialogFormVisible = false">取消</el-button>
        <el-button v-if="dialogStatus!=='view'" icon="el-icon-check" type="primary" @click="dialogStatus==='create'?createData():updateData()">确定</el-button>
      </div>
    </el-dialog>

    <el-dialog :title="postUserTitle" width="80%" :visible.sync="dialogPostUserVisible" custom-class="el-dialog-custom-height">
      <div class="filter-container">
        <el-button-group>
          <el-button icon="el-icon-plus" type="primary" class="filter-item" @click="btnPostUserAdd">新增</el-button>
          <el-button icon="el-icon-delete" class="filter-item" @click="btnPostUserDelete">批量删除</el-button>
        </el-button-group>
        <div style="float: right">
          <el-input
            v-model="listQueryPostUser.userName"
            placeholder="用户姓名"
            style="width: 120px;"
            class="filter-item"
            @keyup.enter.native="getPostUser"
          />
          <el-dropdown split-button type="primary" class="filter-item" @click="getPostUser">
            <i class="el-icon-search el-icon--left" />查询
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item icon="el-icon-zoom-out" @click.native="btnPostUserReset">重置</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </div>
      </div>
      <el-table
        ref="postUserTable"
        :data="recordsPostUser"
        border
        fit
        highlight-current-row
        style="width: 100%;"
        :cell-style="{padding:'3px'}"
        @selection-change="selectionChangePostUser"
      >
        <el-table-column type="selection" align="center" />
        <el-table-column type="index" label="#" align="center" width="50" />
        <el-table-column label="用户姓名" prop="userName" align="center">
          <template slot-scope="scope">
            <span>{{ scope.row.userName }}</span>
          </template>
        </el-table-column>
        <el-table-column label="所属机构" prop="orgName" align="center">
          <template slot-scope="scope">
            <span>{{ scope.row.orgName }}</span>
          </template>
        </el-table-column>
      </el-table>
      <div class="pagination-position">
        <pagination
          v-show="totalPostUser>0"
          :total="totalPostUser"
          :current.sync="listQueryPostUser.current"
          :size.sync="listQueryPostUser.size"
          @pagination="getPostUser"
        />
      </div>
    </el-dialog>
    <select-user
      ref="selectUser"
      :append-to-body="true"
      :multiple-select="true"
      @selectUserFinished="selectUserFinished"
    />
  </div>
</template>

<script>
import Pagination from '@/components/Pagination'
import SelectUser from '@/components/select/SelectUser'
import { getAction, putAction, postAction, deleteAction } from '@/api/manage'
import { Message } from 'element-ui'

export default {
  name: 'SysPost',
  components: { Pagination, SelectUser },
  data() {
    return {
      dicts: [],
      records: null,
      selectedRecords: [],
      total: 0,
      listQuery: {
        current: 1,
        size: 10,
        postName: undefined
      },
      dialogFormVisible: false,
      dialogStatus: '',
      temp: {
        postName: '',
        sortNo: '',
        remark: ''
      },
      rules: {
        postName: [{ required: true, message: '该项不能为空', trigger: 'change' }]
      },
      dialogPostUserVisible: false,
      currPostId: '',
      currPostName: '',
      recordsPostUser: null,
      selectedRecordsPostUser: [],
      totalPostUser: 0,
      listQueryPostUser: {
        current: 1,
        size: 10,
        postId: undefined,
        userName: undefined
      }
    }
  },
  computed: {
    postUserTitle: {
      get() {
        return '岗位【' + this.currPostName + '】分配用户'
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
      getAction('/sys/post/list', this.listQuery).then(res => {
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
        postName: undefined
      }
      this.list()
    },
    resetTemp() {
      this.temp = {
        postName: '',
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
          postAction('/sys/post/save', this.temp).then(({ msg }) => {
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
          putAction('/sys/post/update', this.temp).then(({ msg }) => {
            this.dialogFormVisible = false
            Message.success(msg)
            this.list()
          })
        }
      })
    },
    btnDelete(id) {
      const ids = id ? [id] : this.selectedRecords.map(record => {
        return record.postId
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
        deleteAction('/sys/post/delete', { ids: ids.toString() }).then(({ msg }) => {
          Message.success(msg)
          this.list()
        })
      })
    },
    selectionChange(selectedRecords) {
      this.selectedRecords = selectedRecords
    },
    btnPostUser(postId, postName) {
      this.currPostId = postId
      this.currPostName = postName
      this.dialogPostUserVisible = true
      this.getPostUser()
    },
    getPostUser() {
      this.listQueryPostUser.postId = this.currPostId
      getAction('/sys/post/getPostUser', this.listQueryPostUser).then(res => {
        const { data } = res
        this.recordsPostUser = data.records
        this.totalPostUser = data.total
      })
    },
    btnPostUserQuery() {
      this.listQueryPostUser.current = 1
      this.getPostUser()
    },
    btnPostUserReset() {
      this.listQueryPostUser = {
        current: 1,
        size: 10,
        postId: undefined,
        userName: undefined
      }
      this.getPostUser()
    },
    selectionChangePostUser(selectedRecords) {
      this.selectedRecordsPostUser = selectedRecords
    },
    btnPostUserAdd() {
      this.$refs.selectUser.show()
    },
    selectUserFinished(selectData) {
      if (!selectData || selectData.length === 0) {
        Message.error('请先选择用户')
        return
      }
      const userId = selectData.map(item => {
        return item.userId
      })
      postAction('/sys/post/savePostUsers', {
        postId: this.currPostId,
        userId: userId.toString()
      }).then(({ msg }) => {
        Message.success(msg)
        this.btnPostUserQuery()
      })
    },
    btnPostUserDelete() {
      const userId = this.selectedRecordsPostUser.map(record => {
        return record.userId
      })
      if (userId.length === 0) {
        Message.error('请选择要删除的记录')
        return
      }
      this.$confirm('此操作将永久删除该记录, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteAction('/sys/post/deletePostUsers', {
          postId: this.currPostId,
          userIds: userId.toString()
        }).then(({ msg }) => {
          Message.success(msg)
          this.btnPostUserQuery()
        })
      })
    }
  }
}
</script>
