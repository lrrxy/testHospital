package com.ruoyi.ExamineTreatmentCase.service;

import java.util.List;
import com.ruoyi.ExamineTreatmentCase.domain.ExamineTreatmentCase;

/**
 * 检查或手术订单信息Service接口
 * 
 * @author kda
 * @date 2024-09-14
 */
public interface IExamineTreatmentCaseService 
{
    /**
     * 查询检查或手术订单信息
     * 
     * @param examineTreatmentCaseId 检查或手术订单信息主键
     * @return 检查或手术订单信息
     */
    public ExamineTreatmentCase selectExamineTreatmentCaseByExamineTreatmentCaseId(Long examineTreatmentCaseId);

    /**
     * 查询检查或手术订单信息列表
     * 
     * @param examineTreatmentCase 检查或手术订单信息
     * @return 检查或手术订单信息集合
     */
    public List<ExamineTreatmentCase> selectExamineTreatmentCaseList(ExamineTreatmentCase examineTreatmentCase);

    /**
     * 新增检查或手术订单信息
     * 
     * @param examineTreatmentCase 检查或手术订单信息
     * @return 结果
     */
    public int insertExamineTreatmentCase(ExamineTreatmentCase examineTreatmentCase);

    /**
     * 修改检查或手术订单信息
     * 
     * @param examineTreatmentCase 检查或手术订单信息
     * @return 结果
     */
    public int updateExamineTreatmentCase(ExamineTreatmentCase examineTreatmentCase);

    /**
     * 批量删除检查或手术订单信息
     * 
     * @param examineTreatmentCaseIds 需要删除的检查或手术订单信息主键集合
     * @return 结果
     */
    public int deleteExamineTreatmentCaseByExamineTreatmentCaseIds(Long[] examineTreatmentCaseIds);

    /**
     * 删除检查或手术订单信息信息
     * 
     * @param examineTreatmentCaseId 检查或手术订单信息主键
     * @return 结果
     */
    public int deleteExamineTreatmentCaseByExamineTreatmentCaseId(Long examineTreatmentCaseId);
}
