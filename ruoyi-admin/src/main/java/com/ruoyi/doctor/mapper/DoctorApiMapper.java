package com.ruoyi.doctor.mapper;

import com.ruoyi.ExamineTreatmentCase.domain.ExamineTreatmentCase;
import com.ruoyi.doctor.domain.Doctor;
import com.ruoyi.medicine.domain.Medicine;
import com.ruoyi.user.domain.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface DoctorApiMapper {


    /**
     * 根据用户名和密码查询信息医生
     * @return
     */
    @Select("SELECT doctor_id AS doctorId,  doctor_name AS doctorName, " +
            "doctor_age AS doctorAge, doctor_sex AS doctorSex, doctor_status AS doctorStatus, doctor_birthday AS doctorBirthday, id_card AS idCard " +
            "FROM doctor WHERE doctor_zhanghao = #{doctorZhanghao} AND doctor_password = #{doctorPassword}")
    Doctor loginByName(@Param("doctorZhanghao") String doctorZhanghao,@Param("doctorPassword") String doctorPassword);

    /**
     * 根据手机号和密码查询医生信息
     * @return
     */
    @Select("SELECT doctor_id AS doctorId,  doctor_name AS doctorName, " +
            "doctor_age AS doctorAge, doctor_sex AS doctorSex, doctor_status AS doctorStatus, doctor_birthday AS doctorBirthday, id_card AS idCard " +
            "FROM doctor WHERE doctor_phone = #{doctorPhone} AND doctor_password = #{doctorPassword}")
    Doctor loginByPhone(@Param("doctorPhone") String doctorPhone,@Param("doctorPassword") String doctorPassword);


    /**
     * 根据id查询医生信息
     * @param doctorId
     * @return
     */
    @Select("SELECT doctor_id AS doctorId,  doctor_name AS doctorName, doctor_age AS doctorAge, doctor_sex AS doctorSex, doctor_status AS doctorStatus, doctor_birthday AS doctorBirthday, id_card AS idCard , doctor_email AS doctorEmail , doctor_position AS doctorPosition , doctor_score AS doctorScore , doctor_zhanghao AS doctorZhanghao , doctor_password AS doctorPassword , doctor_phone AS doctorPhone , department_name AS departmentName FROM doctor WHERE doctor_id = #{doctorId}")
    Doctor selectById(int doctorId);

    /**
     * 根据医生id查询用户信息
     * @param doctorId
     * @return
     */
    @Select("select user_case AS userCase , user_name AS userName , user_sex AS userSex , user_age AS userAge , sickbed_id AS sickbedId , user_id AS userId from user where doctor_id=#{doctorId}")
    List<User> selectPatientsByDoctorId(int doctorId);

    @Select("SELECT examine_treatment_case_id AS examineTreatmentCaseId, " +
            "examine_treatment_category AS examineTreatmentCategory, " +
            "doctor_name AS doctorName, doctor_id AS doctorId, " +
            "user_id AS userId, examine_treatment_date AS examineTreatmentDate , case_status AS caseStatus " +
            "FROM examine_treatment_case_history " +
            "WHERE doctor_id = #{doctorId} " )
    List<ExamineTreatmentCase> selectPayByDoctorId(int doctorId);

    @Select("SELECT examine_treatment_case_id AS examineTreatmentCaseId, " +
            "examine_treatment_category AS examineTreatmentCategory, " +
            "doctor_name AS doctorName, doctor_id AS doctorId, " +
            "user_id AS userId, examine_treatment_date AS examineTreatmentDate , case_status AS caseStatus " +
            "FROM examine_treatment_case_history " +
            "WHERE doctor_id = #{doctorId} AND case_status = 3 " )
    List<ExamineTreatmentCase> selectCaseStatusByDoctorId(int doctorId);

    @Select("SELECT medicine_id AS medicineId, " +
            "medicine_name AS medicineName, " +
            "medicine_type AS medicineType, " +
            "medicine_price AS medicinePrice, " +
            "medicine_datetime AS medicineDatetime, " +
            "medicine_num AS medicineNum, " +
            "medicine_count AS medicineCount, " +
            "medicine_type AS medicineType, " +
            "medicine_purpose AS medicinePurpose " +
            "FROM medicine " +
            "WHERE medicine_count > 0 " )
    List<Medicine> selectMedicine();
}
