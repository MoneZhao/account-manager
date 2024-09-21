<template>
  <xn-form-container
    :title="formData.id ? '编辑红包记账' : '增加红包记账'"
    :width="700"
    :visible="visible"
    :destroy-on-close="true"
    @close="onClose"
  >
    <a-form ref="formRef" :model="formData" :rules="formRules" layout="vertical">
      <a-form-item label="日期：" name="accountDate">
        <a-date-picker
          v-model:value="formData.accountDate"
          value-format="YYYY-MM-DD"
          format="YYYY 年 MM 月 DD 日"
          :disabled-date="disabledDate"
          placeholder="请选择日期"
          style="width: 100%"
        />
      </a-form-item>
      <a-form-item label="事由：" name="reason">
        <a-input v-model:value="formData.reason" placeholder="请输入事由" allow-clear />
      </a-form-item>
      <a-form-item label="是否发红包：" name="giveType">
        <a-select v-model:value="formData.giveType" placeholder="请选择是否发红包" :options="giveTypeOptions" />
      </a-form-item>
      <a-form-item label="对方名：" name="person">
        <a-input v-model:value="formData.person" placeholder="请输入对方名" allow-clear />
      </a-form-item>
      <a-form-item label="金额：" name="account">
        <a-input-number
          v-model:value="formData.account"
          placeholder="请输入发票金额"
          allow-clear
          style="width: 100%"
          :min="1"
        />
      </a-form-item>
      <a-form-item label="备注：" name="remark">
        <a-input v-model:value="formData.remark" placeholder="请输入备注" allow-clear />
      </a-form-item>
    </a-form>
    <template #footer>
      <a-button style="margin-right: 8px" @click="onClose">关闭</a-button>
      <a-button type="primary" @click="onSubmit" :loading="submitLoading">保存</a-button>
    </template>
  </xn-form-container>
</template>

<script setup name="bizBalanceRedPacketForm">
  import tool from '@/utils/tool'
  import { cloneDeep } from 'lodash-es'
  import { required } from '@/utils/formRules'
  import bizBalanceRedPacketApi from '@/api/biz/bizBalanceRedPacketApi'
  import dayjs from 'dayjs'
  // 抽屉状态
  const visible = ref(false)
  const emit = defineEmits({ successful: null })
  const formRef = ref()
  // 表单数据
  const formData = ref({})
  const submitLoading = ref(false)
  const giveTypeOptions = ref([])

  // 打开抽屉
  const onOpen = (record) => {
    visible.value = true
    if (record) {
      let recordData = cloneDeep(record)
      formData.value = Object.assign({}, recordData)
    }
    giveTypeOptions.value = tool.dictList('YES_OR_NO')
  }
  // 关闭抽屉
  const onClose = () => {
    formRef.value.resetFields()
    formData.value = {}
    visible.value = false
  }
  // 默认要校验的
  const formRules = {
    accountDate: [required('请输入时间')],
    reason: [required('请输入事由')],
    giveType: [required('请输入是否发红包')],
    person: [required('请输入对方名')],
    account: [required('请输入金额')],
  }
  // 验证并提交数据
  const onSubmit = () => {
    formRef.value.validate().then(() => {
      submitLoading.value = true
      const formDataParam = cloneDeep(formData.value)
      bizBalanceRedPacketApi
        .bizBalanceRedPacketSubmitForm(formDataParam, formDataParam.id)
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
