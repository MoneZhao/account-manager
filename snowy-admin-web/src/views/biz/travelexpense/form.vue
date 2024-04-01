<template>
  <xn-form-container
    :title="formData.id ? '编辑出差报销' : '增加出差报销'"
    :width="700"
    :visible="visible"
    :destroy-on-close="true"
    @close="onClose"
  >
    <a-form ref="formRef" :model="formData" :rules="formRules" layout="vertical">
      <a-form-item label="出差地点：" name="travelPlace">
        <a-input v-model:value="formData.travelPlace" placeholder="请输入出差地点" allow-clear />
      </a-form-item>
      <a-form-item label="报销日期：" name="requestDate">
        <a-date-picker
          v-model:value="formData.requestDate"
          value-format="YYYY-MM-DD"
          format="YYYY 年 MM 月 DD 日"
          :disabled-date="disabledDate"
          placeholder="请选择报销日期"
          style="width: 100%"
        />
      </a-form-item>
      <a-form-item label="实际花费：" name="useNumber">
        <a-input-number
          v-model:value="formData.useNumber"
          placeholder="请输入实际花费"
          allow-clear
          style="width: 100%"
          :min="1"
        />
      </a-form-item>
      <a-form-item label="报销金额：" name="requestNumber">
        <a-input-number
          v-model:value="formData.requestNumber"
          placeholder="请输入报销金额"
          allow-clear
          style="width: 100%"
          :min="1"
        />
      </a-form-item>
      <a-form-item label="到账日期：" name="getDate">
        <a-date-picker
          v-model:value="formData.getDate"
          value-format="YYYY-MM-DD"
          format="YYYY 年 MM 月 DD 日"
          :disabled-date="disabledDate"
          placeholder="请选择到账日期"
          style="width: 100%"
        />
      </a-form-item>
      <a-form-item label="到账金额：" name="getNumber">
        <a-input-number
          v-model:value="formData.getNumber"
          placeholder="请输入到账金额"
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

<script setup name="bizTravelExpenseForm">
  import { cloneDeep } from 'lodash-es'
  import { required } from '@/utils/formRules'
  import bizTravelExpenseApi from '@/api/biz/bizTravelExpenseApi'
  import dayjs from 'dayjs'
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
    travelPlace: [required('请输入出差地点')],
    requestDate: [required('请输入报销日期')],
    useNumber: [required('请输入实际花费')],
    requestNumber: [required('请输入报销金额')]
  }
  // 验证并提交数据
  const onSubmit = () => {
    formRef.value.validate().then(() => {
      submitLoading.value = true
      const formDataParam = cloneDeep(formData.value)
      bizTravelExpenseApi
        .bizTravelExpenseSubmitForm(formDataParam, formDataParam.id)
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
