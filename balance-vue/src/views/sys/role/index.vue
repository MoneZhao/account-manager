<template>
  <div class="app-container">
    <div class="filter-container">
      <el-button-group>
        <el-button v-permission="'sys:role:save'" icon="el-icon-plus" type="primary" class="filter-item" @click="btnCreate">新增
        </el-button>
        <el-button v-permission="'sys:role:delete'" icon="el-icon-delete" class="filter-item" @click="btnDelete()">批量删除</el-button>
      </el-button-group>
      <div style="float: right">
        <el-input v-model="listQuery.roleName" placeholder="角色名称" style="width: 200px;" class="filter-item" @keyup.enter.native="btnQuery" />
        <el-dropdown v-permission="'sys:role:list'" split-button type="primary" class="filter-item" @click="btnQuery">
          <i class="el-icon-search el-icon--left" />查询
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item icon="el-icon-zoom-out" @click.native="btnReset">重置</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
    </div>
    <el-table
      ref="roleTable"
      :data="records"
      border
      fit
      highlight-current-row
      style="width: 100%;"
      :cell-style="{padding:'3px'}"
      @cell-dblclick="btnView"
      @selection-change="selectionChange"
    >
      <el-table-column type="selection" align="center" />
      <el-table-column type="index" label="#" align="center" width="50" />
      <el-table-column label="角色名称" prop="roleName" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.roleName }}</span>
        </template>
      </el-table-column>
      <el-table-column label="排序号" prop="sortNo" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.sortNo }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" prop="remark" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.remark }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center">
        <template slot-scope="{row}">
          <el-dropdown>
            <span class="el-dropdown-link">操作<i class="el-icon-arrow-down el-icon--right" /></span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item icon="el-icon-view" @click.native="btnView(row)">查看</el-dropdown-item>
              <el-dropdown-item v-permission="'sys:role:update'" icon="el-icon-edit" divided @click.native="btnUpdate(row)">
                修改</el-dropdown-item>
              <el-dropdown-item v-permission="'sys:role:delete'" icon="el-icon-delete" divided @click.native="btnDelete(row.roleId)">
                删除</el-dropdown-item>
              <el-dropdown-item
                v-permission="'sys:role:getRolePermissions'"
                icon="el-icon-setting"
                divided
                @click.native="btnPermission(row)"
              >
                角色授权</el-dropdown-item>
              <el-dropdown-item
                v-permission="'sys:role:getRoleUser'"
                icon="el-icon-setting"
                divided
                @click.native="btnRoleUser(row)"
              >
                分配用户</el-dropdown-item>
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

    <el-dialog title="角色" :visible.sync="dialogFormVisible">
      <el-form ref="dataForm" :rules="rules" :model="temp" :disabled="dialogStatus==='view'" label-position="right" label-width="auto">
        <el-form-item label="角色名称" prop="roleName">
          <el-input v-model="temp.roleName" />
        </el-form-item>
        <el-form-item label="排序号" prop="sortNo">
          <el-input v-model="temp.sortNo" />
        </el-form-item>
        <el-form-item label="备注">
          <el-input
            v-model="temp.remark"
            :autosize="{ minRows: 2, maxRows: 4}"
            type="textarea"
            placeholder="请输入备注信息"
          />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button icon="el-icon-close" @click="dialogFormVisible = false">取消</el-button>
        <el-button v-if="dialogStatus!=='view'" icon="el-icon-check" type="primary" @click="dialogStatus==='create'?createData():updateData()">
          确定
        </el-button>
      </div>
    </el-dialog>

    <el-dialog :title="rolePermissionTitle" :visible.sync="dialogPermissionFormVisible">
      <div class="el-dialog-body-custom-height">
        <el-row v-loading="loading" :gutter="20">
          <el-col :span="12">
            <el-card shadow="hover">
              <div slot="header" class="clearfix">
                <span>所有资源</span>
              </div>
              <el-tree
                ref="permissionTree"
                :data="treeData"
                node-key="id"
                :props="defaultProps"
                class="filter-tree"
                show-checkbox
                check-on-click-node
                check-strictly
                :expand-on-click-node="false"
                :default-expanded-keys="defaultExpandKeys"
                :default-checked-keys="selectedTreeKeys"
                @check-change="checkChange"
              />
            </el-card>
          </el-col>
          <el-col :span="12">
            <el-card shadow="hover">
              <div slot="header" class="clearfix">
                <span>授权菜单</span>
              </div>
              <el-tree
                ref="rightTree"
                :data="selectedData"
                node-key="id"
                class="filter-tree"
                :default-expanded-keys="rightExpandKeys"
              />
            </el-card>
          </el-col>
        </el-row>
      </div>
      <div slot="footer" class="dialog-footer">
        <el-button icon="el-icon-close" @click="dialogPermissionFormVisible = false">取消</el-button>
        <el-button icon="el-icon-check" type="primary" @click="permissionData">确定</el-button>
      </div>
    </el-dialog>
    <el-dialog :title="roleUserTitle" width="80%" :visible.sync="dialogRoleUserFormVisible" custom-class="el-dialog-custom-height">
      <div class="filter-container">
        <el-button-group>
          <el-button icon="el-icon-plus" type="primary" class="filter-item" @click="btnRoleUserAdd">新增</el-button>
          <el-button icon="el-icon-delete" class="filter-item" @click="btnRoleUserDelete">批量删除</el-button>
        </el-button-group>
        <div style="float: right">
          <el-input
            v-model="listQueryRoleUser.userName"
            placeholder="用户姓名"
            style="width: 120px;"
            class="filter-item"
            @keyup.enter.native="getRoleUser"
          />
          <el-dropdown split-button type="primary" class="filter-item" @click="getRoleUser">
            <i class="el-icon-search el-icon--left" />查询
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item icon="el-icon-zoom-out" @click.native="btnRoleUserReset">重置</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </div>
      </div>
      <el-table
        ref="roleUserTable"
        :data="recordsRoleUser"
        border
        fit
        highlight-current-row
        style="width: 100%;"
        :cell-style="{padding:'3px'}"
        @selection-change="selectionChangeRoleUser"
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
          v-show="totalRoleUser>0"
          :total="totalRoleUser"
          :current.sync="listQueryRoleUser.current"
          :size.sync="listQueryRoleUser.size"
          @pagination="getRoleUser"
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
  name: 'SysRole',
  components: { Pagination, SelectUser },
  data() {
    return {
      records: null,
      selectedRecords: [],
      total: 0,
      listQuery: {
        current: 1,
        size: 10,
        roleName: undefined
      },
      dialogFormVisible: false,
      dialogStatus: '',
      temp: {
        roleName: '',
        sortNo: '',
        remark: ''
      },
      rules: {
        roleName: [{ required: true, message: '该项不能为空', trigger: 'change' }],
        sortNo: [{ required: true, message: '该项不能为空', trigger: 'change' }]
      },
      dialogPermissionFormVisible: false,
      dialogRoleUserFormVisible: false,
      treeData: [],
      defaultProps: {
        children: 'children',
        label: 'label',
        isLeaf: 'isLeaf',
        data: 'data'
      },
      currRoleId: '',
      currRoleName: '',
      recordsRoleUser: null,
      selectedRecordsRoleUser: [],
      totalRoleUser: 0,
      listQueryRoleUser: {
        current: 1,
        size: 10,
        roleId: undefined,
        userName: undefined
      },
      defaultExpandKeys: [],
      selectedData: [],
      selectedTreeKeys: [],
      loading: false
    }
  },
  computed: {
    rolePermissionTitle: {
      get() {
        return '角色【' + this.currRoleName + '】授权'
      }
    },
    roleUserTitle: {
      get() {
        return '角色【' + this.currRoleName + '】分配用户'
      }
    },
    rightExpandKeys: {
      get() {
        return this.selectedData ? this.selectedData.map(item => item.id) : []
      }
    }
  },
  created() {
    this.list()
  },
  methods: {
    list() {
      getAction('/sys/role/list', this.listQuery).then(res => {
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
        roleName: undefined
      }
      this.list()
    },
    resetTemp() {
      this.temp = {
        roleName: '',
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
          postAction('/sys/role/save', this.temp).then(({ msg }) => {
            this.dialogFormVisible = false
            Message.success(msg)
            this.list()
          })
        }
      })
    },
    btnUpdate(row) {
      this.temp = Object.assign({}, row) // copy obj
      this.dialogStatus = 'update'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    updateData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          putAction('/sys/role/update', this.temp).then(({ msg }) => {
            this.dialogFormVisible = false
            Message.success(msg)
            this.list()
          })
        }
      })
    },
    btnDelete(id) {
      const ids = id ? [id] : this.selectedRecords.map(record => {
        return record.roleId
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
        deleteAction('/sys/role/delete', { ids: ids.toString() }).then(({ msg }) => {
          Message.success(msg)
          this.list()
        })
      })
    },
    selectionChange(selectedRecords) {
      this.selectedRecords = selectedRecords
    },
    getTreeData(roleId) {
      getAction('/sys/role/getRolePermissions', { roleId }).then(res => {
        const { data } = res
        this.treeData = data.permissionTree
        this.selectedTreeKeys = data.permissions
        if (this.selectedTreeKeys) {
          this.defaultExpandKeys = this.treeData.map(item => item.id).filter(e => this.selectedTreeKeys.indexOf(e) >= 0)
        }
        this.selectedData = this.makeShortCutSelectedMenuData(
          this.treeData,
          data.permissions
        )
        this.$nextTick(() => {
          this.loading = false
        })
      })
    },
    checkChange(data, nodeChecked) {
      const node = this.$refs['permissionTree'].getNode(data)
      if (!nodeChecked) {
        this.childNodesChange(node)
      } else {
        this.parentNodesChange(node)
      }
      this.selectedData = this.makeShortCutSelectedMenuData(
        this.treeData,
        this.$refs.permissionTree.getCheckedKeys()
      )
    },
    childNodesChange(node) {
      const len = node.childNodes.length
      for (let i = 0; i < len; i++) {
        node.childNodes[i].checked = false
        this.childNodesChange(node.childNodes[i])
      }
    },
    parentNodesChange(node) {
      if (node.parent) {
        for (const key in node) {
          if (key === 'parent') {
            node[key].checked = true
            this.parentNodesChange(node[key])
          }
        }
      }
    },
    makeShortCutSelectedMenuData(data, selectedKeys) {
      let ret = null
      for (let i = 0; i < data.length; i++) {
        let childRet = null
        if (data[i].children && data[i].children.length > 0) {
          childRet = this.makeShortCutSelectedMenuData(data[i].children, selectedKeys)
        }
        if (childRet || selectedKeys.indexOf(data[i].id) >= 0) {
          if (!ret) ret = []
          const newData = {
            id: data[i].id,
            isLeaf: data[i].isLeaf,
            label: data[i].label,
            parentId: data[i].parentId,
            data: data[i].data
          }
          if (childRet) {
            newData.children = childRet
          }
          ret.push(newData)
        }
      }
      return ret
    },
    btnPermission(row) {
      this.currRoleId = row.roleId
      this.currRoleName = row.roleName
      this.loading = true
      this.dialogPermissionFormVisible = true
      this.getTreeData(row.roleId)
    },
    permissionData() {
      const menuOrFuncIdNodes = this.$refs.permissionTree.getCheckedNodes()
      const menuOrFuncId = []
      const permissionType = []
      menuOrFuncIdNodes.forEach(
        ({ data }) => {
          menuOrFuncId.push(data.menuOrFuncId)
          permissionType.push(data.permissionType)
        }
      )
      const params = {
        roleId: this.currRoleId,
        menuOrFuncId: menuOrFuncId.toString(),
        permissionType: permissionType.toString()
      }
      postAction('/sys/role/saveRolePermissions', params).then(({ msg }) => {
        Message.success(msg)
        this.dialogPermissionFormVisible = false
      })
    },
    btnRoleUser(row) {
      this.currRoleId = row.roleId
      this.currRoleName = row.roleName
      this.dialogRoleUserFormVisible = true
      this.getRoleUser()
    },
    getRoleUser() {
      this.listQueryRoleUser.roleId = this.currRoleId
      getAction('/sys/role/getRoleUser', this.listQueryRoleUser).then(res => {
        const { data } = res
        this.recordsRoleUser = data.records
        this.totalRoleUser = data.total
      })
    },
    btnRoleUserQuery() {
      this.listQueryRoleUser.current = 1
      this.getRoleUser()
    },
    btnRoleUserReset() {
      this.listQueryRoleUser = {
        current: 1,
        size: 10,
        roleId: undefined,
        userName: undefined
      }
      this.getRoleUser()
    },
    selectionChangeRoleUser(selectedRecords) {
      this.selectedRecordsRoleUser = selectedRecords
    },
    btnRoleUserAdd() {
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
      postAction('/sys/role/saveRoleUsers', {
        roleId: this.currRoleId,
        userId: userId.toString()
      }).then(({ msg }) => {
        Message.success(msg)
        this.btnRoleUserQuery()
      })
    },
    btnRoleUserDelete() {
      const userId = this.selectedRecordsRoleUser.map(record => {
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
        deleteAction('/sys/role/deleteRoleUsers', {
          roleId: this.currRoleId,
          userIds: userId.toString()
        }).then(({ msg }) => {
          Message.success(msg)
          this.btnRoleUserQuery()
        })
      })
    }
  }
}
</script>
