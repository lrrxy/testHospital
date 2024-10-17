<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="病人ID" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入病人ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="所在医院ID" prop="hospitalId">
        <el-input
          v-model="queryParams.hospitalId"
          placeholder="请输入所在医院ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="欲转医院ID" prop="newHospitalId">
        <el-input
          v-model="queryParams.newHospitalId"
          placeholder="请输入欲转医院ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="订单创建时间" prop="transferOrderTime">
        <el-date-picker clearable
          v-model="queryParams.transferOrderTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择订单创建时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="转院原因" prop="transferOrderCondition">
        <el-input
          v-model="queryParams.transferOrderCondition"
          placeholder="请输入转院原因"
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
          v-hasPermi="['transfer:order:add']"
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
          v-hasPermi="['transfer:order:edit']"
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
          v-hasPermi="['transfer:order:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['transfer:order:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="转院订单ID" align="center" prop="transferOrderId" />
      <el-table-column label="病人ID" align="center" prop="userId" />
      <el-table-column label="所在医院ID" align="center" prop="hospitalId" />
      <el-table-column label="欲转医院ID" align="center" prop="newHospitalId" />
      <el-table-column label="订单创建时间" align="center" prop="transferOrderTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.transferOrderTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="转院原因" align="center" prop="transferOrderCondition" />
      <el-table-column label="状态" align="center" prop="orderStatus" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['transfer:order:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['transfer:order:remove']"
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

    <!-- 添加或修改转院订单信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="病人ID" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入病人ID" />
        </el-form-item>
        <el-form-item label="所在医院ID" prop="hospitalId">
          <el-input v-model="form.hospitalId" placeholder="请输入所在医院ID" />
        </el-form-item>
        <el-form-item label="欲转医院ID" prop="newHospitalId">
          <el-input v-model="form.newHospitalId" placeholder="请输入欲转医院ID" />
        </el-form-item>
        <el-form-item label="订单创建时间" prop="transferOrderTime">
          <el-date-picker clearable
            v-model="form.transferOrderTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择订单创建时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="转院原因" prop="transferOrderCondition">
          <el-input v-model="form.transferOrderCondition" placeholder="请输入转院原因" />
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
import { listOrder, getOrder, delOrder, addOrder, updateOrder } from "@/api/transfer/order";

export default {
  name: "Order",
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
      // 转院订单信息表格数据
      orderList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: null,
        hospitalId: null,
        newHospitalId: null,
        transferOrderTime: null,
        transferOrderCondition: null,
        orderStatus: null
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
    /** 查询转院订单信息列表 */
    getList() {
      this.loading = true;
      listOrder(this.queryParams).then(response => {
        this.orderList = response.rows;
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
        transferOrderId: null,
        userId: null,
        hospitalId: null,
        newHospitalId: null,
        transferOrderTime: null,
        transferOrderCondition: null,
        orderStatus: null
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
      this.ids = selection.map(item => item.transferOrderId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加转院订单信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const transferOrderId = row.transferOrderId || this.ids
      getOrder(transferOrderId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改转院订单信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.transferOrderId != null) {
            updateOrder(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addOrder(this.form).then(response => {
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
      const transferOrderIds = row.transferOrderId || this.ids;
      this.$modal.confirm('是否确认删除转院订单信息编号为"' + transferOrderIds + '"的数据项？').then(function() {
        return delOrder(transferOrderIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('transfer/order/export', {
        ...this.queryParams
      }, `order_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
