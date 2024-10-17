package com.ruoyi.ward.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ward.mapper.WardMapper;
import com.ruoyi.ward.domain.Ward;
import com.ruoyi.ward.service.IWardService;

/**
 * 病房信息Service业务层处理
 * 
 * @author gsq
 * @date 2024-07-07
 */
@Service
public class WardServiceImpl implements IWardService 
{
    @Autowired
    private WardMapper wardMapper;

    /**
     * 查询病房信息
     * 
     * @param wardId 病房信息主键
     * @return 病房信息
     */
    @Override
    public Ward selectWardByWardId(Long wardId)
    {
        return wardMapper.selectWardByWardId(wardId);
    }

    /**
     * 查询病房信息列表
     * 
     * @param ward 病房信息
     * @return 病房信息
     */
    @Override
    public List<Ward> selectWardList(Ward ward)
    {
        return wardMapper.selectWardList(ward);
    }

    /**
     * 新增病房信息
     * 
     * @param ward 病房信息
     * @return 结果
     */
    @Override
    public int insertWard(Ward ward)
    {
        ward.setCreateTime(DateUtils.getNowDate());
        return wardMapper.insertWard(ward);
    }

    /**
     * 修改病房信息
     * 
     * @param ward 病房信息
     * @return 结果
     */
    @Override
    public int updateWard(Ward ward)
    {
        return wardMapper.updateWard(ward);
    }

    /**
     * 批量删除病房信息
     * 
     * @param wardIds 需要删除的病房信息主键
     * @return 结果
     */
    @Override
    public int deleteWardByWardIds(Long[] wardIds)
    {
        return wardMapper.deleteWardByWardIds(wardIds);
    }

    /**
     * 删除病房信息信息
     * 
     * @param wardId 病房信息主键
     * @return 结果
     */
    @Override
    public int deleteWardByWardId(Long wardId)
    {
        return wardMapper.deleteWardByWardId(wardId);
    }
}
