<template>
  <div class="app-container">
    <el-row :gutter="20">
      <el-col :span="10">
        <dic-type />
      </el-col>
      <el-col :span="14">
        <dic-info />
      </el-col>
    </el-row>
  </div>
</template>

<script>
import DicType from './modules/DicType'
import DicInfo from './modules/DicInfo'

export default {
  name: 'DictionaryData',
  components: { DicType, DicInfo },
  data() {
    return {

    }
  }
}
</script>
