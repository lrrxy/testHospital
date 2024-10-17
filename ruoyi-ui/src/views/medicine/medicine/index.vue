<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="药品名称" prop="medicineName">
        <el-input
          v-model="queryParams.medicineName"
          placeholder="请输入药品名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="药品价格" prop="medicinePrice">
        <el-input
          v-model="queryParams.medicinePrice"
          placeholder="请输入药品价格"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="药品生产日期" prop="medicineDatetime">
        <el-date-picker clearable
          v-model="queryParams.medicineDatetime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择药品生产日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="药品数量" prop="medicineCount">
        <el-input
          v-model="queryParams.medicineCount"
          placeholder="请输入药品数量"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="药品保质期" prop="medicineNum">
        <el-input
          v-model="queryParams.medicineNum"
          placeholder="请输入药品保质期"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="药品用途" prop="medicinePurpose">
        <el-input
          v-model="queryParams.medicinePurpose"
          placeholder="请输入药品用途"
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
          v-hasPermi="['medicine:medicine:add']"
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
          v-hasPermi="['medicine:medicine:edit']"
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
          v-hasPermi="['medicine:medicine:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['medicine:medicine:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="medicineList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="药品ID" align="center" prop="medicineId" />
      <el-table-column label="药品名称" align="center" prop="medicineName" />
      <el-table-column label="药品价格" align="center" prop="medicinePrice" />
      <el-table-column label="药品生产日期" align="center" prop="medicineDatetime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.medicineDatetime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="药品数量" align="center" prop="medicineCount" />
      <el-table-column label="药品类型" align="center" prop="medicineType" />
      <el-table-column label="药品保质期" align="center" prop="medicineNum" />
      <el-table-column label="药品用途" align="center" prop="medicinePurpose" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['medicine:medicine:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['medicine:medicine:remove']"
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

    <!-- 添加或修改药品信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="药品名称" prop="medicineName">
          <el-input v-model="form.medicineName" placeholder="请输入药品名称" />
        </el-form-item>
        <el-form-item label="药品价格" prop="medicinePrice">
          <el-input v-model="form.medicinePrice" placeholder="请输入药品价格" />
        </el-form-item>
        <el-form-item label="药品生产日期" prop="medicineDatetime">
          <el-date-picker clearable
            v-model="form.medicineDatetime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择药品生产日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="药品数量" prop="medicineCount">
          <el-input v-model="form.medicineCount" placeholder="请输入药品数量" />
        </el-form-item>
        <el-form-item label="药品保质期" prop="medicineNum">
          <el-input v-model="form.medicineNum" placeholder="请输入药品保质期" />
        </el-form-item>
        <el-form-item label="药品用途" prop="medicinePurpose">
          <el-input v-model="form.medicinePurpose" placeholder="请输入药品用途" />
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
import { listMedicine, getMedicine, delMedicine, addMedicine, updateMedicine } from "@/api/medicine/medicine";

export default {
  name: "Medicine",
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
      // 药品信息表格数据
      medicineList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        medicineName: null,
        medicinePrice: null,
        medicineDatetime: null,
        medicineCount: null,
        medicineType: null,
        medicineNum: null,
        medicinePurpose: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        medicineName: [
          { required: true, message: "药品名称不能为空", trigger: "blur" }
        ],
        medicinePrice: [
          { required: true, message: "药品价格不能为空", trigger: "blur" }
        ],
        medicineDatetime: [
          { required: true, message: "药品生产日期不能为空", trigger: "blur" }
        ],
        medicineCount: [
          { required: true, message: "药品数量不能为空", trigger: "blur" }
        ],
        medicineType: [
          { required: true, message: "药品类型不能为空", trigger: "change" }
        ],
        medicineNum: [
          { required: true, message: "药品保质期不能为空", trigger: "blur" }
        ],
        medicinePurpose: [
          { required: true, message: "药品用途不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询药品信息列表 */
    getList() {
      this.loading = true;
      listMedicine(this.queryParams).then(response => {
        this.medicineList = response.rows;
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
        medicineId: null,
        medicineName: null,
        medicinePrice: null,
        medicineDatetime: null,
        medicineCount: null,
        medicineType: null,
        medicineNum: null,
        medicinePurpose: null
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
      this.ids = selection.map(item => item.medicineId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加药品信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const medicineId = row.medicineId || this.ids
      getMedicine(medicineId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改药品信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.medicineId != null) {
            updateMedicine(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addMedicine(this.form).then(response => {
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
      const medicineIds = row.medicineId || this.ids;
      this.$modal.confirm('是否确认删除药品信息编号为"' + medicineIds + '"的数据项？').then(function() {
        return delMedicine(medicineIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('medicine/medicine/export', {
        ...this.queryParams
      }, `medicine_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
