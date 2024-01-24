<template>
  <xn-form-container title="导入导出" :width="700" :visible="visible" :destroy-on-close="true" @close="onClose">
    <div>
      <a-spin :spinning="impUploadLoading">
        <a-upload-dragger :show-upload-list="false" :custom-request="customRequestLocal" :accept="uploadAccept">
          <p class="ant-upload-drag-icon">
            <inbox-outlined></inbox-outlined>
          </p>
          <p class="ant-upload-text">单击或拖动文件到此区域进行上传</p>
          <p class="ant-upload-hint">仅支持xls、xlsx格式文件</p>
          <p class="ant-upload-hint">上传数据同天同类型账户余额会被覆盖</p>
        </a-upload-dragger>
      </a-spin>
    </div>
  </xn-form-container>
</template>

<script setup name="userImpExp">
  import { message } from 'ant-design-vue'
  import bizBalanceMainApi from '@/api/biz/bizBalanceMainApi'

  const impUploadLoading = ref(false)
  const impAccept = [
    {
      extension: '.xls',
      mimeType: 'application/vnd.ms-excel'
    },
    {
      extension: '.xlsx',
      mimeType: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
    }
  ]
  // 指定能选择的文件类型
  const uploadAccept = String(
    impAccept.map((item) => {
      return item.mimeType
    })
  )
  // 导入
  const customRequestLocal = (data) => {
    impUploadLoading.value = true
    const fileData = new FormData()
    // 校验上传文件扩展名和文件类型是否为.xls、.xlsx
    const extension = '.'.concat(data.file.name.split('.').slice(-1).toString().toLowerCase())
    const mimeType = data.file.type
    // 提取允许的扩展名
    const extensionArr = impAccept.map((item) => item.extension)
    // 提取允许的MIMEType
    const mimeTypeArr = impAccept.map((item) => item.mimeType)
    if (!extensionArr.includes(extension) || !mimeTypeArr.includes(mimeType)) {
      message.warning('上传文件类型仅支持xls、xlsx格式文件！')
      impUploadLoading.value = false
      return false
    }
    fileData.append('file', data.file)
    return bizBalanceMainApi
      .bizBalanceMainImport(fileData)
      .then(() => {
        message.success('导入成功')
        onClose()
      })
      .finally(() => {
        impUploadLoading.value = false
      })
  }
  // 定义emit事件
  const emit = defineEmits({ successful: null })
  // 默认是关闭状态
  let visible = ref(false)

  // 打开抽屉
  const onOpen = () => {
    visible.value = true
  }
  // 关闭抽屉
  const onClose = () => {
    visible.value = false
    emit('successful')
  }
  // 调用这个函数将子组件的一些数据和方法暴露出去
  defineExpose({
    onOpen
  })
</script>
