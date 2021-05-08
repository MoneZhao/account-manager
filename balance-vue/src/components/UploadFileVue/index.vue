<template>
  <el-dialog
    :title="'上传文件'"
    :visible.sync="dialogVisible"
    width="80%"
    append-to-body
    :before-close="handleClose"
  >
    <el-row>选择文件：<input name="files" type="file" :multiple="multiple" @change="getFiles($event)"></el-row>
    <br>
    <el-row>
      <div v-if="directory">
        选择文件夹，遍历该文件夹下所有文件：<input name="files" type="file" webkitdirectory mozdirectory @change="getFiles($event)">
      </div>
    </el-row>
    <br>
    <el-button type="primary" @click="upload">上传</el-button>
  </el-dialog>
</template>
<script>
import axios from '@/utils/request'

export default {
  name: 'UploadFileVue',
  data() {
    return {
      url: '',
      multiple: 'single', // single multiple
      directory: false,
      dialogVisible: false,
      files: []
    }
  },
  methods: {
    show(url = '/base/file/upload', multiple = 'single', directory = false) {
      if (directory) {
        multiple = 'multiple'
      }
      this.url = url
      this.multiple = multiple
      this.dialogVisible = true
    },
    getFiles(event) {
      const files = event.target.files
      if (this.multiple === 'single') {
        this.files = []
      }
      for (let i = 0; i < files.length; i++) {
        this.files.push(files[i])
      }
    },
    handleClose() {
      this.dialogVisible = false
    },
    upload() {
      const formData = new FormData()
      for (let i = 0; i < this.files.length; i++) {
        formData.append('files', this.files[i])
      }
      axios.post(this.url, formData, {
        headers: {
          'Content-Type': 'multipart/form-data'
        }
      }).then(({ data }) => {
        this.dialogVisible = false
        this.$emit('uploadOk', data)
      })
    }
  }
}
</script>
