<template>
  <xn-form-container title="回收站" width="80%" :visible="visible" :destroy-on-close="true" @close="onClose">
    <a-card :bordered="false">
      <s-table
        ref="table"
        :columns="columns"
        :data="loadData"
        :alert="options.alert.show"
        bordered
        :row-key="(record) => record.id"
        :row-selection="options.rowSelection"
      >
        <template #operator class="table-operator">
          <a-space>
            <a-popconfirm title="此操作将还原选中记录, 是否继续？" @confirm="restore">
              <a-button type="primary" style="background-color: #f9b900; border: none" :loading="restoreLoading">
                <template #icon><RedoOutlined /></template>
                还原
              </a-button>
            </a-popconfirm>
            <a-button type="primary" @click="table.refresh(false)">
              <template #icon><ReloadOutlined /></template>
              刷新
            </a-button>
          </a-space>
        </template>
        <template #bodyCell="{ column, record }">
          <template v-if="column.dataIndex === 'accountDate'">
            {{ $TOOL.formatDate(record.accountDate) }}
          </template>
          <template v-if="column.dataIndex === 'account'">
            {{ $TOOL.formatMoney(record.account) }}
          </template>
        </template>
      </s-table>
    </a-card>
    <template #footer>
      <a-button style="margin-right: 8px" @click="onClose">关闭</a-button>
    </template>
  </xn-form-container>
</template>

<script setup name="trash">
  import bizBalanceMainApi from '@/api/biz/bizBalanceMainApi'
  import { message } from 'ant-design-vue'
  // 抽屉状态
  const visible = ref(false)
  const emit = defineEmits({ successful: null })
  const table = ref()
  const columns = [
    {
      title: '记录时间',
      dataIndex: 'accountDate'
    },
    {
      title: '账户余额',
      dataIndex: 'account'
    },
    {
      title: '备注',
      dataIndex: 'remark'
    }
  ]
  const selectedRowKeys = ref([])
  // 列表选择配置
  const options = {
    // columns数字类型字段加入 needTotal: true 可以勾选自动算账
    alert: {
      show: false
    },
    rowSelection: {
      onChange: (selectedRowKey, selectedRows) => {
        selectedRowKeys.value = selectedRowKey
      }
    }
  }
  const loadData = (parameter) => {
    return bizBalanceMainApi.bizBalanceMainPageDelete(parameter).then((data) => {
      return data
    })
  }
  // 打开抽屉
  const onOpen = () => {
    visible.value = true
  }
  // 关闭抽屉
  const onClose = () => {
    visible.value = false
    emit('successful')
  }
  const restoreLoading = ref(false)
  const restore = () => {
    if (selectedRowKeys.value.length === 0) {
      message.warning('请选择要还原的记录')
      return
    }
    const ids = selectedRowKeys.value.join(',')
    restoreLoading.value = true
    bizBalanceMainApi
      .bizBalanceMainRestore({ ids: ids })
      .then(() => {
        table.value.refresh()
      })
      .finally(() => {
        restoreLoading.value = false
      })
  }
  // 抛出函数
  defineExpose({
    onOpen
  })
</script>
