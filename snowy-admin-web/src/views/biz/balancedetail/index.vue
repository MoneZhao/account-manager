<template>
  <xn-form-container :title="config.title" width="100%" :visible="visible" :destroy-on-close="true" @close="onClose">
    <a-card :bordered="false">
      <a-form ref="searchFormRef" name="advanced_search" :model="searchFormState" class="ant-advanced-search-form">
        <a-row :gutter="24">
          <a-col :md="10" :lg="8" :xl="6">
            <a-form-item label="账户类型" name="balanceType">
              <a-select
                show-search
                option-filter-prop="label"
                v-model:value="searchFormState.balanceType"
                placeholder="请选择账户类型"
                :options="balanceTypeOptions"
              />
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
      >
        <template #operator class="table-operator">
          <a-space>
            <a-button type="primary" @click="formRef.onOpen({ balanceMainId: config.balanceMainId })">
              <template #icon><plus-outlined /></template>
              新增
            </a-button>
            <xn-batch-delete :selectedRowKeys="selectedRowKeys" @batchDelete="deleteBatchBizBalanceDetail" />
            <a-popover>
              <template #content>
                <span>{{ $TOOL.formatMoney(totalCount) }}</span>
              </template>
              <a-button type="dashed" size="default" shape="round">
                <template #icon>
                  <credit-card-outlined />
                </template>
                总计余额
              </a-button>
            </a-popover>
          </a-space>
        </template>
        <template #bodyCell="{ column, record }">
          <template v-if="column.dataIndex === 'balanceType'">
            {{ $TOOL.dictTypeData('BALANCE_TYPE', record.balanceType) }}
          </template>
          <template v-if="column.dataIndex === 'account'">
            {{ $TOOL.formatMoney(record.account) }}
          </template>
          <template v-if="column.dataIndex === 'countType'">
            <a-tag v-if="record.countType === '1'" color="green">
              {{ $TOOL.dictTypeData('YES_OR_NO', record.countType) }}
            </a-tag>
            <a-tag v-if="record.countType === '0'" color="red">
              {{ $TOOL.dictTypeData('YES_OR_NO', record.countType) }}
            </a-tag>
          </template>
          <template v-if="column.dataIndex === 'action'">
            <a-space>
              <a @click="formRef.onOpen(record)">编辑</a>
              <a-divider type="vertical" />
              <a-popconfirm title="确定要删除吗？" @confirm="deleteBizBalanceDetail(record)">
                <a-button type="link" danger size="small">删除</a-button>
              </a-popconfirm>
              <a-divider type="vertical" />
              <a @click="openCompare(record)">对比</a>
            </a-space>
          </template>
        </template>
      </s-table>
    </a-card>
    <template #footer>
      <a-button style="margin-right: 8px" @click="onClose">关闭</a-button>
    </template>
    <Form ref="formRef" @successful="table.refresh(true)" />
    <DetailCompare ref="compareRef" @successful="table.refresh(true)" />
  </xn-form-container>
</template>

<script setup name="balancedetail">
  import tool from '@/utils/tool'
  import DetailCompare from './compare.vue'
  import Form from './form.vue'
  import bizBalanceDetailApi from '@/api/biz/bizBalanceDetailApi'
  import { cloneDeep } from 'lodash-es'
  import { message } from 'ant-design-vue'
  let searchFormState = reactive({})
  const searchFormRef = ref()
  const table = ref()
  const formRef = ref()
  let totalCount = $ref(0)
  const toolConfig = { refresh: true, height: true, columnSetting: true, striped: false }
  // 抽屉状态
  const visible = ref(false)
  const emit = defineEmits({ successful: null })
  const config = ref({
    title: '账户详情',
    balanceMainId: undefined
  })
  const onOpen = (record) => {
    let recordData = cloneDeep(record)
    config.value.title = '账户详情 - (' + tool.formatDate(recordData.accountDate) + ')'
    config.value.balanceMainId = recordData.id
    visible.value = true
  }
  // 关闭抽屉
  const onClose = () => {
    visible.value = false
    emit('successful')
  }
  const columns = [
    {
      title: '账户余额',
      dataIndex: 'account'
    },
    {
      title: '账户类型',
      dataIndex: 'balanceType'
    },
    {
      title: '计入总资产',
      dataIndex: 'countType'
    },
    {
      title: '备注',
      dataIndex: 'remark'
    },
    {
      title: '操作',
      dataIndex: 'action'
    }
  ]
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
    searchFormParam.balanceMainId = config.value.balanceMainId
    return bizBalanceDetailApi.bizBalanceDetailPage(Object.assign(parameter, searchFormParam)).then((data) => {
      totalCount = 0
      for (let item of data.records) {
        totalCount += item.account
      }
      return data
    })
  }
  // 重置
  const reset = () => {
    searchFormRef.value.resetFields()
    table.value.refresh(true)
  }
  // 删除
  const deleteBizBalanceDetail = (record) => {
    let params = [
      {
        id: record.id
      }
    ]
    bizBalanceDetailApi.bizBalanceDetailDelete(params).then(() => {
      table.value.refresh(true)
    })
  }
  // 批量删除
  const deleteBatchBizBalanceDetail = (params) => {
    bizBalanceDetailApi.bizBalanceDetailDelete(params).then(() => {
      table.value.clearRefreshSelected()
    })
  }
  const balanceTypeOptions = tool.dictList('BALANCE_TYPE')
  const compareRef = ref()
  const openCompare = (record) => {
    if (record) {
      compareRef.value.onOpen(record)
    } else {
      message.warn('未选中数据')
    }
  }
  // 抛出函数
  defineExpose({
    onOpen
  })
</script>
