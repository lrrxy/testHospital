package com.ruoyi.user.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface JiagexxMapper {

    /**
     * 根据id查询检查价格
     * @param examinePriceId
     * @return
     */
    @Select("select examine_price from examine where examine_id = #{examinePriceId}")
    int selectExamine(int examinePriceId);

    /**
     * 根据id查询药品价格
     * @param medicinePriceId
     * @return
     */
    @Select("select medicine_price from medicine where medicine_id = #{medicinePriceId}")
    int selectMedicine(int medicinePriceId);

    /**
     * 根据id查询治疗价格
     * @param treatmentPriceId
     * @return
     */
    @Select("select treatment_price from treatment where treatment_id = #{treatmentPriceId}")
    int selectTreatment(int treatmentPriceId);

    /**
     * 根据id查询病床价格
     * @param userId
     * @return
     */
    @Select("select sickbed_price from sickbed where sickbed_id = #{userId}")
    int selectSickbedPrice(int userId);

    /**
     * 根据id查询检查价格  从jiage表中
     * @param jiageId
     * @return
     */
    @Select("select examine_id from jiage where sickbed_id = #{jiageId}")
    int selectExamineId(int jiageId);

    /**
     * 根据id查询药品价格  从jiage表中
     * @param jiageId
     * @return
     */
    @Select("select medicine_id from jiage where sickbed_id = #{jiageId}")
    int selectMedicineId(int jiageId);


    /**
     * 根据id查询治疗价格  从jiage表中
     * @param jiageId
     * @return
     */
    @Select("select treatment_id from jiage where sickbed_id = #{jiageId}")
    int selectTreatmentId(int jiageId);
}
