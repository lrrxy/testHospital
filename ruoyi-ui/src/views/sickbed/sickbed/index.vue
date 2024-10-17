<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="病床信息" prop="sickbedInformation">
        <el-input
          v-model="queryParams.sickbedInformation"
          placeholder="请输入病床信息"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="状态" prop="sickbedStatus">
        <el-select v-model="queryParams.sickbedStatus" placeholder="请选择状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_show_hide"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="病房ID" prop="wardId">
        <el-input
          v-model="queryParams.wardId"
          placeholder="请输入病房ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="床位价格" prop="sickbedPrice">
        <el-input
          v-model="queryParams.sickbedPrice"
          placeholder="请输入床位价格"
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
          v-hasPermi="['sickbed:sickbed:add']"
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
          v-hasPermi="['sickbed:sickbed:edit']"
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
          v-hasPermi="['sickbed:sickbed:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['sickbed:sickbed:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="sickbedList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="病床ID" align="center" prop="sickbedId" />
      <el-table-column label="病床信息" align="center" prop="sickbedInformation" />
      <el-table-column label="状态" align="center" prop="sickbedStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_show_hide" :value="scope.row.sickbedStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="病房ID" align="center" prop="wardId" />
      <el-table-column label="床位价格" align="center" prop="sickbedPrice" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['sickbed:sickbed:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['sickbed:sickbed:remove']"
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

    <!-- 添加或修改病床信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="病床信息" prop="sickbedInformation">
          <el-input v-model="form.sickbedInformation" placeholder="请输入病床信息" />
        </el-form-item>
        <el-form-item label="状态" prop="sickbedStatus">
          <el-radio-group v-model="form.sickbedStatus">
            <el-radio
              v-for="dict in dict.type.sys_show_hide"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="病房ID" prop="wardId">
          <el-input v-model="form.wardId" placeholder="请输入病房ID" />
        </el-form-item>
        <el-form-item label="床位价格" prop="sickbedPrice">
          <el-input v-model="form.sickbedPrice" placeholder="请输入床位价格" />
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
import { listSickbed, getSickbed, delSickbed, addSickbed, updateSickbed } from "@/api/sickbed/sickbed";

export default {
  name: "Sickbed",
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
      // 病床信息表格数据
      sickbedList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        sickbedInformation: null,
        sickbedStatus: null,
        wardId: null,
        sickbedPrice: null
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
    /** 查询病床信息列表 */
    getList() {
      this.loading = true;
      listSickbed(this.queryParams).then(response => {
        this.sickbedList = response.rows;
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
        sickbedId: null,
        sickbedInformation: null,
        sickbedStatus: null,
        createTime: null,
        wardId: null,
        sickbedPrice: null
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
      this.ids = selection.map(item => item.sickbedId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加病床信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const sickbedId = row.sickbedId || this.ids
      getSickbed(sickbedId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改病床信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.sickbedId != null) {
            updateSickbed(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addSickbed(this.form).then(response => {
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
      const sickbedIds = row.sickbedId || this.ids;
      this.$modal.confirm('是否确认删除病床信息编号为"' + sickbedIds + '"的数据项？').then(function() {
        return delSickbed(sickbedIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('sickbed/sickbed/export', {
        ...this.queryParams
      }, `sickbed_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
