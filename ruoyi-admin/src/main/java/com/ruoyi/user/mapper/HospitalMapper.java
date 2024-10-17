package com.ruoyi.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.Delete;

import com.ruoyi.user.domain.Hospital;

/**
 * 医院信息Mapper接口
 *
 * @author gsq
 * @date 2024-07-07
 */
@Mapper
public interface HospitalMapper {

    /**
     * 查询医院信息
     *
     * @param hospitalID 医院信息主键
     * @return 医院信息
     */
    @Select("SELECT * FROM hospital WHERE hospital_id = #{hospitalID}")
    public Hospital selectHospitalByHospitalId(int hospitalID);

    /**
     * 查询医院信息列表
     *
     * @param status 医院信息查询条件
     * @return 医院信息集合
     */
    @Select("SELECT * FROM hospital WHERE 1=1 AND status = #{status}")
    public List<Hospital> selectHospitalList(@Param("status") int status);

    /**
     * 新增医院信息
     *
     * @param hospital 医院信息
     * @return 结果
     */
    @Insert("INSERT INTO hospital (user_id, hospital_name, hospital_dizhi, status) VALUES (#{userID}, #{hospitalName}, #{hospitalDizhi}, #{status})")
    public int insertHospital(Hospital hospital);

    /**
     * 修改医院信息
     *
     * @param hospital 医院信息
     * @return 结果
     */
    @Update("UPDATE hospital SET user_id = #{userID}, hospital_name = #{hospitalName}, hospital_dizhi = #{hospitalDizhi}, status = #{status} WHERE hospital_id = #{hospitalID}")
    public int updateHospital(Hospital hospital);

    /**
     * 删除医院信息
     *
     * @param hospitalID 医院信息主键
     * @return 结果
     */
    @Delete("DELETE FROM hospital WHERE hospital_id = #{hospitalID}")
    public int deleteHospitalByHospitalId(int hospitalID);

    /**
     * 批量删除医院信息
     *
     * @param hospitalIDs 需要删除的数据主键集合
     * @return 结果
     */
    @Delete("<script> DELETE FROM hospital WHERE hospital_id IN <foreach item='item' index='index' collection='hospitalIDs' open='(' separator=',' close=')'> #{item} </foreach> </script>")
    public int deleteHospitalByHospitalIds(@Param("hospitalIDs") int[] hospitalIDs);


}