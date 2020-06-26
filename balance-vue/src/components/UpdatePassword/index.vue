<template>
  <el-dialog
    title="修改密码"
    :visible.sync="visible"
    :append-to-body="true"
  >
    <el-form
      ref="dataForm"
      :model="dataForm"
      :rules="dataRule"
      label-width="auto"
      @keyup.enter.native="dataFormSubmit()"
    >
      <el-form-item label="用户名">
        <span>{{ userId }}</span>
      </el-form-item>
      <el-form-item label="原密码" prop="password">
        <el-input v-model="dataForm.password" type="password" show-password />
      </el-form-item>
      <el-form-item label="新密码" prop="newPassword">
        <el-input v-model="dataForm.newPassword" type="password" show-password />
      </el-form-item>
      <el-form-item label="确认密码" prop="confirmPassword">
        <el-input v-model="dataForm.confirmPassword" type="password" show-password />
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button icon="el-icon-close" @click="visible = false">取消</el-button>
      <el-button icon="el-icon-check" type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
import { postAction } from '@/api/manage'
import { Message } from 'element-ui'
import { md5 } from '@/utils'

export default {
  data() {
    var validateConfirmPassword = (rule, value, callback) => {
      if (this.dataForm.newPassword !== value) {
        callback(new Error('确认密码与新密码不一致'))
      } else {
        callback()
      }
    }
    return {
      visible: false,
      dataForm: {
        password: '',
        newPassword: '',
        confirmPassword: ''
      },
      dataRule: {
        password: [
          { required: true, message: '原密码不能为空', trigger: 'blur' }
        ],
        newPassword: [
          { required: true, message: '新密码不能为空', trigger: 'blur' }
        ],
        confirmPassword: [
          { required: true, message: '确认密码不能为空', trigger: 'blur' },
          { validator: validateConfirmPassword, trigger: 'blur' }
        ]
      }
    }
  },
  computed: {
    userId() {
      if (this.$store.getters.sysUser) {
        return this.$store.getters.sysUser.userId
      } else {
        return ''
      }
    }
  },
  methods: {
    // 初始化
    init() {
      this.visible = true
      this.dataForm = {
        password: '',
        newPassword: '',
        confirmPassword: ''
      }
    },
    // 表单提交
    dataFormSubmit() {
      const updateParams = {
        password: md5(this.dataForm.password.trim()),
        newPassword: md5(this.dataForm.newPassword.trim())
      }
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          postAction('/sys/user/updatePassword', updateParams).then(({ msg }) => {
            Message.success(msg)
            this.visible = false
            this.$store.dispatch('user/clearLoginInfo').then(() => {
              this.$router.push(`/login?redirect=${this.$route.fullPath}`)
            })
          })
        }
      })
    }
  }
}
</script>

