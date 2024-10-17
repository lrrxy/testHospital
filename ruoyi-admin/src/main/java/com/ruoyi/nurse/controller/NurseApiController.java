package com.ruoyi.nurse.controller;


import com.ruoyi.ExamineTreatmentCase.domain.ExamineTreatmentCase;
import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.pojo.Result;
import com.ruoyi.common.utils.JwtUtils;
import com.ruoyi.nurse.domain.Nurse;
import com.ruoyi.nurse.domain.Transfer_order_scora;
import com.ruoyi.nurse.service.NurseApiService;
import com.ruoyi.payment.domain.PaymentRecord;
import com.ruoyi.transfer.domain.SysTransferOrder;
import com.ruoyi.user.domain.Hospital;
import com.ruoyi.user.domain.Transfer_order;
import com.ruoyi.user.domain.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/api/nurse")
public class NurseApiController {

    @Autowired
    private NurseApiService nurseService;

    @PostMapping("/login")
    @Anonymous
    public Result NurseLogin(@RequestBody Nurse nurse){

        /**
         * 验证用户名密码
         */
        if (nurse.getNurseZhanghao()!=null){
            log.info("nurse护士登录: {}", nurse);
            Nurse n =nurseService.loginByName(nurse);
            //登录成功,生成令牌,下发令牌
            if (n != null){
                Map<String, Object> claims = new HashMap<>();
                claims.put("id", n.getNurseId());
                claims.put("zhanghao", n.getNurseZhanghao());
                claims.put("Password", n.getNursePassword());
                String jwt = JwtUtils.generateJwt(claims); //jwt包含了当前登录的员工信息
                return Result.success(jwt);
            }
            //登录失败, 返回错误信息
            return Result.error("用户名或密码错误");
        }
        else{
            log.info("nurse手机号登录: {}", nurse);
            Nurse n =nurseService.loginByPhone(nurse);
            //登录成功,生成令牌,下发令牌
            if (n != null){
                Map<String, Object> claims = new HashMap<>();
                claims.put("id", n.getNurseId());
                claims.put("phone", n.getNursePhone());
                claims.put("Password", n.getNursePassword());
                String jwt = JwtUtils.generateJwt(claims); //jwt包含了当前登录的员工信息
                return Result.success(jwt);
            }
            //登录失败, 返回错误信息
            return Result.error("手机号或密码错误");
        }

    }

    /**
     * 护士信息
     * @param token
     * @return
     */
    @Anonymous
    @GetMapping("/info")
    public Result getInfo(@RequestHeader("token") String token){
        // 从JWT令牌中解析出用户ID
        int nurseId = JwtUtils.getUserIdFromCustomField(token);
        log.info("当前护士ID: {}", nurseId);
        Nurse nurse = nurseService.selectById(nurseId);
        return Result.success(nurse);
    }

    /**
     * 根据nurseId获取相关的病人
     * @param token
     * @return
     */
    @Anonymous
    @GetMapping("/selectUser")
    public Result selectUser(@RequestHeader("token") String token){
        // 从JWT令牌中解析出用户ID
        int nurseId = JwtUtils.getUserIdFromCustomField(token);
        log.info("当前护士ID: {}", nurseId);
        List<User> patients = nurseService.selectPatientsByNurseId(nurseId);
        return Result.success(patients);
    }

    /**
     * 根据userId获取相关的转院申请
     * @param userId
     * @return
     */
    @Anonymous
    @GetMapping("/selectTransfer")
    public Result selectTransfer(@RequestParam List<Integer> userId){
        log.info("当前护士要查询病人的id: {}", userId);
        List<Transfer_order> transfers = nurseService.selectTransfersByUserIds(userId);
        return Result.success(transfers);
    }

    /**
     * 根据userId修改转院申请状态
     */
    @Anonymous
    @PostMapping("/updateStatus")
    public Result updateStatus(@RequestBody User u){
        Long userId = u.getUserId();
        log.info("当前护士要同意的id: {}", userId);
        nurseService.updateStatus(userId);
        return Result.success("申请成功");
    }

    /**
     *拒绝转院申请
     */
    @Anonymous
    @PostMapping("/insertDingdan")
    public Result selectPayment(@RequestBody Transfer_order_scora scora){
        log.info("当前护士要同意的id: {}", scora);
        nurseService.insertDingdan(scora);
        nurseService.updateStatus(scora.getUserId());
        return Result.success("拒绝成功");
    }

    /**
     * 根据userId获取挂号信息
     */
    @Anonymous
    @GetMapping("/selectCase")
    public Result selectHospital(@RequestParam List<Integer> userId){
        log.info("当前护士要查询病人的id: {}", userId);
        List<ExamineTreatmentCase> examineTreatmentCases = nurseService.selectHospitalsByUserIds(userId);
        return Result.success(examineTreatmentCases);
    }


    /**
     * 根据userId同意挂号
     * @param u
     * @return
     */
    @Anonymous
    @PostMapping("/agreeStatus")
    public Result agreeStatus(@RequestHeader("token") String token ,@RequestBody User u){
        Long userId = u.getUserId();
        Long nurseId = (long) JwtUtils.getUserIdFromCustomField(token);
        log.info("当前护士要同意的id: {}", userId);
        nurseService.agreeStatus(userId,nurseId);
        return Result.success("同意挂号");
    }

    /**
     * 根据userId拒绝挂号
     * @param u
     * @return
     */
    @Anonymous
    @PostMapping("/deagereeStatus")
    public Result deagereeStatus(@RequestHeader("token") String token,@RequestBody User u){
        Long userId = u.getUserId();
        Long nurseId = (long) JwtUtils.getUserIdFromCustomField(token);
        log.info("当前护士要拒绝的id: {}", userId);
        nurseService.deagereeStatus(userId,nurseId);
        return Result.success("拒绝挂号");
    }


    /**
     * 根据userId获取历史挂号信息
     * @param token
     * @return
     */
    @Anonymous
    @GetMapping("/selectPay")
    public Result selectPay(@RequestHeader("token") String token){
        Long nurseId = (long) JwtUtils.getUserIdFromCustomField(token);
        log.info("当前护士的id: {}", nurseId);
        List<ExamineTreatmentCase> examineTreatmentCases = nurseService.selectPayByNurseId(nurseId);
        return Result.success(examineTreatmentCases);
    }



}
