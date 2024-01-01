<template>
  <xn-form-container
    :title="formData.id ? '编辑账户余额' : '增加账户余额'"
    :width="700"
    :visible="visible"
    :destroy-on-close="true"
    @close="onClose"
  >
    <a-form ref="formRef" :model="formData" :rules="formRules" layout="vertical">
      <!--      <a-form-item label="账户余额：" name="account">-->
      <!--        <a-input v-model:value="formData.account" placeholder="请输入账户余额" allow-clear />-->
      <!--      </a-form-item>-->
      <a-form-item label="记录时间：" name="accountDate">
        <a-date-picker
          v-model:value="formData.accountDate"
          value-format="YYYY-MM-DD"
          placeholder="请选择记录时间"
          style="width: 100%"
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

<script setup name="bizBalanceMainForm">
  import { cloneDeep } from 'lodash-es'
  import { required } from '@/utils/formRules'
  import bizBalanceMainApi from '@/api/biz/bizBalanceMainApi'
  // 抽屉状态
  const visible = ref(false)
  const emit = defineEmits({ successful: null })
  const formRef = ref()
  // 表单数据
  const formData = ref({})
  const submitLoading = ref(false)

  // 打开抽屉
  const onOpen = (record) => {
    visible.value = true
    if (record) {
      let recordData = cloneDeep(record)
      formData.value = Object.assign({}, recordData)
    }
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
    accountDate: [required('请输入记录时间')]
  }
  // 验证并提交数据
  const onSubmit = () => {
    formRef.value.validate().then(() => {
      submitLoading.value = true
      const formDataParam = cloneDeep(formData.value)
      bizBalanceMainApi
        .bizBalanceMainSubmitForm(formDataParam, formDataParam.id)
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
