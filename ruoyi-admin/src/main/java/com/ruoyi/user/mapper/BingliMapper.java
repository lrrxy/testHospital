package com.ruoyi.user.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface BingliMapper {

    /**
     * 根据用户id查询病人病例
     * @param userId
     * @return
     */
    @Select("select user_case from user where user_id = #{userId}")
    String selectBingliName(int userId);

    /**
     * 根据用户id查询病例的医嘱
     * @param userId
     * @return
     */
    @Select("select user_order from user where user_id = #{userId}")
    String selectBingliOrder(int userId);


    /**
     * 根据用户id查询病例的用药
     * @param medicineId
     * @return
     */
    @Select("select medicine_name from medicine where medicine_id = #{medicineId}")
    String selectBingliMedicine(int medicineId);

    /**
     * 根据用户id查询病例的医生
     * @param userId
     * @return
     */
    @Select("select doctor_id from bingli_case where user_id = #{userId}")
    int selectBingliDoctor(int userId);

    /**
     * 根据医生id查询医生姓名
     * @param doctorId
     * @return
     */
    @Select("select doctor_name from doctor where doctor_id = #{doctorId}")
    String selectBingliDoctorName(int doctorId);

    /**
     * 根据病床id查询用户id
     * @param sickbedId
     * @return
     */
    @Select("select user_id from bingli_case where sickbed_id = #{sickbedId}")
    int selectBingliUserId(int sickbedId);
}
