<template>
  <div class="login">
    <el-form :model="form" :rules="rules" label-width="auto" style="max-width: 600px" ref="formRef">
      <h2>登录</h2>

      <!-- 登录角色选择 -->
      <el-radio-group v-model="loginRole" class="login-role">
        <el-radio label="user">用户登录</el-radio>
        <el-radio label="nurse">护士登录</el-radio>
        <el-radio label="doctor">医生登录</el-radio>
      </el-radio-group>

      <!-- 切换登录方式 -->
      <el-radio-group v-model="loginMethod" v-if="loginRole" class="login-method">
        <el-radio label="phone">手机号登录</el-radio>
        <el-radio label="userZhanghao">用户名登录</el-radio>
      </el-radio-group>

      <!-- 手机号登录 -->
      <el-form-item v-if="loginMethod === 'phone'" label="手机号" prop="userPhone" class="phone">
        <el-input v-model="form.userPhone" class="srk" />
      </el-form-item>

      <!-- 用户名登录 -->
      <el-form-item v-if="loginMethod === 'userZhanghao'" label="用户名" prop="userZhanghao" class="userZhanghao">
        <el-input v-model="form.userZhanghao" class="srk" />
      </el-form-item>

      <el-form-item label="密码" prop="userPassword" class="pass">
        <el-input v-model="form.userPassword" type="password" class="srk" />
      </el-form-item>

      <el-form-item>
        <el-button type="primary" @click="onSubmit" class="en" :loading="isLoading">登录</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script setup>
import { ElMessage } from 'element-plus';
import { reactive, ref } from 'vue';
import { useTokenStore } from '@/stores/mytoken';
import { useRouter } from 'vue-router';
import axios from 'axios';

const router = useRouter();
const store = useTokenStore();

const form = reactive({
  userPhone: '',
  userZhanghao: '',
  userPassword: '',
});

const loginRole = ref('nurse'); // 默认选择护士登录
const loginMethod = ref('phone'); // 默认选择手机号登录
const isLoading = ref(false);

const rules = reactive({
  userPhone: [
    { required: loginMethod.value === 'phone', message: '电话号码不能为空', trigger: 'blur' },
    { pattern: /^1\d{10}$/, message: '手机号必须是11位数字', trigger: 'blur' },
  ],
  userZhanghao: [
    { required: loginMethod.value === 'userZhanghao', message: '用户名不能为空', trigger: 'blur' },
  ],
  userPassword: [
    { required: true, message: '密码不能为空', trigger: 'blur' },
    { min: 6, max: 18, message: '密码长度需要6~18位', trigger: 'blur' },
  ],
});

const formRef = ref();

const onSubmit = async () => {
  isLoading.value = true;
  await formRef.value?.validate().catch(() => {
    ElMessage.error("表单校验失败");
    isLoading.value = false;
    return;
  });

  let payload;

  if (loginRole.value === 'nurse') {
    payload = {
      nursePhone: form.userPhone,
      nursePassword: form.userPassword,
    };
  } else if (loginRole.value === 'doctor') {
    payload = {
      doctorPhone: form.userPhone,
      doctorPassword: form.userPassword,
    };
  } else {
    payload = {
      userPhone: form.userPhone,
      userPassword: form.userPassword,
    };
  }

  const url = loginRole.value === 'nurse'
    ? 'http://localhost:8090/api/nurse/login'
    : loginRole.value === 'doctor'
    ? 'http://localhost:8090/api/doctor/login'
    : 'http://localhost:8090/api/user/login';

  try {
    const { data } = await axios.post(url, payload);
    if (data.code !== 1) {
      throw new Error(data.msg);
    }

    store.saveToken(data.data);
    localStorage.setItem("token", data.data);
    ElMessage.success("登录成功");

    // 根据角色跳转到相应的首页
    if (loginRole.value === 'user') {
      router.push('/'); // 用户首页
    } else if (loginRole.value === 'nurse') {
      router.push('/nurse/index'); // 护士首页
    } else if (loginRole.value === 'doctor') {
      router.push('/doctor/index'); // 医生首页
    }
  } catch (error) {
    ElMessage.error(error.message || "登录失败，请重试");
  } finally {
    isLoading.value = false;
  }
};
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html, body {
  height: 100%;
  margin: 0;
  font-family: Arial, sans-serif;
}

.login {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 100%;
  max-width: 400px;
  padding: 20px;
  text-align: center;
  border-radius: 15px;
  background-color: #ffffff;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  border: 1px solid #e0e0e0;
  transition: all 0.3s ease-in-out;
}

.login:hover {
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

h2 {
  margin-bottom: 20px;
  font-size: 24px;
  color: #333;
  font-weight: 600;
}

.el-form-item {
  margin-bottom: 20px;
}

.el-form-item .el-input {
  border-radius: 25px;
  box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
}

.el-radio-group {
  display: flex;
  justify-content: center;
  margin-bottom: 20px;
}

.el-button {
  border-radius: 25px;
  font-size: 16px;
  padding: 10px 20px;
  background-color: #007bff;
  border: none;
  color: #fff;
  transition: background-color 0.3s ease;
}

.el-button:hover {
  background-color: #0056b3;
}

.el-button:disabled {
  background-color: #b0b0b0;
}

.srk {
  border-radius: 25px;
}

.phone, .userZhanghao, .pass {
  margin-top: 10px;
}

.en {
  display: flex;
  justify-content: center;
  margin-top: 20px;
  margin-left: 150px;
}
</style>
