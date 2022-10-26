<template>
  <div class="app-container">
    <div style="float: right; padding-bottom: 5px">
      <el-button icon="el-icon-refresh" type="warning" class="filter-item" @click="restore">还原</el-button>
      <el-button icon="el-icon-search" type="primary" class="filter-item" @click="btnQuery">刷新</el-button>
    </div>
    <el-table
      ref="multipleTable"
      v-loading="mainLoading"
      :data="records"
      border
      fit
      highlight-current-row
      style="width: 100%;"
      :cell-style="{padding:'10px'}"
      @selection-change="selectionChange"
    >
      <el-table-column fixed type="selection" align="center" />
      <el-table-column fixed type="index" label="#" align="center" width="50" />
      <el-table-column label="记录时间" prop="accountDate" align="center"><template slot-scope="scope"><span>{{ formatDate(scope.row.accountDate) }}</span></template></el-table-column>
      <el-table-column label="账户余额" prop="account" align="center"><template slot-scope="scope"><span>{{ formatMoney(scope.row.account) }}</span></template></el-table-column>
      <el-table-column label="备注" prop="remark" align="center"><template slot-scope="scope"><span>{{ scope.row.remark }}</span></template></el-table-column>
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
  </div>
</template>

<script>
import Pagination from '@/components/Pagination'
import { getAction } from '@/api/manage'
import { Message } from 'element-ui'

export default {
  name: 'Trash',
  components: { Pagination },
  data() {
    return {
      records: null,
      selectedRecords: [],
      total: 0,
      listQuery: {
        current: 1,
        size: 10
      },
      mainLoading: false
    }
  },
  methods: {
    formatDate(date) {
      return this.$moment(date, 'YYYY-MM-DD').format('YYYY 年 MM 月 DD 日')
    },
    list() {
      this.mainLoading = true
      getAction('/sys/balanceMain/listDelete', this.listQuery).then(res => {
        const { data } = res
        this.records = data.records
        this.total = data.total
      }).finally(() => {
        this.mainLoading = false
      })
    },
    restore() {
      const ids = this.selectedRecords.map(record => {
        return record.balanceMainId
      })
      console.log(ids)
      if (ids.length === 0) {
        Message.error('请选择要还原的记录')
        return
      }
      this.$confirm('此操作将还原该记录, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        getAction('/sys/balanceMain/restore', { ids: ids.toString() }).then(({ msg }) => {
          Message.success(msg)
          this.list()
        })
      }).catch(() => {
        Message.info('已取消还原')
      })
    },
    btnQuery() {
      this.listQuery.current = 1
      this.listQuery.size = 10
      this.list()
    },
    selectionChange(selectedRecords) {
      this.selectedRecords = selectedRecords
    }
  }
}
</script>
