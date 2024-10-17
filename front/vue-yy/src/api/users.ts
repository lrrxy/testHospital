import { ref } from "vue"
import request from "../utils/request"
import { useTokenStore } from "../stores/mytoken"

//用户登录-参数类型
type LoginInfo = {
    userPhone: String
    codes?: String
    userPassword: String
}

//用户登录-返回数据类型
type LoginResult = {
    code: Number
    msg: String
    data:String
}

//用户请求登录
export const login = (loginInfo:LoginInfo) => {
    return request<LoginResult>({
        method: "POST",
        url: '/api/user/login',
        data:loginInfo
    })
}

// //  刷新token
// export const refreshToken = () => {
//     return request({
//         method: "POST",
//         url: '/api/user/refresh',
//         params: {
//             refreshToken: useTokenStore()?.refreshToken,
//         }
//     })
// }