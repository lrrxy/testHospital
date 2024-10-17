package com.ruoyi.doctor.service;

import com.ruoyi.ExamineTreatmentCase.domain.ExamineTreatmentCase;
import com.ruoyi.doctor.domain.Doctor;
import com.ruoyi.medicine.domain.Medicine;
import com.ruoyi.user.domain.User;

import java.util.List;

public interface DoctorApiService {
    Doctor loginByName(Doctor doctor);

    Doctor loginByPhone(Doctor doctor);

    Doctor selectById(int doctorId);

    List<User> selectPatientsByDoctorId(int doctorId);

    List<ExamineTreatmentCase> selectPayByDoctorId(int doctorId);

    List<ExamineTreatmentCase> selectCaseStatusByDoctorId(int doctorId);

    List<Medicine> selectMedicine();
}
