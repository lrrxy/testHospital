package com.ruoyi.doctor.service.impl;

import com.ruoyi.ExamineTreatmentCase.domain.ExamineTreatmentCase;
import com.ruoyi.doctor.domain.Doctor;
import com.ruoyi.doctor.mapper.DoctorApiMapper;
import com.ruoyi.doctor.service.DoctorApiService;
import com.ruoyi.medicine.domain.Medicine;
import com.ruoyi.user.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DoctorApiServiceImpl implements DoctorApiService {

    @Autowired
    private DoctorApiMapper doctorMapper;

    @Override
    public Doctor loginByName(Doctor doctor) {
        return doctorMapper.loginByName(doctor.getDoctorZhanghao(), doctor.getDoctorPassword());
    }

    @Override
    public Doctor loginByPhone(Doctor doctor) {
        return doctorMapper.loginByPhone(doctor.getDoctorPhone(), doctor.getDoctorPassword());
    }

    @Override
    public Doctor selectById(int doctorId) {
        return doctorMapper.selectById(doctorId);
    }

    @Override
    public List<User> selectPatientsByDoctorId(int doctorId) {
        return doctorMapper.selectPatientsByDoctorId(doctorId);
    }

    @Override
    public List<ExamineTreatmentCase> selectPayByDoctorId(int doctorId) {
        return doctorMapper.selectPayByDoctorId(doctorId);
    }

    @Override
    public List<ExamineTreatmentCase> selectCaseStatusByDoctorId(int doctorId) {
        return doctorMapper.selectCaseStatusByDoctorId(doctorId);
    }

    @Override
    public List<Medicine> selectMedicine() {
        return doctorMapper.selectMedicine();
    }
}
