package com.ruoyi.examine.mapper;

import java.util.List;
import com.ruoyi.examine.domain.Examine;

/**
 * 检查信息Mapper接口
 * 
 * @author gsq
 * @date 2024-07-07
 */
public interface ExamineMapper 
{
    /**
     * 查询检查信息
     * 
     * @param examineId 检查信息主键
     * @return 检查信息
     */
    public Examine selectExamineByExamineId(Long examineId);

    /**
     * 查询检查信息列表
     * 
     * @param examine 检查信息
     * @return 检查信息集合
     */
    public List<Examine> selectExamineList(Examine examine);

    /**
     * 新增检查信息
     * 
     * @param examine 检查信息
     * @return 结果
     */
    public int insertExamine(Examine examine);

    /**
     * 修改检查信息
     * 
     * @param examine 检查信息
     * @return 结果
     */
    public int updateExamine(Examine examine);

    /**
     * 删除检查信息
     * 
     * @param examineId 检查信息主键
     * @return 结果
     */
    public int deleteExamineByExamineId(Long examineId);

    /**
     * 批量删除检查信息
     * 
     * @param examineIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteExamineByExamineIds(Long[] examineIds);
}
