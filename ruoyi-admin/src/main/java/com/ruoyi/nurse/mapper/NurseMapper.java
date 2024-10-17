package com.ruoyi.nurse.mapper;

import java.util.List;
import com.ruoyi.nurse.domain.Nurse;
import org.apache.ibatis.annotations.Mapper;

/**
 * 护士信息Mapper接口
 * 
 * @author gsq
 * @date 2024-07-07
 */
@Mapper
public interface NurseMapper 
{
    /**
     * 查询护士信息
     * 
     * @param nurseId 护士信息主键
     * @return 护士信息
     */
    public Nurse selectNurseByNurseId(Long nurseId);

    Nurse loginByName(String nurseZhanghao, String nursePassword);

    Nurse loginByPhone(String nursePhone, String nursePassword);

    /**
     * 查询护士信息列表
     * 
     * @param nurse 护士信息
     * @return 护士信息集合
     */
    public List<Nurse> selectNurseList(Nurse nurse);

    /**
     * 新增护士信息
     * 
     * @param nurse 护士信息
     * @return 结果
     */
    public int insertNurse(Nurse nurse);

    /**
     * 修改护士信息
     * 
     * @param nurse 护士信息
     * @return 结果
     */
    public int updateNurse(Nurse nurse);

    /**
     * 删除护士信息
     * 
     * @param nurseId 护士信息主键
     * @return 结果
     */
    public int deleteNurseByNurseId(Long nurseId);

    /**
     * 批量删除护士信息
     * 
     * @param nurseIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteNurseByNurseIds(Long[] nurseIds);
}
