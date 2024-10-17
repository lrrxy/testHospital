import { ElMessage } from "element-plus"
import { defineStore } from "pinia"
import { ref, computed } from 'vue'


export const useTokenStore = defineStore('mytoken', () => {
    // ref 相当于 state
    const tokenJson = ref<string | null>(window.localStorage.getItem("token") || null)  // 存储JWT令牌的字符串
    
    // computed 相当于 getters
    const token = computed(() => {
        if (!tokenJson.value) {
            ElMessage.warning("Token 不存在，请重新登录")  // 提示用户 token 不存在
            return null
        }
        try {
            // console.log("Computed Token Value:", tokenJson.value) // 调试输出
            return tokenJson.value  // 直接返回JWT令牌字符串
        } catch (err) {
            ElMessage.error("读取 Token 失败")
            window.localStorage.removeItem("token")  // 如果 token 不合法，移除它
            tokenJson.value = null
            throw err
        }
        
    })

   

    // function 相当于 actions
    function saveToken(data: string) {
        try {
            tokenJson.value = data  // 保存到 ref
            window.localStorage.setItem("token", data)  // 存储到 localStorage
            ElMessage.success("Token 保存成功")  // 成功提示
        } catch (err) {
            ElMessage.error("保存 Token 时出错")
            throw err
        }
    }

    function clearToken() {
        tokenJson.value = null
        window.localStorage.removeItem("token")
        ElMessage.success("Token 已清除")
    }
    // const jwt = token.value;
    // console.log("jwtt:" + jwt);  // 打印实际的 JWT 值

    // 向外暴露
    return { token, saveToken, clearToken }
    
})