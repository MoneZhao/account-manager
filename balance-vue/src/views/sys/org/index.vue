<template>
  <div class="app-container">
    <el-row :gutter="20">
      <el-col :span="6">
        <el-card>
          <div slot="header" class="clearfix">
            <span>机构树</span>
          </div>
          <!-- <el-button icon="el-icon-plus" type="primary" @click="btnAdd">新增</el-button>
          <el-button icon="el-icon-delete" @click="btnDelete">删除</el-button>-->
          <el-input
            v-model="filterText"
            placeholder="请输入过滤条件"
            style="margin-bottom: 10px;"
            prefix-icon="el-icon-search"
          />
          <el-tree
            ref="orgTree"
            v-loading="loading"
            :data="treeData"
            highlight-current
            node-key="id"
            :props="defaultProps"
            default-expand-all
            :filter-node-method="filterNode"
            :expand-on-click-node="false"
            class="filter-tree"
          >
            <span slot-scope="{ node, data }" class="custom-tree-node">
              <span>{{ node.label }}</span>
              <span>
                <el-tooltip effect="dark" content="删除" placement="top">
                  <i class="el-icon-delete deleteIcon" @click="deleteNode(data.id)" />
                </el-tooltip>
                <el-tooltip effect="dark" content="新增" placement="top">
                  <i class="el-icon-plus addIcon" @click="addNode(data)" />
                </el-tooltip>
                <el-tooltip effect="dark" content="编辑" placement="top">
                  <i class="el-icon-edit editIcon" @click="editNode(data)" />
                </el-tooltip>
              </span>
            </span>
          </el-tree>
        </el-card>
      </el-col>

      <el-col :span="18">
        <el-card>
          <div slot="header" class="clearfix">
            <span>机构图谱</span>
          </div>
          <div>
            <el-row v-for="item in treeData" :key="item.id">
              <el-col>
                <el-scrollbar style="width: 100%">
                  <vue2-org-tree
                    name="vueOrgTree"
                    :data="item"
                    :horizontal="horizontal"
                    :collapsable="collapsable"
                    :label-class-name="labelClassName"
                    :render-content="renderContent"
                    @on-expand="onExpands"
                    @on-node-click="onNodeClick"
                  />
                </el-scrollbar>
              </el-col>
            </el-row>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <org-modal ref="orgModal" @ok="refreshTree" />
    <org-detail ref="orgDetail" />
  </div>
</template>

<script>
import { getAction, putAction, postAction, deleteAction } from '@/api/manage'
import { Message } from 'element-ui'

import OrgModal from './modules/OrgModal'
import OrgDetail from './modules/OrgDetail'

export default {
  name: 'BaseOrg',
  components: {
    OrgModal,
    OrgDetail
  },
  data() {
    return {
      dicts: [],
      filterText: '',
      treeData: [],
      defaultProps: {
        children: 'children',
        label: 'label',
        isLeaf: 'isLeaf',
        data: 'data'
      },

      loading: false,

      // 机构树的相关数据
      horizontal: false,
      collapsable: true,
      expandAll: true,
      labelClassName: 'bg-white',
      orgLoading: false
    }
  },
  watch: {
    filterText(val) {
      this.$refs.orgTree.filter(val)
    }
  },
  created() {
    this.getTreeData()
    this.getDicts('orgLevel,orgType,yesOrNo').then(({ data }) => {
      console.log(data)
      this.dicts = data
    })
  },
  methods: {

    getTreeData() {
      this.loading = true
      getAction('/sys/org/getTreeData', {}).then(res => {
        const { data } = res
        this.treeData = data
        this.show(data)
        this.loading = false
      })
    },
    filterNode(value, data) {
      if (!value) return true
      return data.label.indexOf(value) !== -1
    },
    addNode(row) {
      this.$refs.orgModal.add(row, this.dicts)
    },
    editNode(row) {
      this.$refs.orgModal.edit(row, this.dicts)
    },
    deleteNode(id) {
      this.$confirm('此操作将永久删除该机构节点, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteAction('/sys/org/delete', { ids: id }).then(({ msg, code }) => {
          if (code === 200) {
            Message.success('删除机构节点成功')
            this.getTreeData()
          } else {
            Message.error('删除机构节点失败:' + msg)
          }
        })
      })
    },
    refreshTree() {
      this.getTreeData()
    },

    // 机构图谱
    show(treeDate) {
      console.log(treeDate)
      this.toggleExpand(treeDate, this.expandAll)
    },
    renderContent(h, data) {
      const dicts = this.dicts
      console.log(dicts)
      // return data.label
      return (
        <el-dropdown trigger='click'>
          <span class='el-dropdown-link'>
            { data.label }
          </span>
          <el-dropdown-menu slot='dropdown'>
            <el-dropdown-item nativeOnClick={ () => { this.$refs.orgDetail.show(data.data) } }><i class='el-icon-tickets'></i>详情</el-dropdown-item>
            <el-dropdown-item divided nativeOnClick={ () => { this.$refs.orgModal.add(data, dicts) } }><i class='el-icon-plus'></i>添加子节点</el-dropdown-item>
            <el-dropdown-item divided nativeOnClick={ () => { this.$refs.orgModal.edit(data, dicts) } }><i class='el-icon-edit'></i>编辑子节点</el-dropdown-item>
            <el-dropdown-item divided nativeOnClick={ () => { this.deleteNode(data.id) } }><i class='el-icon-delete'></i>删除子节点</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      )
    },
    onExpands(e, data) {
      // console.log(data)
      if ('expand' in data) {
        data.expand = !data.expand
        if (!data.expand && data.children) {
          this.collapse(data.children)
        }
      } else {
        this.$set(data, 'expand', true)
      }
    },
    onNodeClick(e, data) {
      // this.onExpands(data)
      // console.log(e)
      console.log(data)
      // this.$refs.orgDetail.show(data.data)
    },
    collapse(list) {
      var _this = this
      list.forEach(function(child) {
        if (child.expand) {
          child.expand = false
        }
        child.children && _this.collapse(child.children)
      })
    },
    toggleExpand(data, val) {
      var _this = this
      if (Array.isArray(data)) {
        data.forEach(function(item) {
          _this.$set(item, 'expand', val)
          if (item.children) {
            _this.toggleExpand(item.children, val)
          }
        })
      } else {
        this.$set(data, 'expand', val)
        if (data.children) {
          _this.toggleExpand(data.children, val)
        }
      }
    }
  }
}
</script>

<style lang="scss">
.custom-tree-node {
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: space-between;
  font-size: 14px;
  padding-right: 8px;

  .addIcon {
    color: #67c23a;
    margin: 0 10px;
  }

  .editIcon {
    color: #409eff;
  }

  .deleteIcon {
    color: #f56c6c;
  }
}

.start-time /deep/ .line {
  text-align: center;
}
</style>
