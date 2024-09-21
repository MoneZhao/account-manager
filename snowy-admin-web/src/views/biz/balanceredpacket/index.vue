<template>
  <a-card :bordered="false">
    <a-form ref="searchFormRef" name="advanced_search" :model="searchFormState" class="ant-advanced-search-form">
      <a-row :gutter="24">
        <a-col :span="6">
          <a-form-item label="年份" name="accountYear">
            <a-date-picker
              placeholder="请选择年份"
              picker="year"
              value-format="YYYY"
              format="YYYY年"
              v-model:value="searchFormState.accountYear"
              :allowClear="false"
              :disabled-date="disabledDate"
              style="width: 100%"
            />
          </a-form-item>
        </a-col>
        <a-col :span="6">
          <a-form-item label="事由" name="reason">
            <a-input v-model:value="searchFormState.reason" placeholder="请输入事由" />
          </a-form-item>
        </a-col>
        <a-col :span="6">
          <a-form-item label="对方名" name="person">
            <a-input v-model:value="searchFormState.person" placeholder="请输入对方名" />
          </a-form-item>
        </a-col>
        <a-col :span="6" v-show="advanced">
          <a-form-item label="是否发红包" name="giveType">
            <a-select
              v-model:value="searchFormState.giveType"
              placeholder="请选择是否发红包"
              :options="giveTypeOptions"
            />
          </a-form-item>
        </a-col>
        <a-col :span="6" v-show="advanced">
          <a-form-item label="备注" name="remark">
            <a-input v-model:value="searchFormState.remark" placeholder="请输入备注" />
          </a-form-item>
        </a-col>
        <a-col :span="6">
          <a-button type="primary" @click="table.refresh(true)">查询</a-button>
          <a-button style="margin: 0 8px" @click="reset">重置</a-button>
          <a @click="toggleAdvanced" style="margin-left: 8px">
            {{ advanced ? '收起' : '展开' }}
            <component :is="advanced ? 'up-outlined' : 'down-outlined'" />
          </a>
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
          <a-button type="primary" @click="formRef.onOpen()" v-if="hasPerm('bizBalanceRedPacketAdd')">
            <template #icon><plus-outlined /></template>
            新增
          </a-button>
          <xn-batch-delete
            v-if="hasPerm('bizBalanceRedPacketBatchDelete')"
            :selectedRowKeys="selectedRowKeys"
            @batchDelete="deleteBatchBizBalanceRedPacket"
          />
        </a-space>
      </template>
      <template #bodyCell="{ column, record }">
        <template v-if="column.dataIndex === 'accountDate'">
          {{ $TOOL.formatDate(record.accountDate) }}
        </template>
        <template v-if="column.dataIndex === 'giveType' && record.giveType === '1'">
          <a-tag color="red">
            {{ $TOOL.dictTypeData('YES_OR_NO', record.giveType) }}
          </a-tag>
        </template>
        <template v-if="column.dataIndex === 'giveType' && record.giveType === '0'">
          <a-tag color="cyan">
            {{ $TOOL.dictTypeData('YES_OR_NO', record.giveType) }}
          </a-tag>
        </template>
        <template v-if="column.dataIndex === 'account'">
          <a-tag color="green">
            {{ $TOOL.formatMoney(record.account) }}
          </a-tag>
        </template>
        <template v-if="column.dataIndex === 'action'">
          <a-space>
            <a @click="formRef.onOpen(record)" v-if="hasPerm('bizBalanceRedPacketEdit')">编辑</a>
            <a-divider
              type="vertical"
              v-if="hasPerm(['bizBalanceRedPacketEdit', 'bizBalanceRedPacketDelete'], 'and')"
            />
            <a-popconfirm title="确定要删除吗？" @confirm="deleteBizBalanceRedPacket(record)">
              <a-button type="link" danger size="small" v-if="hasPerm('bizBalanceRedPacketDelete')">删除</a-button>
            </a-popconfirm>
          </a-space>
        </template>
      </template>
    </s-table>
  </a-card>
  <Form ref="formRef" @successful="table.refresh(true)" />
</template>

<script setup name="balanceredpacket">
  import tool from '@/utils/tool'
  import Form from './form.vue'
  import bizBalanceRedPacketApi from '@/api/biz/bizBalanceRedPacketApi'
  import dayjs from 'dayjs'
  let searchFormState = reactive({})
  const searchFormRef = ref()
  const table = ref()
  const formRef = ref()
  const toolConfig = { refresh: true, height: true, columnSetting: true, striped: false }
  // 查询区域显示更多控制
  const advanced = ref(false)
  const toggleAdvanced = () => {
    advanced.value = !advanced.value
  }
  const columns = [
    {
      title: '日期',
      dataIndex: 'accountDate',
      width: '150px'
    },
    {
      title: '对方名',
      dataIndex: 'person',
      width: '150px'
    },
    {
      title: '事由',
      dataIndex: 'reason',
      width: '150px'
    },
    {
      title: '是否发红包',
      dataIndex: 'giveType',
      width: '150px'
    },
    {
      title: '金额',
      dataIndex: 'account',
      width: '150px'
    },
    {
      title: '备注',
      dataIndex: 'remark'
    }
  ]
  // 操作栏通过权限判断是否显示
  if (hasPerm(['bizBalanceRedPacketEdit', 'bizBalanceRedPacketDelete'])) {
    columns.push({
      title: '操作',
      dataIndex: 'action',
      align: 'center',
      width: '150px'
    })
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
    // accountDate范围查询条件重载
    // if (searchFormParam.accountDate) {
    //   searchFormParam.startAccountDate = searchFormParam.accountDate[0]
    //   searchFormParam.endAccountDate = searchFormParam.accountDate[1]
    //   delete searchFormParam.accountDate
    // }
    return bizBalanceRedPacketApi.bizBalanceRedPacketPage(Object.assign(parameter, searchFormParam)).then((data) => {
      return data
    })
  }
  // 重置
  const reset = () => {
    searchFormRef.value.resetFields()
    table.value.refresh(true)
    table.value.clearSelected()
  }
  // 删除
  const deleteBizBalanceRedPacket = (record) => {
    let params = [
      {
        id: record.id
      }
    ]
    bizBalanceRedPacketApi.bizBalanceRedPacketDelete(params).then(() => {
      table.value.refresh(true)
    })
  }
  // 批量删除
  const deleteBatchBizBalanceRedPacket = (params) => {
    bizBalanceRedPacketApi.bizBalanceRedPacketDelete(params).then(() => {
      table.value.clearRefreshSelected()
    })
  }
  const giveTypeOptions = tool.dictList('YES_OR_NO')
  const disabledDate = (current) => {
    return current > dayjs().add(1, 'days')
  }
</script>
