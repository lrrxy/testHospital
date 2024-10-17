package com.ruoyi.user.controller;

import com.ruoyi.ExamineTreatmentCase.domain.ExamineTreatmentCase;
import com.ruoyi.caseCC.domain.BingliCase;
import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.pojo.Result;
import com.ruoyi.common.utils.JwtUtils;
import com.ruoyi.doctor.domain.Doctor;
import com.ruoyi.payment.domain.PaymentRecord;
import com.ruoyi.user.domain.JiaGexx;
import com.ruoyi.user.domain.User;
import com.ruoyi.user.service.UserAPIService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/api/user")
public class UserApiController {

    @Autowired
    private UserAPIService userAPIService;

    @PostMapping("/login")
    @Anonymous
    public Result UserLogin(@RequestBody User user){

        /**
         * 验证用户名密码
         */
        if (user.getUserZhanghao()!=null){
            log.info("user用户名登录: {}", user);
            User u =userAPIService.loginByName(user);
            //登录成功,生成令牌,下发令牌
            if (u != null){
                Map<String, Object> claims = new HashMap<>();
                claims.put("id", u.getUserId());
                claims.put("zhanghao", u.getUserZhanghao());
                claims.put("userPassword", u.getUserPassword());
                String jwt = JwtUtils.generateJwt(claims); //jwt包含了当前登录的员工信息
                return Result.success(jwt);
            }
            //登录失败, 返回错误信息
            return Result.error("用户名或密码错误");
        }
        else{
            log.info("user手机号登录: {}", user);
            User u =userAPIService.loginByPhone(user);
            //登录成功,生成令牌,下发令牌
            if (u != null){
                Map<String, Object> claims = new HashMap<>();
                claims.put("id", u.getUserId());
                claims.put("phone", u.getUserPhone());
                claims.put("userPassword", u.getUserPassword());
                String jwt = JwtUtils.generateJwt(claims); //jwt包含了当前登录的员工信息
                return Result.success(jwt);
            }
            //登录失败, 返回错误信息
            return Result.error("手机号或密码错误");
        }

    }

    /**
     * 转院申请功能
     * @param requestBody
     * @return
     */
    @Anonymous
    @PostMapping("/newshow")
    public Result application(@RequestBody Map<String, Object> requestBody){
        log.info("申请转诊: {}",requestBody);

        int sickbedId = Integer.parseInt(requestBody.get("sickbedId").toString());
        String hospitalName = requestBody.get("hospitalName").toString();
        String new_hospitalName = requestBody.get("new_hospitalName").toString();
        String condition = requestBody.get("condition").toString();
        log.info("sickbedId: {}", sickbedId);
        User u = userAPIService.selectSickbedID(sickbedId);
        if (u != null){
            userAPIService.inserTransfer(u, hospitalName, new_hospitalName, condition);
            return Result.success("申请成功");
        } else {
            return Result.error("申请失败");
        }
    }


    /**
     * 病人缴费信息查询
     * @param
     * @return
     */
    @Anonymous
    @GetMapping("/xinxi")
    public Result selectAll(@RequestHeader("token") String token){
        // 从JWT令牌中解析出用户ID
        int userId = JwtUtils.getUserIdFromCustomField(token);
        log.info("病人缴费信息查询,获取当前用户ID: {}", userId);
        List<PaymentRecord> paymentRecords = userAPIService.selectPay(userId);
        if (paymentRecords == null) {
            return Result.error("查无此缴费信息");
        }
        return Result.success(paymentRecords);
    }


    /**
     * 费用查询
     * @param jiageId
     * @param userName
     * @return
     */
    @Anonymous
    @GetMapping("/jiage")
    public Result selectJiaGe(@RequestParam("jiageId") int jiageId,@RequestParam("userName") String userName){
        log.info("价格查询信息：床号-"+jiageId+" 用户名-"+userName);
        JiaGexx j = userAPIService.selectJiaGe(jiageId,userName);
        if (jiageId == 0 || userName.equals("")){
            return Result.error("不可空填");
        }
        else if (j == null){
            return Result.error("查无此人");
        }
        else {

            return Result.success(j);
        }

    }

    /**
     * 查询病人需要缴费的信息
     * @param token
     * @return
     */
    @Anonymous
    @GetMapping("payment")
    public Result payment(@RequestHeader("token") String token) {
        // 从JWT令牌中解析出用户ID
        int userId = JwtUtils.getUserIdFromCustomField(token);
        log.info("病人缴费信息查询,获取当前用户ID: {}", userId);
        List<PaymentRecord> paymentRecords = userAPIService.selectStatusPay(userId);
        return Result.success(paymentRecords);
    }

    /**
     * 缴费
     * @param requestData
     * @return
     */
    @Anonymous
    @PostMapping("payment")
    public Result payment(@RequestBody Map<String, Integer> requestData) {
        int recordId = requestData.get("recordId");
        log.info("缴费信息对应的订单ID: {}", recordId);
        userAPIService.updateStatus(recordId);
        return Result.success("缴费成功");
    }

    /**
     * 病人请求，查看病例
     * @param
     * @return
     */
    @Anonymous
    @PostMapping("/case")
    public Result selectBingLi(@RequestBody BingliCase request){
        int sickbedId = request.getSickbedId();
        String userName = request.getUserName();
        log.info("价格查询信息：床号-"+sickbedId+" 用户名-"+userName);
        BingliCase b = userAPIService.selectBingli(sickbedId,userName);
        if (sickbedId == 0 || userName.equals("")){
            return Result.error("不可空填");
        }
        else if (b == null){
            return Result.error("查无此人");
        }
        else {

            return Result.success(b);
        }

    }

    /**
     * 获取所有人员未满的医生信息
     * @return
     */
    @Anonymous
    @GetMapping("/getdoctor")
    public Result getDoctor(){
        log.info("获取医生信息");
        List<Doctor> doctors = userAPIService.selectDoctor(1);
        return Result.success(doctors);
    }

    /**
     * 病人预约治疗
     * @param requestBody
     * @param token
     * @return
     */
    @Anonymous
    @PostMapping("/appointment")
    public Result appointment(@RequestBody ExamineTreatmentCase requestBody, @RequestHeader("token") String token) {
        log.info("预约信息：预约时间-" + requestBody.getExamineTreatmentDate() + " 类别-" + requestBody.getExamineTreatmentCategory() + " 医生ID-" + requestBody.getDoctorId());

        int userId = JwtUtils.getUserIdFromCustomField(token);

        ExamineTreatmentCase e = new ExamineTreatmentCase();
        e.setUserId(userId);
        e.setDoctorStatus(1); // 设为未满
        e.setExamineTreatmentCategory(requestBody.getExamineTreatmentCategory());
        e.setExamineTreatmentDate(requestBody.getExamineTreatmentDate());
        e.setDoctorId(requestBody.getDoctorId());

        userAPIService.insertExamineTreatmentCase(e);

        return Result.success("预约成功");
    }


    /**
     * 取消预约
     * @param token
     * @return
     */
    @Anonymous
    @PostMapping("/delectappointment")
    public Result delectAppointment(@RequestHeader("token") String token) {
        int userId = JwtUtils.getUserIdFromCustomField(token);
        userAPIService.delectAppointment(userId);
        return Result.success("取消成功");
    }


    /**
     * 获取余额
     * @param token
     * @return
     */
    @Anonymous
    @GetMapping("/getbalance")
    public Result getBalance(@RequestHeader("token") String token) {
        log.info("获取余额");
        int userId = JwtUtils.getUserIdFromCustomField(token);
        double balanceSum = userAPIService.selectBalance(userId);
        return Result.success(balanceSum);
    }

    @Anonymous
    @GetMapping("/getpay")
    public Result getPay(@RequestHeader("token") String token) {
        log.info("获取余额");
        int userId = JwtUtils.getUserIdFromCustomField(token);
        ExamineTreatmentCase e = userAPIService.selectByPay(userId);
        return Result.success(e);

    }


}
