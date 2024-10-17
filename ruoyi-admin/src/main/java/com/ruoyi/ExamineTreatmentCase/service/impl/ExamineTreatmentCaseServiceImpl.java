package com.ruoyi.ExamineTreatmentCase.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ExamineTreatmentCase.mapper.ExamineTreatmentCaseMapper;
import com.ruoyi.ExamineTreatmentCase.domain.ExamineTreatmentCase;
import com.ruoyi.ExamineTreatmentCase.service.IExamineTreatmentCaseService;

/**
 * 检查或手术订单信息Service业务层处理
 * 
 * @author kda
 * @date 2024-09-14
 */
@Service
public class ExamineTreatmentCaseServiceImpl implements IExamineTreatmentCaseService 
{
    @Autowired
    private ExamineTreatmentCaseMapper examineTreatmentCaseMapper;

    /**
     * 查询检查或手术订单信息
     * 
     * @param examineTreatmentCaseId 检查或手术订单信息主键
     * @return 检查或手术订单信息
     */
    @Override
    public ExamineTreatmentCase selectExamineTreatmentCaseByExamineTreatmentCaseId(Long examineTreatmentCaseId)
    {
        return examineTreatmentCaseMapper.selectExamineTreatmentCaseByExamineTreatmentCaseId(examineTreatmentCaseId);
    }

    /**
     * 查询检查或手术订单信息列表
     * 
     * @param examineTreatmentCase 检查或手术订单信息
     * @return 检查或手术订单信息
     */
    @Override
    public List<ExamineTreatmentCase> selectExamineTreatmentCaseList(ExamineTreatmentCase examineTreatmentCase)
    {
        return examineTreatmentCaseMapper.selectExamineTreatmentCaseList(examineTreatmentCase);
    }

    /**
     * 新增检查或手术订单信息
     * 
     * @param examineTreatmentCase 检查或手术订单信息
     * @return 结果
     */
    @Override
    public int insertExamineTreatmentCase(ExamineTreatmentCase examineTreatmentCase)
    {
        return examineTreatmentCaseMapper.insertExamineTreatmentCase(examineTreatmentCase);
    }

    /**
     * 修改检查或手术订单信息
     * 
     * @param examineTreatmentCase 检查或手术订单信息
     * @return 结果
     */
    @Override
    public int updateExamineTreatmentCase(ExamineTreatmentCase examineTreatmentCase)
    {
        return examineTreatmentCaseMapper.updateExamineTreatmentCase(examineTreatmentCase);
    }

    /**
     * 批量删除检查或手术订单信息
     * 
     * @param examineTreatmentCaseIds 需要删除的检查或手术订单信息主键
     * @return 结果
     */
    @Override
    public int deleteExamineTreatmentCaseByExamineTreatmentCaseIds(Long[] examineTreatmentCaseIds)
    {
        return examineTreatmentCaseMapper.deleteExamineTreatmentCaseByExamineTreatmentCaseIds(examineTreatmentCaseIds);
    }

    /**
     * 删除检查或手术订单信息信息
     * 
     * @param examineTreatmentCaseId 检查或手术订单信息主键
     * @return 结果
     */
    @Override
    public int deleteExamineTreatmentCaseByExamineTreatmentCaseId(Long examineTreatmentCaseId)
    {
        return examineTreatmentCaseMapper.deleteExamineTreatmentCaseByExamineTreatmentCaseId(examineTreatmentCaseId);
    }
}
