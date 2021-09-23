<template>
  <div class="app-container">
    <div class="filter-container">
      <el-button-group>
        <el-button v-permission="'sys:picUpDown:delete'" icon="el-icon-delete" class="filter-item" @click="btnDelete()">
          批量删除
        </el-button>
        <el-button icon="el-icon-upload" class="filter-item" @click="upload()">上传</el-button>
      </el-button-group>
      <div style="float: right">
        <el-input
          v-model="listQuery.picName"
          placeholder="图片名"
          style="width: 200px;"
          class="filter-item"
          @keyup.enter.native="btnQuery"
        />
        <el-dropdown split-button type="primary" class="filter-item" @click="btnQuery">
          <i class="el-icon-search el-icon--left" />查询
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item icon="el-icon-zoom-out" @click.native="btnReset">重置</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
    </div>
    <el-table
      ref="multipleTable"
      :data="records"
      border
      fit
      highlight-current-row
      style="width: 100%;"
      :cell-style="{padding:'3px'}"
      @selection-change="selectionChange"
    >
      <el-table-column type="selection" align="center" />
      <el-table-column type="index" label="#" align="center" width="50" />
      <el-table-column label="图片名" prop="picName" align="center">
        <template slot-scope="scope"><span>{{ scope.row.picName }}</span></template>
      </el-table-column>
      <el-table-column label="图片" prop="pic" align="center">
        <template slot-scope="scope">
          <el-image
            v-if="scope.row.picName.toLowerCase().indexOf('.png') >= 0"
            lazy
            alt="图片"
            style="width: 50px; height: 50px"
            :src="'data:image/png;base64,' + scope.row.pic"
          />
          <el-image
            v-else
            lazy
            alt="图片"
            style="width: 50px; height: 50px"
            :src="'data:image/jpg;base64,' + scope.row.pic"
          />
        </template>
      </el-table-column>
      <el-table-column label="MD5" prop="md5" align="center">
        <template slot-scope="scope"><span>{{ scope.row.md5 }}</span></template>
      </el-table-column>
      <el-table-column label="操作" align="center">
        <template slot-scope="{row}">
          <el-button
            v-permission="'sys:picUpDown:delete'"
            icon="el-icon-delete"
            divided
            @click.native="btnDelete(row.picUpDownId)"
          >删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <div class="pagination-position">
      <pagination
        v-show="total>0"
        :total="total"
        :current.sync="listQuery.current"
        :size.sync="listQuery.size"
        @pagination="list"
      />
    </div>

    <el-dialog title="上传图片" :visible.sync="dialogFormVisible">
      <el-upload
        action
        drag
        class="avatar-uploader"
        :show-file-list="false"
        :http-request="handleAvatarSuccess"
        :before-upload="beforeAvatarUpload"
      >
        <i class="el-icon-upload" />
        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
        <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过2MB</div>
      </el-upload>
    </el-dialog>
  </div>
</template>

<script>
import Pagination from '@/components/Pagination'
import { getAction, postAction, deleteAction } from '@/api/manage'
import { Message } from 'element-ui'

export default {
  name: 'SysPicUpDown',
  components: { Pagination },
  data() {
    return {
      dicts: [],
      records: null,
      selectedRecords: [],
      total: 0,
      dialogFormVisible: false,
      listQuery: {
        current: 1,
        size: 10,
        picName: undefined
      }
    }
  },
  beforeCreate() {

  },
  created() {
    this.list()
  },
  methods: {
    list() {
      getAction('/sys/picUpDown/list', this.listQuery).then(res => {
        const { data } = res
        this.records = data.records
        this.total = data.total
      })
    },
    upload() {
      this.dialogFormVisible = true
    },
    async handleAvatarSuccess(res) {
      const formData = new FormData()
      formData.append('file', res.file)
      const { msg, code } = await postAction('/sys/picUpDown/uploadPic', formData)
      if (code == 200) {
        this.$message.success('上传成功')
        this.dialogFormVisible = false
        this.list()
      } else {
        this.$message.error('上传失败:' + msg)
      }
    },
    // 限制上传时的文件格式大小
    beforeAvatarUpload(file) {
      const isJPG = file.type === 'image/jpeg' || file.type === 'image/png'
      const isLt2M = file.size / 1024 / 1024 < 2
      if (!isJPG) {
        this.$message.error('上传图片只能是 JPG 和 Png 格式!')
        return false
      }
      if (!isLt2M) {
        this.$message.error('上传图片大小不能超过 2MB!')
        return false
      }
    },
    btnQuery() {
      this.listQuery.current = 1
      this.list()
    },
    btnReset() {
      this.listQuery = {
        current: 1,
        size: 10,
        picName: undefined
      }
      this.list()
    },
    resetTemp() {
      this.temp = {}
    },
    btnDelete(id) {
      const ids = id ? [id] : this.selectedRecords.map(record => {
        return record.picUpDownId
      })
      if (ids.length == 0) {
        Message.error('请选择要删除的记录')
        return
      }
      deleteAction('/sys/picUpDown/delete', { ids: ids.toString() }).then(({ msg }) => {
        Message.success(msg)
        this.list()
      })
    },
    selectionChange(selectedRecords) {
      this.selectedRecords = selectedRecords
    }
  }
}
</script>
