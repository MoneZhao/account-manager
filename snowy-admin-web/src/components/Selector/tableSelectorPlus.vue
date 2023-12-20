<template>
  <a-modal
    v-model:visible="visible"
    :title="props.title"
    :width="props.width"
    :mask-closable="false"
    :destroy-on-close="true"
    @ok="handleOk"
    @cancel="handleClose"
  >
    <a-row :gutter="10">
      <a-col :span="18">
        <div class="table-operator" style="margin-bottom: 10px">
          <a-form ref="searchFormRef" name="advanced_search" class="ant-advanced-search-form" :model="searchFormState">
            <a-row :gutter="24">
              <a-col :span="6" v-for="(item, index) in props.searchColumns" :key="index">
                <a-form-item :label="item.label" :name="item.name">
                  <a-input v-model:value="searchFormState[item.name]" :placeholder="'请输入' + item.label" />
                </a-form-item>
              </a-col>
              <a-col :span="6">
                <a-button type="primary" class="primarySele" @click="loadData()"> 查询</a-button>
                <a-button class="snowy-buttom-left" @click="() => reset()"> 重置</a-button>
              </a-col>
            </a-row>
          </a-form>
        </div>
        <div class="pos-table">
          <a-table
            ref="table"
            size="small"
            :columns="columns"
            :data-source="tableData"
            :expand-row-by-click="true"
            :loading="pageLoading"
            bordered
            :pagination="false"
          >
            <template #title>
              <span>待选择列表 {{ tableRecordNum }} 条</span>
              <div v-if="!radioModel" style="float: right">
                <a-button type="dashed" size="small" @click="addAllPageRecord">添加当前数据</a-button>
              </div>
            </template>
            <template #bodyCell="{ column, record }">
              <template v-if="column.dataIndex === 'action'">
                <a-button type="dashed" size="small" @click="addRecord(record)">添加</a-button>
              </template>
            </template>
          </a-table>
          <div class="mt-2">
            <a-pagination
              v-if="!isEmpty(tableData)"
              v-model:current="current"
              v-model:page-size="pageSize"
              :total="total"
              size="small"
              showSizeChanger
              @change="paginationChange"
            />
          </div>
        </div>
      </a-col>
      <a-col :span="6">
        <div class="pos-table">
          <a-table
            ref="selectedTable"
            size="small"
            :columns="selectedCommons"
            :data-source="selectedData"
            :expand-row-by-click="true"
            :loading="selectedTableListLoading"
            bordered
          >
            <template #title>
              <span>已选择: {{ selectedData.length }}</span>
              <div v-if="!radioModel" style="float: right">
                <a-button type="dashed" danger size="small" @click="delAllRecord">全部移除</a-button>
              </div>
            </template>
            <template #bodyCell="{ column, record }">
              <template v-if="column.dataIndex === 'action'">
                <a-button type="dashed" danger size="small" @click="delRecord(record)">移除</a-button>
              </template>
            </template>
          </a-table>
        </div>
      </a-col>
    </a-row>
  </a-modal>
</template>

<script setup name="tableSelectorPlus">
  import { message } from 'ant-design-vue'
  import { remove, isEmpty } from 'lodash-es'

  // 弹窗是否打开
  const visible = ref(false)
  const props = defineProps({
    title: {
      type: String,
      required: true
    },
    width: {
      type: Number,
      required: false,
      default: () => 1300
    },
    //是否单选
    radioModel: {
      type: Boolean,
      default: () => false
    },
    pageApi: {
      type: Function,
      required: true
    },
    checkedListApi: {
      type: Function,
      required: false
    },
    searchColumns: {
      type: Array,
      required: true
    },
    selectedColumns: {
      type: Array,
      required: true
    },
    columns: {
      type: Array,
      required: true
    }
  })
  const columns = [
    {
      title: '操作',
      dataIndex: 'action',
      align: 'center',
      width: 80
    },
    ...props.columns
  ]
  // 选中表格的表格common
  const selectedCommons = [
    {
      title: '操作',
      dataIndex: 'action',
      align: 'center',
      width: 80
    },
    ...props.selectedColumns
  ]

  // 主表格的ref 名称
  const table = ref()
  // 选中表格的ref 名称
  const selectedTable = ref()
  const tableRecordNum = ref()
  const searchFormState = ref({})
  const searchFormRef = ref()
  const pageLoading = ref(false)
  const selectedTableListLoading = ref(false)
  const emit = defineEmits({ onBack: null })
  const tableData = ref([])
  const selectedData = ref([])
  const recordIds = ref()
  // 是否是单选
  // eslint-disable-next-line vue/no-setup-props-destructure
  const radioModel = props.radioModel
  // 分页相关
  const current = ref(0) // 当前页数
  const pageSize = ref(10) // 每页条数
  const total = ref(0) // 数据总数

  const showModal = (ids) => {
    visible.value = true
    if (ids) {
      recordIds.value = ids
    }
    if (props.checkedListApi) {
      if (!isEmpty(recordIds.value)) {
        const param = {
          id: recordIds.value
        }
        selectedTableListLoading.value = true
        props
          .checkedListApi(param)
          .then((data) => {
            selectedData.value = data
          })
          .finally(() => {
            selectedTableListLoading.value = false
          })
      }
    }
    searchFormState.value.size = pageSize.value
    loadData()
  }
  // 查询主表格数据
  const loadData = () => {
    pageLoading.value = true
    props
      .pageApi(searchFormState.value)
      .then((data) => {
        current.value = data.current
        total.value = data.total
        // 重置、赋值
        tableData.value = []
        tableRecordNum.value = 0
        tableData.value = data.records
        if (data.records) {
          tableRecordNum.value = data.records.length
        } else {
          tableRecordNum.value = 0
        }
      })
      .finally(() => {
        pageLoading.value = false
      })
  }
  // pageSize改变回调分页事件
  const paginationChange = (page, pageSize) => {
    searchFormState.value.current = page
    searchFormState.value.size = pageSize
    loadData()
  }
  const judge = () => {
    if (radioModel && selectedData.value.length > 0) {
      return false
    }
    return true
  }
  // 添加记录
  const addRecord = (record) => {
    if (!judge()) {
      message.warning('只可选择一条')
      return
    }
    const selectedRecord = selectedData.value.filter((item) => item.id === record.id)
    if (selectedRecord.length === 0) {
      selectedData.value.push(record)
    } else {
      message.warning('该记录已存在')
    }
  }
  // 添加全部
  const addAllPageRecord = () => {
    let newArray = selectedData.value.concat(tableData.value)
    let list = []
    for (let item1 of newArray) {
      let flag = true
      for (let item2 of list) {
        if (item1.id === item2.id) {
          flag = false
        }
      }
      if (flag) {
        list.push(item1)
      }
    }
    selectedData.value = list
  }
  // 删减记录
  const delRecord = (record) => {
    remove(selectedData.value, (item) => item.id === record.id)
  }
  // 删减记录
  const delAllRecord = () => {
    selectedData.value = []
  }

  // 确定
  const handleOk = () => {
    if (!selectedData.value || selectedData.value.length == 0) {
      message.warning('未选择数据')
      return
    }
    emit('onBack', selectedData.value)
    handleClose()
  }
  // 重置
  const reset = () => {
    searchFormRef.value.resetFields()
    loadData()
  }
  const handleClose = () => {
    searchFormState.value = {}
    tableRecordNum.value = 0
    tableData.value = []
    current.value = 0
    pageSize.value = 10
    total.value = 0
    selectedData.value = []
    recordIds.value = []
    visible.value = false
  }
  defineExpose({
    showModal
  })
</script>
