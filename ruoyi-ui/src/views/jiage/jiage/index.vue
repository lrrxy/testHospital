<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="总金额" prop="sumMoney">
        <el-input
          v-model="queryParams.sumMoney"
          placeholder="请输入总金额"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="药品ID" prop="medicineId">
        <el-input
          v-model="queryParams.medicineId"
          placeholder="请输入药品ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="检查ID" prop="examineId">
        <el-input
          v-model="queryParams.examineId"
          placeholder="请输入检查ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="治疗ID" prop="treatmentId">
        <el-input
          v-model="queryParams.treatmentId"
          placeholder="请输入治疗ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="病床ID" prop="sickbedId">
        <el-input
          v-model="queryParams.sickbedId"
          placeholder="请输入病床ID"
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
          v-hasPermi="['jiage:jiage:add']"
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
          v-hasPermi="['jiage:jiage:edit']"
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
          v-hasPermi="['jiage:jiage:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['jiage:jiage:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="jiageList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="价格ID" align="center" prop="jiageId" />
      <el-table-column label="总金额" align="center" prop="sumMoney" />
      <el-table-column label="药品ID" align="center" prop="medicineId" />
      <el-table-column label="检查ID" align="center" prop="examineId" />
      <el-table-column label="治疗ID" align="center" prop="treatmentId" />
      <el-table-column label="病床ID" align="center" prop="sickbedId" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['jiage:jiage:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['jiage:jiage:remove']"
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

    <!-- 添加或修改价格信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="总金额" prop="sumMoney">
          <el-input v-model="form.sumMoney" placeholder="请输入总金额" />
        </el-form-item>
        <el-form-item label="药品ID" prop="medicineId">
          <el-input v-model="form.medicineId" placeholder="请输入药品ID" />
        </el-form-item>
        <el-form-item label="检查ID" prop="examineId">
          <el-input v-model="form.examineId" placeholder="请输入检查ID" />
        </el-form-item>
        <el-form-item label="治疗ID" prop="treatmentId">
          <el-input v-model="form.treatmentId" placeholder="请输入治疗ID" />
        </el-form-item>
        <el-form-item label="病床ID" prop="sickbedId">
          <el-input v-model="form.sickbedId" placeholder="请输入病床ID" />
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
import { listJiage, getJiage, delJiage, addJiage, updateJiage } from "@/api/jiage/jiage";

export default {
  name: "Jiage",
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
      // 价格信息表格数据
      jiageList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        sumMoney: null,
        medicineId: null,
        examineId: null,
        treatmentId: null,
        sickbedId: null
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
    /** 查询价格信息列表 */
    getList() {
      this.loading = true;
      listJiage(this.queryParams).then(response => {
        this.jiageList = response.rows;
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
        jiageId: null,
        sumMoney: null,
        medicineId: null,
        examineId: null,
        treatmentId: null,
        sickbedId: null
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
      this.ids = selection.map(item => item.jiageId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加价格信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const jiageId = row.jiageId || this.ids
      getJiage(jiageId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改价格信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.jiageId != null) {
            updateJiage(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addJiage(this.form).then(response => {
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
      const jiageIds = row.jiageId || this.ids;
      this.$modal.confirm('是否确认删除价格信息编号为"' + jiageIds + '"的数据项？').then(function() {
        return delJiage(jiageIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('jiage/jiage/export', {
        ...this.queryParams
      }, `jiage_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
