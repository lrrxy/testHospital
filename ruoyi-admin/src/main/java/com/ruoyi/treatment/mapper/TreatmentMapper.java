package com.ruoyi.treatment.mapper;

import java.util.List;
import com.ruoyi.treatment.domain.Treatment;

/**
 * 治疗信息Mapper接口
 * 
 * @author gsq
 * @date 2024-07-07
 */
public interface TreatmentMapper 
{
    /**
     * 查询治疗信息
     * 
     * @param treatmentId 治疗信息主键
     * @return 治疗信息
     */
    public Treatment selectTreatmentByTreatmentId(Long treatmentId);

    /**
     * 查询治疗信息列表
     * 
     * @param treatment 治疗信息
     * @return 治疗信息集合
     */
    public List<Treatment> selectTreatmentList(Treatment treatment);

    /**
     * 新增治疗信息
     * 
     * @param treatment 治疗信息
     * @return 结果
     */
    public int insertTreatment(Treatment treatment);

    /**
     * 修改治疗信息
     * 
     * @param treatment 治疗信息
     * @return 结果
     */
    public int updateTreatment(Treatment treatment);

    /**
     * 删除治疗信息
     * 
     * @param treatmentId 治疗信息主键
     * @return 结果
     */
    public int deleteTreatmentByTreatmentId(Long treatmentId);

    /**
     * 批量删除治疗信息
     * 
     * @param treatmentIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTreatmentByTreatmentIds(Long[] treatmentIds);
}
