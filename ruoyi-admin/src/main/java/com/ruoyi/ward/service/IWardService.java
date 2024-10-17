package com.ruoyi.ward.service;

import java.util.List;
import com.ruoyi.ward.domain.Ward;

/**
 * 病房信息Service接口
 * 
 * @author gsq
 * @date 2024-07-07
 */
public interface IWardService 
{
    /**
     * 查询病房信息
     * 
     * @param wardId 病房信息主键
     * @return 病房信息
     */
    public Ward selectWardByWardId(Long wardId);

    /**
     * 查询病房信息列表
     * 
     * @param ward 病房信息
     * @return 病房信息集合
     */
    public List<Ward> selectWardList(Ward ward);

    /**
     * 新增病房信息
     * 
     * @param ward 病房信息
     * @return 结果
     */
    public int insertWard(Ward ward);

    /**
     * 修改病房信息
     * 
     * @param ward 病房信息
     * @return 结果
     */
    public int updateWard(Ward ward);

    /**
     * 批量删除病房信息
     * 
     * @param wardIds 需要删除的病房信息主键集合
     * @return 结果
     */
    public int deleteWardByWardIds(Long[] wardIds);

    /**
     * 删除病房信息信息
     * 
     * @param wardId 病房信息主键
     * @return 结果
     */
    public int deleteWardByWardId(Long wardId);
}
