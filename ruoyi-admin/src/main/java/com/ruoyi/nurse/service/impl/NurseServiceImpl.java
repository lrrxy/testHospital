package com.ruoyi.nurse.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.nurse.mapper.NurseMapper;
import com.ruoyi.nurse.domain.Nurse;
import com.ruoyi.nurse.service.INurseService;

/**
 * 护士信息Service业务层处理
 * 
 * @author gsq
 * @date 2024-07-07
 */
@Service
public class NurseServiceImpl implements INurseService 
{
    @Autowired
    private NurseMapper nurseMapper;

    /**
     * 查询护士信息
     * 
     * @param nurseId 护士信息主键
     * @return 护士信息
     */
    @Override
    public Nurse selectNurseByNurseId(Long nurseId)
    {
        return nurseMapper.selectNurseByNurseId(nurseId);
    }

    /**
     * 查询护士信息列表
     * 
     * @param nurse 护士信息
     * @return 护士信息
     */
    @Override
    public List<Nurse> selectNurseList(Nurse nurse)
    {
        return nurseMapper.selectNurseList(nurse);
    }

    /**
     * 新增护士信息
     * 
     * @param nurse 护士信息
     * @return 结果
     */
    @Override
    public int insertNurse(Nurse nurse)
    {
        nurse.setCreateTime(DateUtils.getNowDate());
        return nurseMapper.insertNurse(nurse);
    }

    /**
     * 修改护士信息
     * 
     * @param nurse 护士信息
     * @return 结果
     */
    @Override
    public int updateNurse(Nurse nurse)
    {
        return nurseMapper.updateNurse(nurse);
    }

    /**
     * 批量删除护士信息
     * 
     * @param nurseIds 需要删除的护士信息主键
     * @return 结果
     */
    @Override
    public int deleteNurseByNurseIds(Long[] nurseIds)
    {
        return nurseMapper.deleteNurseByNurseIds(nurseIds);
    }

    /**
     * 删除护士信息信息
     * 
     * @param nurseId 护士信息主键
     * @return 结果
     */
    @Override
    public int deleteNurseByNurseId(Long nurseId)
    {
        return nurseMapper.deleteNurseByNurseId(nurseId);
    }
}
