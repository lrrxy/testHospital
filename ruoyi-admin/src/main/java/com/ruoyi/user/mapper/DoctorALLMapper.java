package com.ruoyi.user.mapper;

import com.ruoyi.doctor.domain.Doctor;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface DoctorALLMapper {

    /**
     * 查询医生信息 根据status
     * @param doctorStatus
     * @return
     */
    @Select("SELECT doctor_id AS doctorId,  doctor_name AS doctorName, " +
            "doctor_age AS doctorAge, doctor_sex AS doctorSex, doctor_status AS doctorStatus, doctor_birthday AS doctorBirthday, id_card AS idCard, department_id AS departmentId  " +
            "FROM doctor WHERE doctor_status = #{doctorStatus}")
    List<Doctor> selectDoctor(int doctorStatus);

    /**
     * 查询医生名称
     * @param doctorId
     * @return
     */
    @Select("SELECT doctor_name FROM doctor WHERE doctor_id = #{doctorId}")
    String selectDoctorNameById(int doctorId);


}
