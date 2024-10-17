package com.ruoyi.sickbed.mapper;

import java.util.List;
import com.ruoyi.sickbed.domain.Sickbed;

/**
 * 病床信息Mapper接口
 * 
 * @author gsq
 * @date 2024-07-07
 */
public interface SickbedMapper 
{
    /**
     * 查询病床信息
     * 
     * @param sickbedId 病床信息主键
     * @return 病床信息
     */
    public Sickbed selectSickbedBySickbedId(Long sickbedId);

    /**
     * 查询病床信息列表
     * 
     * @param sickbed 病床信息
     * @return 病床信息集合
     */
    public List<Sickbed> selectSickbedList(Sickbed sickbed);

    /**
     * 新增病床信息
     * 
     * @param sickbed 病床信息
     * @return 结果
     */
    public int insertSickbed(Sickbed sickbed);

    /**
     * 修改病床信息
     * 
     * @param sickbed 病床信息
     * @return 结果
     */
    public int updateSickbed(Sickbed sickbed);

    /**
     * 删除病床信息
     * 
     * @param sickbedId 病床信息主键
     * @return 结果
     */
    public int deleteSickbedBySickbedId(Long sickbedId);

    /**
     * 批量删除病床信息
     * 
     * @param sickbedIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSickbedBySickbedIds(Long[] sickbedIds);
}
