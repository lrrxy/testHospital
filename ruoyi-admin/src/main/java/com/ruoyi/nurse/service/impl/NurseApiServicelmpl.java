package com.ruoyi.nurse.service.impl;


import com.ruoyi.ExamineTreatmentCase.domain.ExamineTreatmentCase;
import com.ruoyi.nurse.domain.Nurse;
import com.ruoyi.nurse.domain.Transfer_order_scora;
import com.ruoyi.nurse.mapper.NurseApiMapper;
import com.ruoyi.nurse.mapper.NurseMapper;
import com.ruoyi.nurse.service.NurseApiService;
import com.ruoyi.transfer.domain.SysTransferOrder;
import com.ruoyi.user.domain.Hospital;
import com.ruoyi.user.domain.Transfer_order;
import com.ruoyi.user.domain.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
@Slf4j
public class NurseApiServicelmpl implements NurseApiService {

    @Autowired
    private NurseApiMapper nurseApiMapper;

    @Autowired
    private NurseMapper nurseMapper;

    /**
     * 用户名登录
     * @param nurse
     * @return
     */
    @Override
    public Nurse loginByName(Nurse nurse) {
        return nurseApiMapper.loginByName(nurse.getNurseZhanghao(), nurse.getNursePassword());
    }

    /**
     * 手机号登录
     * @param nurse
     * @return
     */
    @Override
    public Nurse loginByPhone(Nurse nurse) {
        return nurseApiMapper.loginByPhone(nurse.getNursePhone(), nurse.getNursePassword());
    }

    /**
     * 获取当前护士信息
     * @param nurseId
     * @return
     */
    @Override
    public Nurse selectById(int nurseId) {
        return nurseApiMapper.selectById(nurseId);
    }

    @Override
    public List<User> selectPatientsByNurseId(int nurseId) {
        return nurseApiMapper.selectPatientsByNurseId(nurseId);
    }

    @Override
    public List<Transfer_order> selectTransfersByUserIds(List<Integer> userId) {
        List<Transfer_order> transfer_orders = nurseApiMapper.selectTransfersByUserIds(userId);
        log.info("获取到待转诊订单：{}", transfer_orders);
        return transfer_orders;
    }

    @Override
    public void updateStatus(Long userId) {
        nurseApiMapper.updateStatus(userId);
    }

    @Override
    public void insertDingdan(Transfer_order_scora scora) {
        scora.setTransferTime(LocalDateTime.now());
        scora.setStatus(0);
        nurseApiMapper.insertDingdan(scora);
    }

    @Override
    public List<ExamineTreatmentCase> selectHospitalsByUserIds(List<Integer> userId) {
        return nurseApiMapper.selectHospitalsByUserIds(userId);
    }

    @Override
    public void agreeStatus(Long userId,Long nurseId) {
        ExamineTreatmentCase examineTreatmentCase = nurseApiMapper.selectExamineTreatmentCase(userId);
        examineTreatmentCase.setCaseStatus(3);
        examineTreatmentCase.setNurseId(Math.toIntExact(nurseId));
        nurseApiMapper.agreeStatusL(examineTreatmentCase);
        nurseApiMapper.agreeStatus(userId);
    }

    @Override
    public void deagereeStatus(Long userId,Long nurseId) {
        ExamineTreatmentCase examineTreatmentCase = nurseApiMapper.selectExamineTreatmentCase(userId);
        examineTreatmentCase.setCaseStatus(4);
        examineTreatmentCase.setNurseId(Math.toIntExact(nurseId));
        nurseApiMapper.deagereeStatusL(examineTreatmentCase);
        nurseApiMapper.deagereeStatus(userId);
    }

    @Override
    public List<ExamineTreatmentCase> selectPayByNurseId(Long nurseId) {
        return nurseApiMapper.selectPayByNurseId(nurseId);
    }
}
