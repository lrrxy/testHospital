package com.ruoyi.sickbed.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.sickbed.mapper.SickbedMapper;
import com.ruoyi.sickbed.domain.Sickbed;
import com.ruoyi.sickbed.service.ISickbedService;

/**
 * 病床信息Service业务层处理
 * 
 * @author gsq
 * @date 2024-07-07
 */
@Service
public class SickbedServiceImpl implements ISickbedService 
{
    @Autowired
    private SickbedMapper sickbedMapper;

    /**
     * 查询病床信息
     * 
     * @param sickbedId 病床信息主键
     * @return 病床信息
     */
    @Override
    public Sickbed selectSickbedBySickbedId(Long sickbedId)
    {
        return sickbedMapper.selectSickbedBySickbedId(sickbedId);
    }

    /**
     * 查询病床信息列表
     * 
     * @param sickbed 病床信息
     * @return 病床信息
     */
    @Override
    public List<Sickbed> selectSickbedList(Sickbed sickbed)
    {
        return sickbedMapper.selectSickbedList(sickbed);
    }

    /**
     * 新增病床信息
     * 
     * @param sickbed 病床信息
     * @return 结果
     */
    @Override
    public int insertSickbed(Sickbed sickbed)
    {
        sickbed.setCreateTime(DateUtils.getNowDate());
        return sickbedMapper.insertSickbed(sickbed);
    }

    /**
     * 修改病床信息
     * 
     * @param sickbed 病床信息
     * @return 结果
     */
    @Override
    public int updateSickbed(Sickbed sickbed)
    {
        return sickbedMapper.updateSickbed(sickbed);
    }

    /**
     * 批量删除病床信息
     * 
     * @param sickbedIds 需要删除的病床信息主键
     * @return 结果
     */
    @Override
    public int deleteSickbedBySickbedIds(Long[] sickbedIds)
    {
        return sickbedMapper.deleteSickbedBySickbedIds(sickbedIds);
    }

    /**
     * 删除病床信息信息
     * 
     * @param sickbedId 病床信息主键
     * @return 结果
     */
    @Override
    public int deleteSickbedBySickbedId(Long sickbedId)
    {
        return sickbedMapper.deleteSickbedBySickbedId(sickbedId);
    }
}
