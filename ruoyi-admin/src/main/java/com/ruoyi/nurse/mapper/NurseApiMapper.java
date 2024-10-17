package com.ruoyi.nurse.mapper;

import com.ruoyi.ExamineTreatmentCase.domain.ExamineTreatmentCase;
import com.ruoyi.nurse.domain.Nurse;
import com.ruoyi.nurse.domain.Transfer_order_scora;
import com.ruoyi.transfer.domain.SysTransferOrder;
import com.ruoyi.user.domain.Hospital;
import com.ruoyi.user.domain.Transfer_order;
import com.ruoyi.user.domain.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface NurseApiMapper {


    /**
     * 根据用户名和密码查询护士信息
     * @param nurseZhanghao
     * @param nursePassword
     * @return
     */
    @Select("SELECT nurse_id AS nurseId,  nurse_name AS nurseName, " +
            "nurse_age AS nurseAge, nurse_sex AS nurseSex, nurse_status AS nurseStatus, nurse_birthday AS nurseBirthday, id_card AS idCard " +
            "FROM nurse WHERE nurse_zhanghao = #{nurseZhanghao} AND nurse_password = #{nursePassword}")
    Nurse loginByName(@Param("nurseZhanghao") String nurseZhanghao,@Param("nursePassword") String nursePassword);

    /**
     * 根据手机号和密码查询护士信息
     * @param nursePhone
     * @param nursePassword
     * @return
     */
    @Select("SELECT nurse_id AS nurseId,  nurse_name AS nurseName, " +
            "nurse_age AS nurseAge, nurse_sex AS nurseSex, nurse_status AS nurseStatus, nurse_birthday AS nurseBirthday, id_card AS idCard " +
            "FROM nurse WHERE nurse_phone = #{nursePhone} AND nurse_password = #{nursePassword}")
    Nurse loginByPhone(@Param("nursePhone") String nursePhone,@Param("nursePassword") String nursePassword);

    /**
     * 根据id查询护士信息
     * @param nurseId
     * @return
     */
    @Select("SELECT nurse_id AS nurseId,  nurse_name AS nurseName, nurse_age AS nurseAge, nurse_sex AS nurseSex, nurse_status AS nurseStatus, nurse_birthday AS nurseBirthday, id_card AS idCard , nurse_email AS nurseEmail , nurse_position AS nursePosition , nurse_score AS nurseScore , nurse_zhanghao AS nurseZhanghao , nurse_password AS nursePassword , nurse_phone AS nursePhone FROM nurse WHERE nurse_id = #{nurseId}")
    Nurse selectById(@Param("nurseId") int nurseId);

    /**
     * 根据护士id查询用户信息
     * @param nurseId
     * @return
     */
    @Select("select user_case AS userCase , user_name AS userName , user_sex AS userSex , user_age AS userAge , sickbed_id AS sickbedId , user_id AS userId from user where nurse_id=#{nurseId}")
    List<User> selectPatientsByNurseId(int nurseId);

    /**
     * 根据用户id查询转诊信息
     * @param userId
     * @return
     */
    @Select("<script>" +
            "SELECT hospital_name AS hospitalName, new_hospital_name AS new_hospitalName, transfer_order_condition AS 'condition' , user_name AS userName , user_id AS userId " +
            "FROM sys_transfer_order " +
            "WHERE user_id IN " +
            "<foreach item='id' collection='userId' open='(' separator=',' close=')'>" +
            "#{id}" +
            "</foreach> " +
            "AND order_status = 1" +
            "</script>")
    List<Transfer_order> selectTransfersByUserIds(@Param("userId") List<Integer> userId);

    /**
     * 根据用户id更新转诊状态
     * @param userId
     */
    @Update("UPDATE sys_transfer_order SET order_status = 0 WHERE user_id = #{userId} AND order_status = 1")
    void updateStatus(@Param("userId") Long userId);


    /**
     * 添加拒绝转院的理由
     * @param scora
     */
    @Insert("INSERT INTO transfer_order_scora (user_id, user_name, hospital_name, transfer_order_time, new_hospital_name, transfer_order_condition, transfer_order_not_condition, order_status) " +
            "VALUES (#{userId}, #{userName}, #{hospitalName}, #{transferTime}, #{new_hospitalName}, #{condition}, #{notcondition}, #{status})")
    void insertDingdan(Transfer_order_scora scora);

    /**
     * 根据用户id查询今日挂号信息
     * @param userId
     * @return
     */
    @Select("<script>" +
            "SELECT examine_treatment_case_id AS examineTreatmentCaseId, " +
            "examine_treatment_category AS examineTreatmentCategory, " +
            "doctor_name AS doctorName, doctor_id AS doctorId, " +
            "user_id AS userId, examine_treatment_date AS examineTreatmentDate " +
            "FROM examine_treatment_case " +
            "WHERE user_id IN " +
            "<foreach item='id' collection='list' open='(' separator=',' close=')'>" +
            "#{id}" +
            "</foreach>" +
            "AND case_status = 1" +
            "</script>")
    List<ExamineTreatmentCase> selectHospitalsByUserIds(List<Integer> userId);

    /**
     * 根据用户id同意挂号
     * @param userId
     */
    @Update("UPDATE examine_treatment_case SET case_status = 3 WHERE user_id = #{userId} AND case_status = 1")
    void agreeStatus(@Param("userId") Long userId);

    /**
     * 根据用户id拒绝挂号
     * @param userId
     */
    @Update("UPDATE examine_treatment_case SET case_status = 4 WHERE user_id = #{userId} AND case_status = 1")
    void deagereeStatus(@Param("userId") Long userId);

    /**
     * 查看userId对应的挂号信息
     * @param userId
     * @return
     */
    @Select("SELECT examine_treatment_case_id AS examineTreatmentCaseId, " +
            "examine_treatment_category AS examineTreatmentCategory, " +
            "doctor_name AS doctorName, doctor_id AS doctorId, " +
            "user_id AS userId, examine_treatment_date AS examineTreatmentDate " +
            "FROM examine_treatment_case " +
            "WHERE user_id = #{userId} " +
            "LIMIT 1")
    ExamineTreatmentCase selectExamineTreatmentCase(Long userId);

    /**
     * 同意挂号添加到历史查看里
     */
    @Insert("INSERT INTO examine_treatment_case_history ( examine_treatment_category, doctor_name, doctor_id, user_id, examine_treatment_date , case_status , nurse_id ) " +
            "VALUES ( #{examineTreatmentCategory}, #{doctorName}, #{doctorId}, #{userId}, #{examineTreatmentDate}, #{caseStatus}, #{nurseId})")
    void agreeStatusL(ExamineTreatmentCase examineTreatmentCase);

    /**
     * 拒绝挂号添加到历史查看里
     * @param examineTreatmentCase
     */
    @Insert("INSERT INTO examine_treatment_case_history ( examine_treatment_category, doctor_name, doctor_id, user_id, examine_treatment_date , case_status , nurse_id ) " +
            "VALUES ( #{examineTreatmentCategory}, #{doctorName}, #{doctorId}, #{userId}, #{examineTreatmentDate}, #{caseStatus}, #{nurseId})")
    void deagereeStatusL(ExamineTreatmentCase examineTreatmentCase);

    /**
     * 根据护士id查询已支付的挂号
     * @param nurseId
     * @return
     */
    @Select("SELECT examine_treatment_case_id AS examineTreatmentCaseId, " +
            "examine_treatment_category AS examineTreatmentCategory, " +
            "doctor_name AS doctorName, doctor_id AS doctorId, " +
            "user_id AS userId, examine_treatment_date AS examineTreatmentDate , case_status AS caseStatus " +
            "FROM examine_treatment_case_history " +
            "WHERE nurse_id = #{nurseId} " )
    List<ExamineTreatmentCase> selectPayByNurseId(Long nurseId);
}
