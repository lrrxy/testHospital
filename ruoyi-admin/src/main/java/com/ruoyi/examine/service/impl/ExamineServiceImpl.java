package com.ruoyi.examine.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.examine.mapper.ExamineMapper;
import com.ruoyi.examine.domain.Examine;
import com.ruoyi.examine.service.IExamineService;

/**
 * 检查信息Service业务层处理
 * 
 * @author gsq
 * @date 2024-07-07
 */
@Service
public class ExamineServiceImpl implements IExamineService 
{
    @Autowired
    private ExamineMapper examineMapper;

    /**
     * 查询检查信息
     * 
     * @param examineId 检查信息主键
     * @return 检查信息
     */
    @Override
    public Examine selectExamineByExamineId(Long examineId)
    {
        return examineMapper.selectExamineByExamineId(examineId);
    }

    /**
     * 查询检查信息列表
     * 
     * @param examine 检查信息
     * @return 检查信息
     */
    @Override
    public List<Examine> selectExamineList(Examine examine)
    {
        return examineMapper.selectExamineList(examine);
    }

    /**
     * 新增检查信息
     * 
     * @param examine 检查信息
     * @return 结果
     */
    @Override
    public int insertExamine(Examine examine)
    {
        return examineMapper.insertExamine(examine);
    }

    /**
     * 修改检查信息
     * 
     * @param examine 检查信息
     * @return 结果
     */
    @Override
    public int updateExamine(Examine examine)
    {
        return examineMapper.updateExamine(examine);
    }

    /**
     * 批量删除检查信息
     * 
     * @param examineIds 需要删除的检查信息主键
     * @return 结果
     */
    @Override
    public int deleteExamineByExamineIds(Long[] examineIds)
    {
        return examineMapper.deleteExamineByExamineIds(examineIds);
    }

    /**
     * 删除检查信息信息
     * 
     * @param examineId 检查信息主键
     * @return 结果
     */
    @Override
    public int deleteExamineByExamineId(Long examineId)
    {
        return examineMapper.deleteExamineByExamineId(examineId);
    }
}
