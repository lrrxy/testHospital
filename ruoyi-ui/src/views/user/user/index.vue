<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="病人名称" prop="userName">
        <el-input
          v-model="queryParams.userName"
          placeholder="请输入病人名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="病人年龄" prop="userAge">
        <el-input
          v-model="queryParams.userAge"
          placeholder="请输入病人年龄"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="性别" prop="userSex">
        <el-select v-model="queryParams.userSex" placeholder="请选择性别" clearable>
          <el-option
            v-for="dict in dict.type.sys_user_sex"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="状态" prop="userStatus">
        <el-select v-model="queryParams.userStatus" placeholder="请选择状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_show_hide"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="生日" prop="userBirthday">
        <el-date-picker clearable
          v-model="queryParams.userBirthday"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择生日">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="病人病例" prop="userCase">
        <el-input
          v-model="queryParams.userCase"
          placeholder="请输入病人病例"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="病人医嘱" prop="userOrder">
        <el-input
          v-model="queryParams.userOrder"
          placeholder="请输入病人医嘱"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="身份证号" prop="idCard">
        <el-input
          v-model="queryParams.idCard"
          placeholder="请输入身份证号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="电话号码" prop="userPhone">
        <el-input
          v-model="queryParams.userPhone"
          placeholder="请输入电话号码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="订单编号" prop="dingdanId">
        <el-input
          v-model="queryParams.dingdanId"
          placeholder="请输入订单编号"
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
          v-hasPermi="['user:user:add']"
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
          v-hasPermi="['user:user:edit']"
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
          v-hasPermi="['user:user:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['user:user:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="userList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="病人编号" align="center" prop="userId" />
      <el-table-column label="病人名称" align="center" prop="userName" />
      <el-table-column label="病人年龄" align="center" prop="userAge" />
      <el-table-column label="性别" align="center" prop="userSex">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.userSex"/>
        </template>
      </el-table-column>
      <el-table-column label="状态" align="center" prop="userStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_show_hide" :value="scope.row.userStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="生日" align="center" prop="userBirthday" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.userBirthday, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="病人病例" align="center" prop="userCase" />
      <el-table-column label="病人医嘱" align="center" prop="userOrder" />
      <el-table-column label="身份证号" align="center" prop="idCard" />
      <el-table-column label="电话号码" align="center" prop="userPhone" />
      <el-table-column label="订单编号" align="center" prop="dingdanId" />
      <el-table-column label="病人账号" align="center" prop="userZhanghao" />
      <el-table-column label="病人密码" align="center" prop="userPassword" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['user:user:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['user:user:remove']"
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

    <!-- 添加或修改病人信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="病人名称" prop="userName">
          <el-input v-model="form.userName" placeholder="请输入病人名称" />
        </el-form-item>
        <el-form-item label="病人年龄" prop="userAge">
          <el-input v-model="form.userAge" placeholder="请输入病人年龄" />
        </el-form-item>
        <el-form-item label="性别" prop="userSex">
          <el-select v-model="form.userSex" placeholder="请选择性别">
            <el-option
              v-for="dict in dict.type.sys_user_sex"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="状态" prop="userStatus">
          <el-radio-group v-model="form.userStatus">
            <el-radio
              v-for="dict in dict.type.sys_show_hide"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="生日" prop="userBirthday">
          <el-date-picker clearable
            v-model="form.userBirthday"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择生日">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="病人病例" prop="userCase">
          <el-input v-model="form.userCase" placeholder="请输入病人病例" />
        </el-form-item>
        <el-form-item label="病人医嘱" prop="userOrder">
          <el-input v-model="form.userOrder" placeholder="请输入病人医嘱" />
        </el-form-item>
        <el-form-item label="医生编号" prop="doctorId">
          <el-input v-model="form.doctorId" placeholder="请输入医生编号" />
        </el-form-item>
        <el-form-item label="护士编号" prop="nurseId">
          <el-input v-model="form.nurseId" placeholder="请输入护士编号" />
        </el-form-item>
        <el-form-item label="病床编号" prop="sickbedId">
          <el-input v-model="form.sickbedId" placeholder="请输入病床编号" />
        </el-form-item>
        <el-form-item label="病房编号" prop="wardId">
          <el-input v-model="form.wardId" placeholder="请输入病房编号" />
        </el-form-item>
        <el-form-item label="身份证号" prop="idCard">
          <el-input v-model="form.idCard" placeholder="请输入身份证号" />
        </el-form-item>
        <el-form-item label="电话号码" prop="userPhone">
          <el-input v-model="form.userPhone" placeholder="请输入电话号码" />
        </el-form-item>
        <el-form-item label="订单编号" prop="dingdanId">
          <el-input v-model="form.dingdanId" placeholder="请输入订单编号" />
        </el-form-item>
        <el-form-item label="病人账号" prop="userZhanghao">
          <el-input v-model="form.userZhanghao" placeholder="请输入病人账号" />
        </el-form-item>
        <el-form-item label="病人密码" prop="userPassword">
          <el-input v-model="form.userPassword" placeholder="请输入病人密码" />
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
import { listUser, getUser, delUser, addUser, updateUser } from "@/api/user/user";

export default {
  name: "User",
  dicts: ['sys_user_sex', 'sys_show_hide'],
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
      // 病人信息表格数据
      userList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userName: null,
        userAge: null,
        userSex: null,
        userStatus: null,
        userBirthday: null,
        userCase: null,
        userOrder: null,
        idCard: null,
        userPhone: null,
        dingdanId: null,
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
    /** 查询病人信息列表 */
    getList() {
      this.loading = true;
      listUser(this.queryParams).then(response => {
        this.userList = response.rows;
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
        userId: null,
        userName: null,
        userAge: null,
        userSex: null,
        userStatus: null,
        userBirthday: null,
        userCase: null,
        userOrder: null,
        doctorId: null,
        nurseId: null,
        sickbedId: null,
        wardId: null,
        idCard: null,
        createTime: null,
        userPhone: null,
        dingdanId: null,
        userZhanghao: null,
        userPassword: null
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
      this.ids = selection.map(item => item.userId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加病人信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const userId = row.userId || this.ids
      getUser(userId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改病人信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.userId != null) {
            updateUser(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addUser(this.form).then(response => {
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
      const userIds = row.userId || this.ids;
      this.$modal.confirm('是否确认删除病人信息编号为"' + userIds + '"的数据项？').then(function() {
        return delUser(userIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('user/user/export', {
        ...this.queryParams
      }, `user_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
