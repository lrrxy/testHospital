package com.ruoyi.user.mapper;


import com.ruoyi.ExamineTreatmentCase.domain.ExamineTreatmentCase;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ExamineTreatmentCaseCCMapper {
    @Insert("INSERT INTO examine_treatment_case (examine_treatment_category, doctor_id, doctor_name, doctor_status, user_id, case_status, examine_treatment_date) " +
            "VALUES (#{examineTreatmentCategory}, #{doctorId}, #{doctorName}, #{doctorStatus}, #{userId}, #{caseStatus}, #{examineTreatmentDate})")
    void insertExamineTreatmentCase(ExamineTreatmentCase e);

    @Delete("DELETE FROM examine_treatment_case WHERE user_id = #{userId}")
    void delectAppointment(int userId);

    @Select("SELECT examine_treatment_case_id AS examineTreatmentCaseId, " +
            "examine_treatment_category AS examineTreatmentCategory, " +
            "doctor_name AS doctorName, doctor_id AS doctorId, " +
            "user_id AS userId, examine_treatment_date AS examineTreatmentDate , case_status AS caseStatus " +
            "FROM examine_treatment_case_history " +
            "WHERE user_id = #{userId} " )
    ExamineTreatmentCase selectByPay(int userId);
}
