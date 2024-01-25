<template>
  <xn-form-container
    :title="formData.id ? '编辑账户明细' : '增加账户明细'"
    :width="700"
    :visible="visible"
    :destroy-on-close="true"
    @close="onClose"
  >
    <a-form ref="formRef" :model="formData" :rules="formRules" layout="vertical">
      <a-form-item label="账户余额：" name="account">
        <a-input-number
          v-model:value="formData.account"
          placeholder="请输入账户余额"
          allow-clear
          style="width: 100%"
          :min="1"
        />
      </a-form-item>
      <a-form-item label="账户类型：" name="balanceType">
        <a-select
          show-search
          option-filter-prop="label"
          v-model:value="formData.balanceType"
          placeholder="请选择账户类型"
          :options="balanceTypeOptions"
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

<script setup name="bizBalanceDetailForm">
  import tool from '@/utils/tool'
  import { cloneDeep } from 'lodash-es'
  import { required } from '@/utils/formRules'
  import bizBalanceDetailApi from '@/api/biz/bizBalanceDetailApi'
  // 抽屉状态
  const visible = ref(false)
  const emit = defineEmits({ successful: null })
  const formRef = ref()
  // 表单数据
  const formData = ref({})
  const submitLoading = ref(false)
  const balanceTypeOptions = ref([])

  // 打开抽屉
  const onOpen = (record) => {
    visible.value = true
    if (record) {
      let recordData = cloneDeep(record)
      formData.value = Object.assign({}, recordData)
    }
    balanceTypeOptions.value = tool.dictList('BALANCE_TYPE')
  }
  // 关闭抽屉
  const onClose = () => {
    formRef.value.resetFields()
    formData.value = {}
    visible.value = false
  }
  // 默认要校验的
  const formRules = {
    account: [required('请输入账户余额')],
    balanceType: [required('请输入账户类型')]
  }
  // 验证并提交数据
  const onSubmit = () => {
    formRef.value.validate().then(() => {
      submitLoading.value = true
      const formDataParam = cloneDeep(formData.value)
      bizBalanceDetailApi
        .bizBalanceDetailSubmitForm(formDataParam, formDataParam.id)
        .then(() => {
          onClose()
          emit('successful')
        })
        .finally(() => {
          submitLoading.value = false
        })
    })
  }
  // 抛出函数
  defineExpose({
    onOpen
  })
</script>
