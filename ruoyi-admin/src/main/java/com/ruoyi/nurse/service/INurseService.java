package com.ruoyi.nurse.service;

import java.util.List;
import com.ruoyi.nurse.domain.Nurse;

/**
 * 护士信息Service接口
 * 
 * @author gsq
 * @date 2024-07-07
 */
public interface INurseService 
{
    /**
     * 查询护士信息
     * 
     * @param nurseId 护士信息主键
     * @return 护士信息
     */
    public Nurse selectNurseByNurseId(Long nurseId);

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
     * 批量删除护士信息
     * 
     * @param nurseIds 需要删除的护士信息主键集合
     * @return 结果
     */
    public int deleteNurseByNurseIds(Long[] nurseIds);

    /**
     * 删除护士信息信息
     * 
     * @param nurseId 护士信息主键
     * @return 结果
     */
    public int deleteNurseByNurseId(Long nurseId);
}
