<template>
  <el-dialog
    title="选择用户"
    :visible="dialogVisible"
    :append-to-body="appendToBody"
    width="80%"
    :before-close="close"
    destroy-on-close
  >
    <div class="el-dialog-body-custom-height">
      <el-row :gutter="5">
        <el-col :span="8">
          <div>
            <el-input v-model="filterText" placeholder="请输入过滤条件" style="margin-bottom:10px" />
            <el-tree
              ref="_selectOrgTree"
              :data="treeData"
              node-key="id"
              :props="defaultProps"
              :filter-node-method="filterNode"
              class="filter-tree"
              :highlight-current="highlight"
              default-expand-all
              :expand-on-click-node="false"
              @node-click="handleNodeClick"
            />
          </div>
        </el-col>
        <el-col :span="16">
          <div>
            <div class="filter-container" style="float: right">
              <el-input
                v-model="listQuery.userId"
                placeholder="用户ID"
                style="width: 200px;"
                class="filter-item"
                @keyup.enter.native="btnQuery"
              />
              <el-input
                v-model="listQuery.userName"
                placeholder="用户姓名"
                style="width: 200px;"
                class="filter-item"
                @keyup.enter.native="btnQuery"
              />
              <el-dropdown split-button type="primary" class="filter-item" @click="btnQuery">
                <i class="el-icon-search el-icon--left" />查询
                <el-dropdown-menu slot="dropdown">
                  <el-dropdown-item icon="el-icon-zoom-out" @click.native="btnReset">重置</el-dropdown-item>
                </el-dropdown-menu>
              </el-dropdown>
            </div>
            <el-table
              ref="_sysUserTable"
              :data="records"
              border
              fit
              highlight-current-row
              style="width: 100%;"
              :cell-style="{padding:'3px'}"
              @selection-change="selectionChange"
              @row-click="rowClick"
            >
              <template>
                <el-table-column v-if="multipleSelect" type="selection" align="center" />
                <el-table-column v-else>
                  <template slot-scope="scope">
                    <el-radio v-model="currentRadio" :label="scope.row.userId">
                      <span class="el-radio__label" />
                    </el-radio>
                  </template>
                </el-table-column>
              </template>
              <el-table-column label="用户姓名" prop="userName" align="center">
                <template slot-scope="scope">
                  <span>{{ scope.row.userName }}</span>
                </template>
              </el-table-column>
              <el-table-column label="所属机构ID" prop="orgId" align="center">
                <template slot-scope="scope">
                  <span>{{ scope.row.orgId }}</span>
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
                v-show="total>0"
                :total="total"
                :current.sync="listQuery.current"
                :size.sync="listQuery.size"
                @pagination="listSysUsers"
              />
            </div>
          </div>
          <div v-if="multipleSelect" class="selectedUsers">
            <el-alert
              :title="'当前已经选中' + tags.length + '个人员'"
              type="success"
            >
              <el-tag
                v-for="tag in tags"
                :key="tag.userId"
                style="margin: 5px;"
                size="medium"
              >
                {{ tag.userName }}
              </el-tag>
            </el-alert>

          </div>
        </el-col>
      </el-row>
    </div>
    <div slot="footer" class="dialog-footer">
      <el-button icon="el-icon-close" @click="dialogVisible = false">取消</el-button>
      <el-button icon="el-icon-check" type="primary" @click="confirm">确定</el-button>
    </div>
  </el-dialog>
</template>

<script>
import Pagination from '@/components/Pagination'
import { getAction } from '@/api/manage'
import { Message } from 'element-ui'

export default {
  name: 'SelectUser',
  components: { Pagination },
  props: {
    visible: {
      type: Boolean,
      default: false
    },
    multipleSelect: {
      type: Boolean,
      default: false
    },
    type: {
      type: String,
      default: ''
    },
    appendToBody: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      filterText: '',
      treeData: [],
      defaultProps: {
        children: 'children',
        label: 'label',
        isLeaf: 'isLeaf',
        data: 'data'
      },
      records: [],
      total: 0,
      selectedRecords: [],
      selectedRecord: {},
      listQuery: {
        current: 1,
        size: 10,
        userId: undefined,
        userName: undefined,
        orgId: undefined
      },
      currOrgId: '',
      tags: [],
      currentRadio: null,
      dialogVisible: false,
      highlight: true
    }
  },
  watch: {
    filterText(val) {
      this.$refs._selectOrgTree.filter(val)
    }
  },
  methods: {
    show() {
      this.dialogVisible = true
      if (this.treeData.length === 0) {
        this.getTreeData()
      }
      this.btnReset()
    },
    close() {
      this.currOrgId = ''
      this.listQuery = {
        current: 1,
        size: 10,
        userId: undefined,
        userName: undefined,
        orgId: undefined
      }
      this.tags = []
      this.dialogVisible = false
    },
    filterNode(value, data) {
      if (!value) return true
      return data.label.indexOf(value) !== -1
    },
    getTreeData() {
      getAction('/sys/org/getSelectTreeData', { type: this.type }).then(res => {
        const { data } = res
        this.treeData = data
      })
    },
    handleNodeClick(node) {
      this.highlight = node.id !== this.currOrgId
      if (!this.highlight) {
        this.currOrgId = ''
      } else {
        this.currOrgId = node.id
      }
      this.listSysUsers()
    },
    listSysUsers() {
      this.listQuery.orgId = this.currOrgId
      this.loading = true
      getAction('/sys/user/listSelectUser', this.listQuery).then(res => {
        const { data } = res
        this.records = data.records
        this.total = data.total
        this.loading = false
      })
    },
    btnQuery() {
      this.listQuery.current = 1
      this.listSysUsers()
    },
    btnReset() {
      this.currOrgId = ''
      this.listQuery = {
        current: 1,
        size: 10,
        userId: undefined,
        userName: undefined,
        orgId: undefined
      }
      this.tags = []
      this.listSysUsers()
    },
    selectionChange(selectedRecords) {
      this.tags = selectedRecords
      this.selectedRecords = selectedRecords
    },
    rowClick(row) {
      this.selectedRecord = row
      this.currentRadio = row.userId
    },
    confirm() {
      if (this.multipleSelect) {
        if (!this.selectedRecords || this.selectedRecords.length === 0) {
          Message.error('请先选择用户')
          return
        }
        this.$emit('selectUserFinished', this.selectedRecords)
      } else {
        if (!this.selectedRecord) {
          Message.error('请先选择用户')
          return
        }
        this.$emit('selectUserFinished', this.selectedRecord)
      }
      this.dialogVisible = false
    }
  }
}
</script>
