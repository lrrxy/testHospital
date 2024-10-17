<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="治疗名称" prop="treatmentName">
        <el-input
          v-model="queryParams.treatmentName"
          placeholder="请输入治疗名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="治疗价格" prop="treatmentPrice">
        <el-input
          v-model="queryParams.treatmentPrice"
          placeholder="请输入治疗价格"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="医生ID" prop="doctorId">
        <el-input
          v-model="queryParams.doctorId"
          placeholder="请输入医生ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['treatment:treatment:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['treatment:treatment:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['treatment:treatment:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['treatment:treatment:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="treatmentList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="治疗ID" align="center" prop="treatmentId" />
      <el-table-column label="治疗名称" align="center" prop="treatmentName" />
      <el-table-column label="治疗价格" align="center" prop="treatmentPrice" />
      <el-table-column label="治疗类型" align="center" prop="treatmentType" />
      <el-table-column label="医生ID" align="center" prop="doctorId" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['treatment:treatment:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['treatment:treatment:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改治疗信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="治疗名称" prop="treatmentName">
          <el-input v-model="form.treatmentName" placeholder="请输入治疗名称" />
        </el-form-item>
        <el-form-item label="治疗价格" prop="treatmentPrice">
          <el-input v-model="form.treatmentPrice" placeholder="请输入治疗价格" />
        </el-form-item>
        <el-form-item label="医生ID" prop="doctorId">
          <el-input v-model="form.doctorId" placeholder="请输入医生ID" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listTreatment, getTreatment, delTreatment, addTreatment, updateTreatment } from "@/api/treatment/treatment";

export default {
  name: "Treatment",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 治疗信息表格数据
      treatmentList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        treatmentName: null,
        treatmentPrice: null,
        treatmentType: null,
        doctorId: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        treatmentName: [
          { required: true, message: "治疗名称不能为空", trigger: "blur" }
        ],
        treatmentPrice: [
          { required: true, message: "治疗价格不能为空", trigger: "blur" }
        ],
        treatmentType: [
          { required: true, message: "治疗类型不能为空", trigger: "change" }
        ],
        doctorId: [
          { required: true, message: "医生ID不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询治疗信息列表 */
    getList() {
      this.loading = true;
      listTreatment(this.queryParams).then(response => {
        this.treatmentList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        treatmentId: null,
        treatmentName: null,
        treatmentPrice: null,
        treatmentType: null,
        doctorId: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.treatmentId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加治疗信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const treatmentId = row.treatmentId || this.ids
      getTreatment(treatmentId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改治疗信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.treatmentId != null) {
            updateTreatment(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTreatment(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const treatmentIds = row.treatmentId || this.ids;
      this.$modal.confirm('是否确认删除治疗信息编号为"' + treatmentIds + '"的数据项？').then(function() {
        return delTreatment(treatmentIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('treatment/treatment/export', {
        ...this.queryParams
      }, `treatment_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
