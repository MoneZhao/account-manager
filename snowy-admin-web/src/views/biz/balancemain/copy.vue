<template>
  <xn-form-container title="账户记录复制" width="80%" :visible="visible" :destroy-on-close="true" @close="onClose">
    <a-form ref="formRef" :model="formData" :rules="formRules" layout="vertical">
      <a-card title="账户余额" style="margin-bottom: 10px">
        <a-form-item label="记录时间：" name="accountDate">
          <a-date-picker
            v-model:value="formData.accountDate"
            value-format="YYYY-MM-DD"
            format="YYYY 年 MM 月 DD 日"
            :disabled-date="disabledDate"
            placeholder="请选择记录时间"
            style="width: 100%"
          />
        </a-form-item>
        <a-form-item label="备注：" name="remark">
          <a-input v-model:value="formData.remark" placeholder="请输入备注" allow-clear />
        </a-form-item>
      </a-card>
      <a-card title="账户详情">
        <s-table
          ref="table"
          :show-pagination="false"
          :columns="columns"
          :data="loadData"
          bordered
          :row-key="(record) => record.id"
        >
          <template #bodyCell="{ column, record }">
            <template v-if="column.dataIndex === 'account'">
              <a-space v-if="record.isEditPropertyShow">
                <a-input-number
                  v-model:value="record.account"
                  placeholder="请输入账户余额"
                  allow-clear
                  style="width: 100%"
                  :min="1"
                />
              </a-space>
              <a-space v-else>
                {{ $TOOL.formatMoney(record.account) }}
              </a-space>
            </template>
            <template v-if="column.dataIndex === 'action'">
              <a-space v-if="record.isEditPropertyShow">
                <a @click="editDone(record)">保存</a>
                <a @click="editCancel(record)">取消</a>
              </a-space>
              <a-space v-else>
                <a @click="edit(record)">编辑</a>
              </a-space>
            </template>
          </template>
        </s-table>
      </a-card>
    </a-form>
    <template #footer>
      <a-button style="margin-right: 8px" @click="onClose">关闭</a-button>
      <a-button type="primary" @click="onSubmit" :loading="submitLoading">保存</a-button>
    </template>
  </xn-form-container>
</template>

<script setup name="copy">
  import bizBalanceDetailApi from '@/api/biz/bizBalanceDetailApi'
  import bizBalanceMainApi from '@/api/biz/bizBalanceMainApi'
  import { message } from 'ant-design-vue'
  import { cloneDeep } from 'lodash-es'
  import { required } from '@/utils/formRules'
  import dayjs from 'dayjs'
  // 抽屉状态
  const visible = ref(false)
  const emit = defineEmits({ successful: null })
  const formRef = ref()
  // 表单数据
  const formData = ref({})
  let tempData = {}
  // 默认要校验的
  const formRules = {
    accountDate: [required('请输入记录时间')]
  }
  const submitLoading = ref(false)
  const table = ref()
  const columns = [
    {
      title: '账户类型',
      dataIndex: 'balanceName'
    },
    {
      title: '账户余额',
      dataIndex: 'account'
    },
    {
      title: '操作',
      dataIndex: 'action'
    }
  ]
  const loadData = (parameter) => {
    const param = {
      balanceMainId: tempData.id
    }
    return bizBalanceDetailApi.bizBalanceDetailList(param).then((data) => {
      return data
    })
  }
  let oldAccount = undefined
  // 打开抽屉
  const onOpen = (record) => {
    if (record) {
      let recordData = cloneDeep(record)
      tempData = Object.assign({}, recordData)
    }
    oldAccount = undefined
    visible.value = true
  }
  // 关闭抽屉
  const onClose = () => {
    visible.value = false
    emit('successful')
  }
  const edit = (record) => {
    if (oldAccount) {
      message.warn('不能同时编辑多行')
      return
    }
    oldAccount = record.account
    record.isEditPropertyShow = true
  }
  const editDone = (record) => {
    oldAccount = undefined
    record.isEditPropertyShow = false
  }
  const editCancel = (record) => {
    record.account = oldAccount
    oldAccount = undefined
    record.isEditPropertyShow = false
  }
  const onSubmit = () => {
    formRef.value.validate().then(() => {
      submitLoading.value = true
      const formDataParam = cloneDeep(formData.value)
      const param = {
        ...formDataParam,
        details: cloneDeep(table.value.tableData())
      }
      bizBalanceMainApi
        .bizBalanceMainCopy(param)
        .then(() => {
          onClose()
          emit('successful')
        })
        .finally(() => {
          submitLoading.value = false
        })
    })
  }
  const disabledDate = (current) => {
    return current > dayjs().add(1, 'days')
  }
  // 抛出函数
  defineExpose({
    onOpen
  })
</script>
