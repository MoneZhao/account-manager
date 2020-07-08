<template>
  <div>
    <el-row v-loading="showShortCutModalTree.loading" :gutter="20">
      <el-col :span="10">
        <el-card shadow="hover">
          <div slot="header" class="clearfix">
            <span>所有资源</span>
          </div>
          <el-tree
            v-if="showShortCutModalTree.treeData.length"
            ref="leftTree"
            :data="showShortCutModalTree.treeData"
            :default-checked-keys="showShortCutModalTree.selectedTreeKeys"
            node-key="id"
            class="filter-tree"
            default-expand-all
            show-checkbox
            @check="checkShortCutTreeMenu"
          >
            <span slot-scope="{ node, data }">
              <span>
                <svg-icon :icon-class="data.data.menuIcon" />
                {{ node.label }}
              </span>
            </span>
          </el-tree>
        </el-card>
      </el-col>
      <el-col :span="10">
        <el-card shadow="hover">
          <div slot="header" class="clearfix">
            <span>已分配资源</span>
          </div>
          <el-tree
            ref="rightTree"
            :data="showShortCutModalTree.selectedMenuData"
            node-key="id"
            class="filter-tree"
            default-expand-all
          >
            <span slot-scope="{ node, data }">
              <span>
                <svg-icon :icon-class="data.data.menuIcon" />
                {{ node.label }}
              </span>
            </span></el-tree>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import { getAction, postAction } from '@/api/manage'
import { Message } from 'element-ui'

export default {
  name: 'ShortCut',
  props: {
    userId: {
      required: true,
      type: String
    },
    roleId: {
      required: true,
      type: String
    }
  },
  data() {
    return {
      permissions: [],
      showShortCutModalTree: {
        treeData: [],
        selectedMenuData: [],
        selectedTreeKeys: [],
        loading: false
      }
    }
  },
  created() {
    this.showShortCutModalTree = {
      treeData: [],
      selectedMenuData: [],
      selectedTreeKeys: [],
      loading: true
    }
    const param = {
      roleId: this.roleId
    }
    getAction('/sys/user/getAuthMenuList', param).then(res => {
      const { data } = res
      this.showShortCutModalTree.loading = false
      this.showShortCutModalTree.treeData = data.permissionTree
      this.permissions = data.permissions
      this.showShortCutModalTree.selectedTreeKeys = data.permissions
      this.showShortCutModalTree.selectedMenuData = this.makeShortCutSelectedMenuData(
        this.showShortCutModalTree.treeData,
        data.permissions
      )
    })
  },
  methods: {
    checkShortCutTreeMenu(node, { checkedKeys, halfCheckedKeys }) {
      this.showShortCutModalTree.selectedTreeKeys = checkedKeys
      this.showShortCutModalTree.selectedMenuData = this.makeShortCutSelectedMenuData(
        this.showShortCutModalTree.treeData,
        checkedKeys.concat(halfCheckedKeys)
      )
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
    editShortCut() {
      const { add, del } = this.diff(this.permissions, this.$refs.leftTree.getCheckedKeys(true))
      const param = {
        add,
        del,
        userId: this.userId
      }
      if (!add && !del) {
        this.showShortCutModal = false
        return
      }
      postAction('/sys/user/userShortCutSave', param).then(({ msg }) => {
        Message.success(msg)
        this.showShortCutModalTree = {
          treeData: [],
          selectedMenuData: [],
          selectedTreeKeys: [],
          loading: true
        }
        this.$emit('shotCutEnd')
      })
    },
    diff(oldData, newData) {
      const add = newData.filter(e => !oldData.find(c => c === e))
      const del = oldData.filter(e => !newData.find(c => c === e))
      return { add, del }
    }
  }
}
</script>
