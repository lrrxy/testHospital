package com.ruoyi.user.service;

import com.ruoyi.ExamineTreatmentCase.domain.ExamineTreatmentCase;
import com.ruoyi.caseCC.domain.BingliCase;
import com.ruoyi.doctor.domain.Doctor;
import com.ruoyi.payment.domain.PaymentRecord;
import com.ruoyi.user.domain.JiaGexx;
import com.ruoyi.user.domain.User;

import java.util.List;

public interface UserAPIService {
    User loginByName(User user);

    User loginByPhone(User user);

    User selectUserAll(Long userId);


    User selectSickbedID(int sickbedId);

    void inserTransfer(User u, String hospitalName, String newHospitalName, String condition);

    JiaGexx selectJiaGe(int jiageId, String userName);


    List<PaymentRecord> selectPay(int userId);

    List<PaymentRecord> selectStatusPay(int userId);

    void updateStatus(int recordId);

    BingliCase selectBingli(int sickbedId, String userName);

    List<Doctor> selectDoctor(int doctorStatus);

    void insertExamineTreatmentCase(ExamineTreatmentCase e);

    void delectAppointment(int userId);

    double selectBalance(int userId);

    ExamineTreatmentCase selectByPay(int userId);
}
