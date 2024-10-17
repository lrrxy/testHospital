
package com.ruoyi.user.filter;

import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.common.pojo.Result;
import com.ruoyi.common.utils.JwtUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@Slf4j

@WebFilter(urlPatterns = "/api/*")
public class LoginFilter implements Filter {


    @Override   //拦截到请求之后调用，可调用多次
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;

        //  1.请求url
        String url = req.getRequestURL().toString();
        log.info("请求的url：{}",url);

        //  2.判断请求url中是否包含login 或者 reg，如果包含，说明登录 或者注册操作，放行
        if (url.contains("login") || url.contains("reg")){
            log.info("登录操作，放行。。。");
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }

        //  3.获取请求头中的令牌（token）
        String jwt = req.getHeader("token");

        //  4.判断令牌是否存在，如果不存在，返回错误结果（未登录）
        if (!StringUtils.hasLength(jwt)){
            log.info("请求头token为空，返回未登录的信息");
            Result error = Result.error("NULLtoken");
            String notLogin = JSONObject.toJSONString(error);
            if (!resp.isCommitted()) {
                resp.getWriter().write(notLogin);
            }
            return;
        }

        //  5.解析token，如果解析失败，返回错误结果（未登录）
        try {
            JwtUtils.parseJWT(jwt);
        } catch (Exception e) {
            e.printStackTrace();
            log.info("解析令牌失败，返回未登录错误信息");
            Result error = Result.error("登录失败");
            String notLogin = JSONObject.toJSONString(error);
            if (!resp.isCommitted()) {
                resp.getWriter().write(notLogin);
            }
            return;
        }

        //  6.放行
        log.info("令牌合法，放行");
        filterChain.doFilter(servletRequest, servletResponse);

    }

}
