<template>
  <a-card :bordered="false">
    <a-form ref="searchFormRef" name="advanced_search" :model="searchFormState" class="ant-advanced-search-form">
      <a-row :gutter="24">
        <a-col :md="9" :lg="8" :xl="6" :xxl="6">
          <a-form-item label="账户类型" name="codeInfoId">
            <a-select
              v-model:value="searchFormState.codeInfoId"
              placeholder="请选择账户类型"
              :options="codeInfoIdOptions"
            />
          </a-form-item>
        </a-col>
        <a-col :md="9" :lg="10" :xl="8" :xxl="6">
          <a-form-item label="计入总资产" name="countType">
            <a-select
              v-model:value="searchFormState.countType"
              placeholder="请选择是否计入总资产"
              :options="countTypeOptions"
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
      bordered
      :row-key="(record) => record.id"
      :tool-config="toolConfig"
    >
      <template #bodyCell="{ column, record }">
        <template v-if="column.dataIndex === 'countType'">
          <!--          {{ $TOOL.dictTypeData('YES_OR_NO', record.countType) }}-->
          <a-switch
            :loading="submitLoading"
            v-model:checked="record.countType"
            checked-value="1"
            un-checked-value="0"
            checked-children="计入"
            un-checked-children="不计入"
            @change="editStatus(record)"
          />
        </template>
      </template>
    </s-table>
  </a-card>
</template>

<script setup name="balancecount">
  import tool from '@/utils/tool'
  import bizBalanceCountApi from '@/api/biz/bizBalanceCountApi'
  import { cloneDeep } from 'lodash-es'
  let searchFormState = reactive({})
  const searchFormRef = ref()
  const table = ref()
  const toolConfig = { refresh: true, height: true, columnSetting: true, striped: false }
  const columns = [
    {
      title: '#',
      dataIndex: 'index',
      customRender: (data) => `${data.index + 1}`
    },
    {
      title: '账户类型',
      dataIndex: 'dictLabel'
    },
    {
      title: '是否计入总资产',
      dataIndex: 'countType'
    }
  ]
  const selectedRowKeys = ref([])
  const loadData = (parameter) => {
    const searchFormParam = JSON.parse(JSON.stringify(searchFormState))
    return bizBalanceCountApi.bizBalanceCountPage(Object.assign(parameter, searchFormParam)).then((data) => {
      return data
    })
  }
  // 重置
  const reset = () => {
    searchFormRef.value.resetFields()
    table.value.refresh(true)
    table.value.clearSelected()
  }
  const codeInfoIdOptions = tool.dictList('BALANCE_TYPE')
  const countTypeOptions = tool.dictList('YES_OR_NO')
  const submitLoading = ref(false)
  const editStatus = (row) => {
    submitLoading.value = true
    const formDataParam = cloneDeep(row)
    bizBalanceCountApi.bizBalanceCountSubmitForm(formDataParam, true).finally(() => {
      submitLoading.value = false
      table.value.refresh(false)
    })
  }
</script>
