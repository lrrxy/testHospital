<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="病人编号" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入病人编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="病床编号" prop="sickbedId">
        <el-input
          v-model="queryParams.sickbedId"
          placeholder="请输入病床编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="病人姓名" prop="userName">
        <el-input
          v-model="queryParams.userName"
          placeholder="请输入病人姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="病例名称" prop="caseName">
        <el-input
          v-model="queryParams.caseName"
          placeholder="请输入病例名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="药品名称" prop="medicineId">
        <el-input
          v-model="queryParams.medicineId"
          placeholder="请输入药品名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="护士编号" prop="nurseId">
        <el-input
          v-model="queryParams.nurseId"
          placeholder="请输入护士编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="医生编号" prop="doctorId">
        <el-input
          v-model="queryParams.doctorId"
          placeholder="请输入医生编号"
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
          v-hasPermi="['case:case:add']"
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
          v-hasPermi="['case:case:edit']"
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
          v-hasPermi="['case:case:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['case:case:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="caseList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="病例订单编号" align="center" prop="bingliCaseId" />
      <el-table-column label="病人编号" align="center" prop="userId" />
      <el-table-column label="病床编号" align="center" prop="sickbedId" />
      <el-table-column label="病人姓名" align="center" prop="userName" />
      <el-table-column label="病例名称" align="center" prop="caseName" />
      <el-table-column label="药品名称" align="center" prop="medicineId" />
      <el-table-column label="状态" align="center" prop="caseStatus" />
      <el-table-column label="护士编号" align="center" prop="nurseId" />
      <el-table-column label="医生编号" align="center" prop="doctorId" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['case:case:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['case:case:remove']"
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

    <!-- 添加或修改病例订单信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="病人编号" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入病人编号" />
        </el-form-item>
        <el-form-item label="病床编号" prop="sickbedId">
          <el-input v-model="form.sickbedId" placeholder="请输入病床编号" />
        </el-form-item>
        <el-form-item label="病人姓名" prop="userName">
          <el-input v-model="form.userName" placeholder="请输入病人姓名" />
        </el-form-item>
        <el-form-item label="病例名称" prop="caseName">
          <el-input v-model="form.caseName" placeholder="请输入病例名称" />
        </el-form-item>
        <el-form-item label="药品名称" prop="medicineId">
          <el-input v-model="form.medicineId" placeholder="请输入药品名称" />
        </el-form-item>
        <el-form-item label="护士编号" prop="nurseId">
          <el-input v-model="form.nurseId" placeholder="请输入护士编号" />
        </el-form-item>
        <el-form-item label="医生编号" prop="doctorId">
          <el-input v-model="form.doctorId" placeholder="请输入医生编号" />
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
import { listCase, getCase, delCase, addCase, updateCase } from "@/api/case/case";

export default {
  name: "Case",
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
      // 病例订单信息表格数据
      caseList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: null,
        sickbedId: null,
        userName: null,
        caseName: null,
        medicineId: null,
        caseStatus: null,
        nurseId: null,
        doctorId: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询病例订单信息列表 */
    getList() {
      this.loading = true;
      listCase(this.queryParams).then(response => {
        this.caseList = response.rows;
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
        bingliCaseId: null,
        userId: null,
        sickbedId: null,
        userName: null,
        caseName: null,
        medicineId: null,
        caseStatus: null,
        nurseId: null,
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
      this.ids = selection.map(item => item.bingliCaseId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加病例订单信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const bingliCaseId = row.bingliCaseId || this.ids
      getCase(bingliCaseId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改病例订单信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.bingliCaseId != null) {
            updateCase(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCase(this.form).then(response => {
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
      const bingliCaseIds = row.bingliCaseId || this.ids;
      this.$modal.confirm('是否确认删除病例订单信息编号为"' + bingliCaseIds + '"的数据项？').then(function() {
        return delCase(bingliCaseIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('case/case/export', {
        ...this.queryParams
      }, `case_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
