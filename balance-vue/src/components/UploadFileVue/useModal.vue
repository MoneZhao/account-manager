<template>
  <!--  上传下载文件样例-->
  <div>
    <el-link @click="downloadFile(fileName)">{{ fileName }}</el-link>
    <el-button size="mini" type="primary" @click="uploadFile()">上传文件</el-button>
    <upload-file-vue ref="uploadFileVue" @uploadOk="uploadOk" />
  </div>
</template>
<script>
import UploadFileVue from '@/components/UploadFileVue'
import axios from '@/utils/request'

export default {
  components: [UploadFileVue],
  data() {
    return {
      fileName: ''
    }
  },
  methods: {
    downloadFile(fileName) {
      const name = fileName.substring(0, fileName.lastIndexOf('.'))
      axios.get('/base/file/download/' + fileName, {
        responseType: 'blob'
      }).then(data => {
        const blob = new Blob([data])
        if ('download' in document.createElement('a')) {
          // 非IE下载
          const elink = document.createElement('a')
          elink.download = name
          elink.style.display = 'none'
          elink.href = URL.createObjectURL(blob)
          document.body.appendChild(elink)
          elink.click()
          // 释放URL对象
          URL.revokeObjectURL(elink.href)
          document.body.removeChild(elink)
        } else {
          navigator.msSaveBlob(blob, name)
        }
      })
    },

    uploadFile() {
      this.$refs.uploadFileVue.show('/base/file/upload', 'single', false)
    },

    uploadOk(list) {
      console.log(list)
    }
  }
}

</script>
<style>

</style>

