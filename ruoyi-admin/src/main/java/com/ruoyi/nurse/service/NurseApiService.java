package com.ruoyi.nurse.service;

import com.ruoyi.ExamineTreatmentCase.domain.ExamineTreatmentCase;
import com.ruoyi.nurse.domain.Nurse;
import com.ruoyi.nurse.domain.Transfer_order_scora;
import com.ruoyi.transfer.domain.SysTransferOrder;
import com.ruoyi.user.domain.Hospital;
import com.ruoyi.user.domain.Transfer_order;
import com.ruoyi.user.domain.User;

import java.util.List;

public interface NurseApiService {
    Nurse loginByName(Nurse nurse);

    Nurse loginByPhone(Nurse nurse);

    Nurse selectById(int nurseId);

    List<User> selectPatientsByNurseId(int nurseId);

    List<Transfer_order> selectTransfersByUserIds(List<Integer> userId);

    void updateStatus(Long userId);

    void insertDingdan(Transfer_order_scora scora);

    List<ExamineTreatmentCase> selectHospitalsByUserIds(List<Integer> userId);

    void agreeStatus(Long userId,Long nurseId);

    void deagereeStatus(Long userId,Long nurseId);

    List<ExamineTreatmentCase> selectPayByNurseId(Long nurseId);
}
