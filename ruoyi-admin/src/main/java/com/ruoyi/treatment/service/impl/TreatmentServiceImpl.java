package com.ruoyi.treatment.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.treatment.mapper.TreatmentMapper;
import com.ruoyi.treatment.domain.Treatment;
import com.ruoyi.treatment.service.ITreatmentService;

/**
 * 治疗信息Service业务层处理
 * 
 * @author gsq
 * @date 2024-07-07
 */
@Service
public class TreatmentServiceImpl implements ITreatmentService 
{
    @Autowired
    private TreatmentMapper treatmentMapper;

    /**
     * 查询治疗信息
     * 
     * @param treatmentId 治疗信息主键
     * @return 治疗信息
     */
    @Override
    public Treatment selectTreatmentByTreatmentId(Long treatmentId)
    {
        return treatmentMapper.selectTreatmentByTreatmentId(treatmentId);
    }

    /**
     * 查询治疗信息列表
     * 
     * @param treatment 治疗信息
     * @return 治疗信息
     */
    @Override
    public List<Treatment> selectTreatmentList(Treatment treatment)
    {
        return treatmentMapper.selectTreatmentList(treatment);
    }

    /**
     * 新增治疗信息
     * 
     * @param treatment 治疗信息
     * @return 结果
     */
    @Override
    public int insertTreatment(Treatment treatment)
    {
        return treatmentMapper.insertTreatment(treatment);
    }

    /**
     * 修改治疗信息
     * 
     * @param treatment 治疗信息
     * @return 结果
     */
    @Override
    public int updateTreatment(Treatment treatment)
    {
        return treatmentMapper.updateTreatment(treatment);
    }

    /**
     * 批量删除治疗信息
     * 
     * @param treatmentIds 需要删除的治疗信息主键
     * @return 结果
     */
    @Override
    public int deleteTreatmentByTreatmentIds(Long[] treatmentIds)
    {
        return treatmentMapper.deleteTreatmentByTreatmentIds(treatmentIds);
    }

    /**
     * 删除治疗信息信息
     * 
     * @param treatmentId 治疗信息主键
     * @return 结果
     */
    @Override
    public int deleteTreatmentByTreatmentId(Long treatmentId)
    {
        return treatmentMapper.deleteTreatmentByTreatmentId(treatmentId);
    }
}
