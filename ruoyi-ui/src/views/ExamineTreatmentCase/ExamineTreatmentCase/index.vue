<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="检查或者手术订单类别" prop="examineTreatmentCategory">
        <el-input
          v-model="queryParams.examineTreatmentCategory"
          placeholder="请输入检查或者手术订单类别"
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
      <el-form-item label="医生姓名" prop="doctorName">
        <el-input
          v-model="queryParams.doctorName"
          placeholder="请输入医生姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="医生状态" prop="doctorStatus">
        <el-select v-model="queryParams.doctorStatus" placeholder="请选择医生状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_show_hide"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="病人ID" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入病人ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="订单状态" prop="caseStatus">
        <el-select v-model="queryParams.caseStatus" placeholder="请选择订单状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_show_hide"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="检查或者手术日期" prop="examineTreatmentDate">
        <el-date-picker clearable
          v-model="queryParams.examineTreatmentDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择检查或者手术日期">
        </el-date-picker>
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
          v-hasPermi="['ExamineTreatmentCase:ExamineTreatmentCase:add']"
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
          v-hasPermi="['ExamineTreatmentCase:ExamineTreatmentCase:edit']"
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
          v-hasPermi="['ExamineTreatmentCase:ExamineTreatmentCase:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['ExamineTreatmentCase:ExamineTreatmentCase:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="ExamineTreatmentCaseList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="检查或者手术订单编号" align="center" prop="examineTreatmentCaseId" />
      <el-table-column label="检查或者手术订单类别" align="center" prop="examineTreatmentCategory" />
      <el-table-column label="医生ID" align="center" prop="doctorId" />
      <el-table-column label="医生姓名" align="center" prop="doctorName" />
      <el-table-column label="医生状态" align="center" prop="doctorStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_show_hide" :value="scope.row.doctorStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="病人ID" align="center" prop="userId" />
      <el-table-column label="订单状态" align="center" prop="caseStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_show_hide" :value="scope.row.caseStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="检查或者手术日期" align="center" prop="examineTreatmentDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.examineTreatmentDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['ExamineTreatmentCase:ExamineTreatmentCase:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ExamineTreatmentCase:ExamineTreatmentCase:remove']"
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

    <!-- 添加或修改检查或手术订单信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="检查或者手术订单类别" prop="examineTreatmentCategory">
          <el-input v-model="form.examineTreatmentCategory" placeholder="请输入检查或者手术订单类别" />
        </el-form-item>
        <el-form-item label="医生ID" prop="doctorId">
          <el-input v-model="form.doctorId" placeholder="请输入医生ID" />
        </el-form-item>
        <el-form-item label="医生姓名" prop="doctorName">
          <el-input v-model="form.doctorName" placeholder="请输入医生姓名" />
        </el-form-item>
        <el-form-item label="医生状态" prop="doctorStatus">
          <el-radio-group v-model="form.doctorStatus">
            <el-radio
              v-for="dict in dict.type.sys_show_hide"
              :key="dict.value"
              :label="parseInt(dict.value)"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="病人ID" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入病人ID" />
        </el-form-item>
        <el-form-item label="订单状态" prop="caseStatus">
          <el-radio-group v-model="form.caseStatus">
            <el-radio
              v-for="dict in dict.type.sys_show_hide"
              :key="dict.value"
              :label="parseInt(dict.value)"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="检查或者手术日期" prop="examineTreatmentDate">
          <el-date-picker clearable
            v-model="form.examineTreatmentDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择检查或者手术日期">
          </el-date-picker>
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
import { listExamineTreatmentCase, getExamineTreatmentCase, delExamineTreatmentCase, addExamineTreatmentCase, updateExamineTreatmentCase } from "@/api/ExamineTreatmentCase/ExamineTreatmentCase";

export default {
  name: "ExamineTreatmentCase",
  dicts: ['sys_show_hide'],
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
      // 检查或手术订单信息表格数据
      ExamineTreatmentCaseList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        examineTreatmentCategory: null,
        doctorId: null,
        doctorName: null,
        doctorStatus: null,
        userId: null,
        caseStatus: null,
        examineTreatmentDate: null
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
    /** 查询检查或手术订单信息列表 */
    getList() {
      this.loading = true;
      listExamineTreatmentCase(this.queryParams).then(response => {
        this.ExamineTreatmentCaseList = response.rows;
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
        examineTreatmentCaseId: null,
        examineTreatmentCategory: null,
        doctorId: null,
        doctorName: null,
        doctorStatus: null,
        userId: null,
        caseStatus: null,
        examineTreatmentDate: null
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
      this.ids = selection.map(item => item.examineTreatmentCaseId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加检查或手术订单信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const examineTreatmentCaseId = row.examineTreatmentCaseId || this.ids
      getExamineTreatmentCase(examineTreatmentCaseId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改检查或手术订单信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.examineTreatmentCaseId != null) {
            updateExamineTreatmentCase(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addExamineTreatmentCase(this.form).then(response => {
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
      const examineTreatmentCaseIds = row.examineTreatmentCaseId || this.ids;
      this.$modal.confirm('是否确认删除检查或手术订单信息编号为"' + examineTreatmentCaseIds + '"的数据项？').then(function() {
        return delExamineTreatmentCase(examineTreatmentCaseIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('ExamineTreatmentCase/ExamineTreatmentCase/export', {
        ...this.queryParams
      }, `ExamineTreatmentCase_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
