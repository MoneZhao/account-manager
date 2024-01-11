<template>
  <xn-form-container
    :title="'余额明细对比 - (' + formData.balanceName + ')'"
    :width="700"
    :visible="visible"
    :destroy-on-close="true"
    @close="onClose"
  >
    <a-form ref="formRef" :model="formData" :rules="formRules" layout="vertical">
      <a-form-item label="当前日期：" name="accountDate">
        <a-date-picker
          v-model:value="formData.accountDate"
          value-format="YYYY-MM-DD"
          format="YYYY 年 MM 月 DD 日"
          :disabled-date="disabledDate"
          placeholder="请选择当前日期"
          style="width: 100%"
          disabled
        />
      </a-form-item>
      <a-form-item label="当前余额：" name="accountFormat">
        <a-input v-model:value="formData.accountFormat" placeholder="当前余额" style="width: 100%" readOnly />
      </a-form-item>
      <a-form-item label="对比日期：" name="compareDate">
        <a-date-picker
          v-model:value="formData.compareDate"
          @change="onChangeTime"
          value-format="YYYY-MM-DD"
          format="YYYY 年 MM 月 DD 日"
          :disabled-date="disabledDate"
          placeholder="请选择对比日期"
          style="width: 100%"
        />
      </a-form-item>
      <a-form-item label="对比余额：" name="compareAccountFormat">
        <a-input v-model:value="formData.compareAccountFormat" placeholder="对比余额" style="width: 100%" readOnly />
      </a-form-item>
      <a-form-item label="差值：" name="diff">
        <a-input v-model:value="formData.diff" placeholder="差值" style="width: 100%" readOnly />
      </a-form-item>
    </a-form>
    <template #footer>
      <a-button style="margin-right: 8px" :loading="submitLoading" @click="onClose">关闭</a-button>
    </template>
  </xn-form-container>
</template>

<script setup name="detailcompare">
  import bizBalanceMainApi from '@/api/biz/bizBalanceMainApi'
  import { message } from 'ant-design-vue'
  import { cloneDeep } from 'lodash-es'
  import { required } from '@/utils/formRules'
  import tool from '@/utils/tool'
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
      recordData.accountFormat = tool.formatMoney(recordData.account)
      formData.value = Object.assign({}, recordData)
    }
  }
  // 默认要校验的
  const formRules = {
    compareDate: [required('对比日期不能为空')]
  }
  // 关闭抽屉
  const onClose = () => {
    formRef.value.resetFields()
    formData.value = {}
    visible.value = false
    emit('successful')
  }
  const disabledDate = (current) => {
    return current > dayjs().add(1, 'days')
  }
  const onChangeTime = () => {
    formRef.value.validate().then(() => {
      submitLoading.value = true
      const formDataParam = {
        accountDate: formData.value.compareDate,
        balanceType: formData.value.balanceType
      }
      bizBalanceMainApi
        .bizBalanceMainCompareDetail(formDataParam)
        .then((data) => {
          if (data.account) {
            formData.value.compareAccount = data.account
            formData.value.compareAccountFormat = tool.formatMoney(data.account)
            formData.value.diff = tool.formatMoney(
              // Math.abs(
              formData.value.account - formData.value.compareAccount
              // )
            )
          } else {
            message.warn(data.remark)
            delete formData.value.diff
          }
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
