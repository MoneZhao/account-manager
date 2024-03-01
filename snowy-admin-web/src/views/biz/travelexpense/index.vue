<template>
  <a-card :bordered="false">
    <a-form ref="searchFormRef" name="advanced_search" :model="searchFormState" class="ant-advanced-search-form">
      <a-row :gutter="24">
        <a-col :md="10" :lg="8" :xl="6">
          <a-form-item label="出差地点" name="travelPlace">
            <a-input v-model:value="searchFormState.travelPlace" placeholder="请输入出差地点" />
          </a-form-item>
        </a-col>
        <a-col :span="6">
          <a-button type="primary" @click="table.refresh(true)">查询</a-button>
          <a-button style="margin: 0 8px" @click="reset">重置</a-button>
        </a-col>
      </a-row>
    </a-form>
    <s-table
      ref="table"
      :columns="columns"
      :data="loadData"
      :alert="options.alert.show"
      bordered
      :row-key="(record) => record.id"
      :tool-config="toolConfig"
      :row-selection="options.rowSelection"
      :scroll="{ x: scrollX }"
      :custom-row="rowClick"
    >
      <template #operator class="table-operator">
        <a-space>
          <a-button type="primary" @click="formRef.onOpen()" v-if="hasPerm('bizTravelExpenseAdd')">
            <template #icon><plus-outlined /></template>
            新增
          </a-button>
          <xn-batch-delete
            v-if="hasPerm('bizTravelExpenseBatchDelete')"
            :selectedRowKeys="selectedRowKeys"
            @batchDelete="deleteBatchBizTravelExpense"
          />
          <a-button @click="ImpExpRef.onOpen()" v-if="hasPerm('bizTravelExpenseImport')">
            <template #icon><import-outlined /></template>
            <span>{{ $t('common.imports') }}</span>
          </a-button>
          <a-popconfirm title="导出所有出差报销, 是否继续？" @confirm="exportAll">
            <a-button v-if="hasPerm('bizTravelExpenseExport')" :loading="exportLoading">
              <template #icon><export-outlined /></template>
              {{ $t('common.export') }}
            </a-button>
          </a-popconfirm>
        </a-space>
      </template>
      <template #bodyCell="{ column, record }">
        <template v-if="column.dataIndex === 'useDay'">
          <a-tag color="blue">
            {{ record.useDay ? record.useDay : '-' }}
          </a-tag>
        </template>
        <template v-if="column.dataIndex === 'requestDate'">
          {{ $TOOL.formatDate(record.requestDate) }}
        </template>
        <template v-if="column.dataIndex === 'getDate'">
          {{ $TOOL.formatDate(record.getDate) }}
        </template>
        <template v-if="column.dataIndex === 'addNumber'">
          <a-tag color="blue">
            {{ $TOOL.formatMoney(record.addNumber) }}
          </a-tag>
        </template>
        <template v-if="column.dataIndex === 'useNumber'">
          {{ $TOOL.formatMoney(record.useNumber) }}
        </template>
        <template v-if="column.dataIndex === 'requestNumber'">
          {{ $TOOL.formatMoney(record.requestNumber) }}
        </template>
        <template v-if="column.dataIndex === 'getNumber'">
          {{ $TOOL.formatMoney(record.getNumber) }}
        </template>
        <template v-if="column.dataIndex === 'action'">
          <a-space>
            <a @click="formRef.onOpen(record)" v-if="hasPerm('bizTravelExpenseEdit')">编辑</a>
            <a-divider type="vertical" v-if="hasPerm(['bizTravelExpenseEdit', 'bizTravelExpenseDelete'], 'and')" />
            <a-popconfirm title="确定要删除吗？" @confirm="deleteBizTravelExpense(record)">
              <a-button type="link" danger size="small" v-if="hasPerm('bizTravelExpenseDelete')">删除</a-button>
            </a-popconfirm>
          </a-space>
        </template>
      </template>
    </s-table>
  </a-card>
  <Form ref="formRef" @successful="table.refresh(true)" />
  <ImpExp ref="ImpExpRef" @successful="table.refresh(true)" />
</template>

<script setup name="travelexpense">
  import Form from './form.vue'
  import ImpExp from './impExp.vue'
  import bizTravelExpenseApi from '@/api/biz/bizTravelExpenseApi'
  import downloadUtil from '@/utils/downloadUtil'
  let searchFormState = reactive({})
  const searchFormRef = ref()
  const table = ref()
  const formRef = ref()
  const toolConfig = { refresh: true, height: true, columnSetting: true, striped: false }
  const columns = [
    {
      title: '出差地点',
      fixed: 'left',
      width: '100px',
      dataIndex: 'travelPlace'
    },
    {
      title: '报销日期',
      width: '200px',
      dataIndex: 'requestDate'
    },
    {
      title: '到账日期',
      width: '200px',
      dataIndex: 'getDate'
    },
    {
      title: '报账天数',
      width: '150px',
      dataIndex: 'useDay'
    },
    {
      title: '实际花费',
      width: '150px',
      dataIndex: 'useNumber'
    },
    {
      title: '报销金额',
      width: '150px',
      dataIndex: 'requestNumber'
    },
    {
      title: '到账金额',
      width: '150px',
      dataIndex: 'getNumber'
    },
    {
      title: '得利',
      width: '150px',
      dataIndex: 'addNumber'
    }
  ]
  let scrollX = $ref(1600)
  // 用户名通过权限判断是否显示
  if (hasPerm(['bizTravelExpenseUserName'])) {
    columns.push({
      title: '所属用户',
      dataIndex: 'userName'
    })
    scrollX = 1700
  }
  columns.push({
    title: '备注',
    dataIndex: 'remark'
  })
  // 操作栏通过权限判断是否显示
  if (hasPerm(['bizTravelExpenseEdit', 'bizTravelExpenseDelete'])) {
    columns.push({
      title: '操作',
      dataIndex: 'action',
      align: 'center',
      fixed: 'right',
      width: '150px'
    })
  }
  const rowClick = (record, index) => {
    return {
      onDblclick: (event) => {
        formRef.value.onOpen(record)
      }
    }
  }
  const selectedRowKeys = ref([])
  // 列表选择配置
  const options = {
    // columns数字类型字段加入 needTotal: true 可以勾选自动算账
    alert: {
      show: true,
      clear: () => {
        selectedRowKeys.value = ref([])
      }
    },
    rowSelection: {
      onChange: (selectedRowKey, selectedRows) => {
        selectedRowKeys.value = selectedRowKey
      }
    }
  }
  const loadData = (parameter) => {
    const searchFormParam = JSON.parse(JSON.stringify(searchFormState))
    return bizTravelExpenseApi.bizTravelExpensePage(Object.assign(parameter, searchFormParam)).then((data) => {
      return data
    })
  }
  // 重置
  const reset = () => {
    searchFormRef.value.resetFields()
    table.value.refresh(true)
  }
  // 删除
  const deleteBizTravelExpense = (record) => {
    let params = [
      {
        id: record.id
      }
    ]
    bizTravelExpenseApi.bizTravelExpenseDelete(params).then(() => {
      table.value.refresh(true)
    })
  }
  // 批量删除
  const deleteBatchBizTravelExpense = (params) => {
    bizTravelExpenseApi.bizTravelExpenseDelete(params).then(() => {
      table.value.clearRefreshSelected()
    })
  }
  let exportLoading = $ref(false)
  const ImpExpRef = ref()
  const exportAll = () => {
    exportLoading = true
    bizTravelExpenseApi
      .bizTravelExpenseExport()
      .then((res) => {
        downloadUtil.resultDownload(res)
      })
      .finally(() => {
        exportLoading = false
      })
  }
</script>
