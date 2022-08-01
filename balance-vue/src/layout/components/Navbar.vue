<template>
  <div class="navbar">
    <hamburger :is-active="sidebar.opened" class="hamburger-container" @toggleClick="toggleSideBar" />

    <breadcrumb class="breadcrumb-container" />

    <div class="right-menu">
      <el-dropdown class="avatar-container right-menu-item hover-effect" trigger="click">
        <div class="avatar-wrapper">
          <img v-if="avatar" :src="avatar" class="user-avatar">
          <img v-else :src="defaultAvatar" class="user-avatar">
          <i class="el-icon-caret-bottom" />
        </div>
        <el-dropdown-menu slot="dropdown" class="user-dropdown">
          <el-dropdown-item>
            <span style="display:block;" @click="personalInfo">个人信息</span>
          </el-dropdown-item>
          <el-dropdown-item divided>
            <span style="display:block;" @click="upload">更改头像</span>
          </el-dropdown-item>
          <el-dropdown-item divided>
            <span style="display:block;" @click="updatePasswordHandle">修改密码</span>
          </el-dropdown-item>
          <el-dropdown-item divided>
            <span style="display:block;" @click="btnShortCut">快捷方式</span>
          </el-dropdown-item>
          <el-dropdown-item divided>
            <span style="display:block;" @click="logout">注销</span>
          </el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>
    <div class="right-menu">
      <div class="right-menu-item hover-effect">
        {{ name }}
      </div>
      <switch-roles class="right-menu-item hover-effect" />
      <el-divider direction="vertical" />
    </div>
    <div class="right-menu">
      <screenfull id="screenfull" class="right-menu-item hover-effect" />
      <size-select id="size-select" class="right-menu-item hover-effect" />
      <el-divider direction="vertical" />
    </div>
    <div class="right-menu">
      <div class="right-menu-item hover-effect">
        {{ nowDateTime }}
      </div>
      <el-divider direction="vertical" />
    </div>
    <!-- 弹窗, 修改密码 -->
    <update-password v-if="updatePasswordVisible" ref="updatePassword" />
    <el-dialog title="配置快捷方式" :visible.sync="showShortCutModal" destroy-on-close append-to-body>
      <short-cut v-if="showShortCutModal" ref="shortCut" :role-id="sysRole.roleId" :user-id="sysUser.userId" @shortCutEnd="shortCutEnd" @shortCutWarning="shortCutWarning" />
      <div slot="footer" class="dialog-footer">
        <el-button icon="el-icon-close" @click="showShortCutModal = false">
          取消
        </el-button>
        <el-button :loading="menuModalLoading" icon="el-icon-check" type="primary" @click="editShortCut">
          确定
        </el-button>
      </div>
    </el-dialog>
    <el-dialog title="上传图片" :visible.sync="dialogFormVisible" destroy-on-close append-to-body>
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
    <el-dialog title="个人信息" :visible.sync="personalInfoVisible" destroy-on-close append-to-body>
      <el-form ref="dataForm" :rules="rules" :model="temp" label-position="right" label-width="auto">
        <el-row>
          <el-col :span="12">
            <el-form-item label="用户姓名" prop="userName">
              <el-input v-model="temp.userName" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="性别" prop="sex">
              <el-select v-model="temp.sex" placeholder="性别">
                <el-option v-for="item in dicts.userSex" :key="item.value" :label="item.content" :value="item.value" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="手机号码" prop="mobile">
              <el-input v-model="temp.mobile" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="身份证号" prop="idCardNo">
              <el-input v-model="temp.idCardNo" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="邮箱地址" prop="email">
              <el-input v-model="temp.email" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="备注">
              <el-input
                v-model="temp.remark"
                :autosize="{ minRows: 2, maxRows: 4}"
                type="textarea"
                placeholder="请输入备注信息"
              />
            </el-form-item>
          </el-col>
        </el-row>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button icon="el-icon-close" @click="personalInfoVisible = false">
          取消
        </el-button>
        <el-button :loading="personalInfoLoading" icon="el-icon-check" type="primary" @click="editPersonalInfo">
          确定
        </el-button>
      </div>
    </el-dialog>
    <el-dialog title="个人信息" :visible.sync="personalInfoVisible" destroy-on-close append-to-body>
      <el-form ref="dataForm" :rules="rules" :model="temp" label-position="right" label-width="auto">
        <el-row>
          <el-col :span="12">
            <el-form-item label="用户姓名" prop="userName">
              <el-input v-model="temp.userName" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="性别" prop="sex">
              <el-select v-model="temp.sex" placeholder="性别">
                <el-option v-for="item in dicts.userSex" :key="item.value" :label="item.content" :value="item.value" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="手机号码" prop="mobile">
              <el-input v-model="temp.mobile" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="身份证号" prop="idCardNo">
              <el-input v-model="temp.idCardNo" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="邮箱地址" prop="email">
              <el-input v-model="temp.email" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="备注">
              <el-input
                v-model="temp.remark"
                :autosize="{ minRows: 2, maxRows: 4}"
                type="textarea"
                placeholder="请输入备注信息"
              />
            </el-form-item>
          </el-col>
        </el-row>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button icon="el-icon-close" @click="personalInfoVisible = false">
          取消
        </el-button>
        <el-button :loading="personalInfoLoading" icon="el-icon-check" type="primary" @click="editPersonalInfo">
          确定
        </el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import Breadcrumb from '@/components/Breadcrumb'
import Hamburger from '@/components/Hamburger'
import SwitchRoles from '@/components/SwitchRoles'
import Screenfull from '@/components/Screenfull'
import SizeSelect from '@/components/SizeSelect'
import UpdatePassword from '@/components/UpdatePassword'
import ShortCut from '@/components/ShortCut'
import { postAction, putAction } from '@/api/manage'
import { Message } from 'element-ui'

export default {
  components: {
    Breadcrumb,
    Hamburger,
    SwitchRoles,
    Screenfull,
    SizeSelect,
    UpdatePassword,
    ShortCut
  },
  data() {
    return {
      dicts: [],
      nowDateTime: null, // 存放年月日变量
      timer: '', // 定义一个定时器的变量
      showShortCutModal: false,
      menuModalLoading: false,
      dialogFormVisible: false,
      updatePasswordVisible: false,
      temp: {},
      personalInfoVisible: false,
      personalInfoLoading: false,
      rules: {
        userName: [{ required: true, message: '该项不能为空', trigger: 'change' }],
        sex: [{ required: true, message: '该项不能为空', trigger: 'change' }]
      }
    }
  },
  computed: {
    ...mapGetters([
      'sidebar',
      'avatar',
      'defaultAvatar',
      'device',
      'sysUser',
      'sysRole',
      'name'
    ])
  },
  beforeCreate() {
    this.getDicts('userSex').then(({ data }) => {
      this.dicts = data
    })
  },
  created() {
    this.timer = setInterval(this.getTime, 1000)
  },
  beforeDestroy() {
    if (this.timer) {
      clearInterval(this.timer) // 在Vue实例销毁前，清除定时器
    }
  },
  methods: {
    personalInfo() {
      this.temp = Object.assign({}, this.sysUser)
      this.personalInfoVisible = true
    },
    editPersonalInfo() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          this.editPersonalInfoStart()
        }
      })
    },
    async editPersonalInfoStart() {
      this.personalInfoLoading = true
      const param = {
        userId: this.sysUser.userId,
        userName: this.temp.userName,
        sex: this.temp.sex,
        mobile: this.temp.mobile,
        idCardNo: this.temp.idCardNo,
        email: this.temp.email
      }
      const { msg } = await putAction('/sys/user/editPersonalInfo', param).catch(e => {
        this.personalInfoLoading = false
      })
      this.personalInfoLoading = false
      Message.success(msg)
      await this.$store.dispatch('user/getInfo', this.$store.getters.sysRole.roleId)
      this.personalInfoVisible = false
    },
    upload() {
      this.dialogFormVisible = true
    },
    async handleAvatarSuccess(res) {
      const formData = new FormData()
      formData.append('file', res.file)
      const { msg, code } = await postAction('/sys/user/uploadPic', formData)
      if (code == 200) {
        this.$message.success('更换成功')
        await this.$store.dispatch('user/getInfo', this.$store.getters.sysRole.roleId)
        this.dialogFormVisible = false
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
    getTime() {
      // this.nowDateTime = this.$moment().format('MM 月 DD 日, ddd, a hh:mm:ss')
      this.nowDateTime = this.$moment().format('M月DD日, ddd, a hh:mm:ss')
    },
    toggleSideBar() {
      this.$store.dispatch('app/toggleSideBar')
    },
    async logout() {
      await this.$store.dispatch('user/logout')
      this.$router.push(`/login?redirect=${this.$route.fullPath}`)
    },
    updatePasswordHandle() {
      this.updatePasswordVisible = true
      this.$nextTick(() => {
        this.$refs.updatePassword.init()
      })
    },
    btnShortCut() {
      this.showShortCutModal = true
    },
    editShortCut() {
      this.menuModalLoading = true
      this.$refs.shortCut.editShortCut()
    },
    shortCutWarning() {
      this.menuModalLoading = false
    },
    async shortCutEnd() {
      this.menuModalLoading = false
      this.showShortCutModal = false
      await this.$store.dispatch('user/getInfo', this.$store.getters.sysRole.roleId)
    }
  }
}
</script>

<style lang="scss" scoped>
    .navbar {
        height: 50px;
        overflow: hidden;
        position: relative;
        background: #fff;
        box-shadow: 0 1px 4px rgba(0, 21, 41, .08);

        .hamburger-container {
            line-height: 46px;
            height: 100%;
            float: left;
            cursor: pointer;
            transition: background .3s;
            -webkit-tap-highlight-color: transparent;

            &:hover {
                background: rgba(0, 0, 0, .025)
            }
        }

        .breadcrumb-container {
            float: left;
        }

        .right-menu {
            float: right;
            height: 100%;
            line-height: 50px;

            &:focus {
                outline: none;
            }

            .right-menu-item {
                display: inline-block;
                padding: 0 8px;
                height: 100%;
                font-size: 18px;
                color: #5a5e66;
                vertical-align: text-bottom;

                &.hover-effect {
                    cursor: pointer;
                    transition: background .3s;

                    &:hover {
                        background: rgba(0, 0, 0, .07)
                    }
                }
            }

            .avatar-container {
                margin-right: 30px;

                .avatar-wrapper {
                    margin-top: 5px;
                    position: relative;

                    .user-avatar {
                        cursor: pointer;
                        width: 40px;
                        height: 40px;
                        border-radius: 10px;
                    }

                    .el-icon-caret-bottom {
                        cursor: pointer;
                        position: absolute;
                        right: -20px;
                        top: 25px;
                        font-size: 12px;
                    }
                }
            }
        }
    }
</style>
