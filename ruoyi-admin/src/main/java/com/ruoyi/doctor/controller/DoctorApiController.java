package com.ruoyi.doctor.controller;


import com.ruoyi.ExamineTreatmentCase.domain.ExamineTreatmentCase;
import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.pojo.Result;
import com.ruoyi.common.utils.JwtUtils;
import com.ruoyi.doctor.domain.Doctor;
import com.ruoyi.doctor.service.DoctorApiService;
import com.ruoyi.medicine.domain.Medicine;
import com.ruoyi.nurse.domain.Nurse;
import com.ruoyi.user.domain.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/api/doctor")
public class DoctorApiController {

    @Autowired
    private DoctorApiService doctorApiService;

    @PostMapping("/login")
    @Anonymous
    public Result NurseLogin(@RequestBody Doctor doctor){

        /**
         * 验证用户名密码
         */
        if (doctor.getDoctorZhanghao()!=null){
            log.info("doctor医生登录: {}", doctor);
            Doctor d =doctorApiService.loginByName(doctor);
            //登录成功,生成令牌,下发令牌
            if (d != null){
                Map<String, Object> claims = new HashMap<>();
                claims.put("id", d.getDoctorId());
                claims.put("zhanghao", d.getDoctorZhanghao());
                claims.put("Password", d.getDoctorPassword());
                String jwt = JwtUtils.generateJwt(claims); //jwt包含了当前登录的员工信息
                return Result.success(jwt);
            }
            //登录失败, 返回错误信息
            return Result.error("用户名或密码错误");
        }
        else{
            log.info("doctor医生手机号登录: {}", doctor);
            Doctor d =doctorApiService.loginByPhone(doctor);
            //登录成功,生成令牌,下发令牌
            if (d != null){
                Map<String, Object> claims = new HashMap<>();
                claims.put("id", d.getDoctorId());
                claims.put("phone", d.getDoctorPhone());
                claims.put("Password", d.getDoctorPassword());
                String jwt = JwtUtils.generateJwt(claims); //jwt包含了当前登录的员工信息
                return Result.success(jwt);
            }
            //登录失败, 返回错误信息
            return Result.error("手机号或密码错误");
        }

    }


    /**
     * 医生信息
     * @param token
     * @return
     */
    @Anonymous
    @GetMapping("/info")
    public Result getInfo(@RequestHeader("token") String token){
        // 从JWT令牌中解析出用户ID
        int doctorId = JwtUtils.getUserIdFromCustomField(token);
        log.info("当前doctor医生ID: {}", doctorId);
        Doctor doctor = doctorApiService.selectById(doctorId);
        return Result.success(doctor);
    }

    /**
     * 根据doctorId获取相关的病人
     * @param token
     * @return
     */
    @Anonymous
    @GetMapping("/selectUser")
    public Result selectUser(@RequestHeader("token") String token){
        // 从JWT令牌中解析出用户ID
        int doctorId = JwtUtils.getUserIdFromCustomField(token);
        log.info("当前doctor医生ID: {}", doctorId);
        List<User> patients = doctorApiService.selectPatientsByDoctorId(doctorId);
        return Result.success(patients);
    }

    /**
     * 根据userId获取历史挂号信息
     * @param token
     * @return
     */
    @Anonymous
    @GetMapping("/selectPay")
    public Result selectPay(@RequestHeader("token") String token){
        int doctorId = JwtUtils.getUserIdFromCustomField(token);
        log.info("当前doctor医生ID: {}", doctorId);
        List<ExamineTreatmentCase> examineTreatmentCases = doctorApiService.selectPayByDoctorId(doctorId);
        return Result.success(examineTreatmentCases);
    }

    /**
     * 已同意挂号的历史单号信息
     * @param token
     * @return
     */
    @Anonymous
    @GetMapping("/selectCaseStatus")
    public Result selectCaseStatus(@RequestHeader("token") String token){
        int doctorId = JwtUtils.getUserIdFromCustomField(token);
        log.info("当前doctor医生ID: {}", doctorId);
        List<ExamineTreatmentCase> examineTreatmentCases = doctorApiService.selectCaseStatusByDoctorId(doctorId);
        return Result.success(examineTreatmentCases);
    }

    /**
     * 获取医生所有剩余药品
     * @return
     */
    @Anonymous
    @GetMapping("/selectMedicine")
    public Result selectMedicine(){
        log.info("获取医生所有剩余药品");
        List<Medicine> medicines = doctorApiService.selectMedicine();
        return Result.success(medicines);
    }

}
