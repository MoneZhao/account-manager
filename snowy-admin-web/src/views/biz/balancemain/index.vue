<template>
  <a-card :bordered="false">
    <a-form ref="searchFormRef" name="advanced_search" :model="searchFormState" class="ant-advanced-search-form">
      <a-row :gutter="24">
        <a-col :md="8" :lg="8" :xl="6" :xxl="6">
          <a-form-item label="多条数据" name="multiData">
            <a-select
              v-model:value="searchFormState.multiData"
              placeholder="请选择当月多条数据"
              :options="multiDataOptions"
            />
          </a-form-item>
        </a-col>
        <a-col :md="10" :lg="10" :xl="8" :xxl="6">
          <a-form-item label="记录时间" name="accountDate">
            <a-range-picker
              v-model:value="searchFormState.accountDate"
              picker="month"
              value-format="YYYY-MM"
              format="YYYY年MM月"
              :disabled-date="disabledDate"
              :ranges="ranges"
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
      :custom-row="rowClick"
    >
      <template #operator class="table-operator">
        <a-space>
          <a-button type="primary" @click="formRef.onOpen()" v-if="hasPerm('bizBalanceMainAdd')">
            <template #icon><plus-outlined /></template>
            新增
          </a-button>
          <xn-batch-delete
            v-if="hasPerm('bizBalanceMainBatchDelete')"
            :selectedRowKeys="selectedRowKeys"
            @batchDelete="deleteBatchBizBalanceMain"
          />
          <a-popconfirm
            title="在更改计入总资产或者账户余额与账户明细不符合时更新全部账户余额, 是否继续？"
            @confirm="btnFixBatch"
          >
            <a-button
              type="primary"
              style="background-color: #f9b900; border: none"
              v-if="hasPerm('bizBalanceMainEdit')"
              :loading="fixLoading"
            >
              <template #icon><RedoOutlined /></template>
              更新账户余额
            </a-button>
          </a-popconfirm>
          <a-button @click="ImpExpRef.onOpen()" v-if="hasPerm('bizBalanceMainImport')">
            <template #icon><import-outlined /></template>
            <span>{{ $t('common.imports') }}</span>
          </a-button>
          <a-popconfirm title="导出所有账户余额, 是否继续？" @confirm="exportAll">
            <a-button v-if="hasPerm('bizBalanceMainExport')" :loading="exportLoading">
              <template #icon><export-outlined /></template>
              {{ $t('common.export') }}
            </a-button>
          </a-popconfirm>
          <a-button @click="trashRef.onOpen()">
            <template #icon><RestOutlined /></template>
            回收站
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
        <template v-if="column.dataIndex === 'action'">
          <a-space>
            <a @click="formRef.onOpen(record)" v-if="hasPerm('bizBalanceMainEdit')">编辑</a>
            <a-divider type="vertical" v-if="hasPerm(['bizBalanceMainEdit', 'bizBalanceMainDelete'], 'and')" />
            <a-popconfirm title="确定要删除吗？" @confirm="deleteBizBalanceMain(record)">
              <a-button type="link" danger size="small" v-if="hasPerm('bizBalanceMainDelete')">删除</a-button>
            </a-popconfirm>
            <a-divider type="vertical" v-if="hasPerm(['bizBalanceMainEdit', 'bizBalanceMainDelete'], 'and')" />
            <a-dropdown>
              <a class="ant-dropdown-link" @click.prevent>
                更多操作
                <DownOutlined />
              </a>
              <template #overlay>
                <a-menu>
                  <a-menu-item>
                    <a @click="openDetail(record)">详情</a>
                  </a-menu-item>
                  <a-menu-item>
                    <a @click="openCopy(record)">复制</a>
                  </a-menu-item>
                  <a-menu-item>
                    <a @click="openCompare(record)">对比</a>
                  </a-menu-item>
                </a-menu>
              </template>
            </a-dropdown>
          </a-space>
        </template>
      </template>
    </s-table>
  </a-card>
  <Form ref="formRef" @successful="table.refresh(true)" />
  <Trash ref="trashRef" @successful="table.refresh(true)" />
  <Copy ref="copyRef" @successful="table.refresh(true)" />
  <Detail ref="detailRef" @successful="table.refresh(true)" />
  <Compare ref="compareRef" @successful="table.refresh(true)" />
  <ImpExp ref="ImpExpRef" @successful="table.refresh(true)" />
</template>

<script setup name="balancemain">
  import Form from './form.vue'
  import ImpExp from './impExp.vue'
  import Trash from './trash.vue'
  import Copy from './copy.vue'
  import Compare from './compare.vue'
  import Detail from '../balancedetail/index.vue'
  import bizBalanceMainApi from '@/api/biz/bizBalanceMainApi'
  import tool from '@/utils/tool'
  import dayjs from 'dayjs'
  import { message } from 'ant-design-vue'
  import downloadUtil from '@/utils/downloadUtil'
  let searchFormState = reactive({})
  const searchFormRef = ref()
  const table = ref()
  const formRef = ref()
  const trashRef = ref()
  const copyRef = ref()
  const compareRef = ref()
  const detailRef = ref()
  const toolConfig = { refresh: true, height: true, columnSetting: true, striped: false }
  const columns = [
    {
      title: '记录时间',
      dataIndex: 'accountDate'
    },
    {
      title: '账户余额',
      dataIndex: 'account'
    }
  ]
  // 用户名通过权限判断是否显示
  if (hasPerm(['bizBalanceMainUserName'])) {
    columns.push({
      title: '所属用户',
      dataIndex: 'userName'
    })
  }
  columns.push({
    title: '备注',
    dataIndex: 'remark'
  })
  // 操作栏通过权限判断是否显示
  if (hasPerm(['bizBalanceMainEdit', 'bizBalanceMainDelete'])) {
    columns.push({
      title: '操作',
      dataIndex: 'action',
      align: 'center'
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
    if (searchFormParam.accountDate && searchFormParam.accountDate.length === 2) {
      searchFormParam.startAccountDate = searchFormParam.accountDate[0] + '-01'
      searchFormParam.endAccountDate = dayjs(searchFormParam.accountDate[1] + '-01', 'YYYY-MM-DD')
        .add(1, 'months')
        .add(-1, 'days')
        .format('YYYY-MM-DD')
    }
    delete searchFormParam.accountDate
    return bizBalanceMainApi.bizBalanceMainPage(Object.assign(parameter, searchFormParam)).then((data) => {
      return data
    })
  }
  // 重置
  const reset = () => {
    searchFormRef.value.resetFields()
    table.value.refresh(true)
  }
  // 删除
  const deleteBizBalanceMain = (record) => {
    let params = [
      {
        id: record.id
      }
    ]
    bizBalanceMainApi.bizBalanceMainDelete(params).then(() => {
      table.value.refresh(true)
    })
  }
  // 批量删除
  const deleteBatchBizBalanceMain = (params) => {
    bizBalanceMainApi.bizBalanceMainDelete(params).then(() => {
      table.value.clearRefreshSelected()
    })
  }
  const fixLoading = ref(false)
  //更新全部账户余额
  const btnFixBatch = () => {
    fixLoading.value = true
    bizBalanceMainApi
      .bizBalanceMainFixBatch()
      .then(() => {
        table.value.refresh()
      })
      .finally(() => {
        fixLoading.value = false
      })
  }
  const multiDataOptions = tool.dictList('YES_OR_NO')
  const rowClick = (record, index) => {
    return {
      // onClick: (event) => {
      // },
      onDblclick: (event) => {
        openDetail(record)
      }
    }
  }
  const openDetail = (record) => {
    if (record) {
      detailRef.value.onOpen(record)
    } else {
      message.warn('未选中数据')
    }
  }
  const openCopy = (record) => {
    if (record) {
      copyRef.value.onOpen(record)
    } else {
      message.warn('未选中数据')
    }
  }
  const openCompare = (record) => {
    if (record) {
      compareRef.value.onOpen(record)
    } else {
      message.warn('未选中数据')
    }
  }
  const disabledDate = (current) => {
    return current > dayjs().add(1, 'days')
  }
  const ranges = ref({
    今年至今: [dayjs(new Date(new Date().getFullYear(), 0)), dayjs()],
    最近一年: [dayjs().add(-1, 'y'), dayjs()],
    最近两年: [dayjs().add(-2, 'y'), dayjs()],
    最近四年: [dayjs().add(-4, 'y'), dayjs()]
  })
  const exportLoading = ref(false)
  const exportAll = () => {
    exportLoading.value = true
    bizBalanceMainApi
      .bizBalanceMainExport()
      .then((res) => {
        downloadUtil.resultDownload(res)
      })
      .finally(() => {
        exportLoading.value = false
      })
  }
  const ImpExpRef = ref()
</script>
