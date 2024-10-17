package com.ruoyi.hospital.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.hospital.mapper.SysUserHospitalMapper;
import com.ruoyi.hospital.domain.SysUserHospital;
import com.ruoyi.hospital.service.ISysUserHospitalService;

/**
 * 病人所处医院信息Service业务层处理
 * 
 * @author kda
 * @date 2024-08-27
 */
@Service
public class SysUserHospitalServiceImpl implements ISysUserHospitalService 
{
    @Autowired
    private SysUserHospitalMapper sysUserHospitalMapper;

    /**
     * 查询病人所处医院信息
     * 
     * @param userId 病人所处医院信息主键
     * @return 病人所处医院信息
     */
    @Override
    public SysUserHospital selectSysUserHospitalByUserId(Long userId)
    {
        return sysUserHospitalMapper.selectSysUserHospitalByUserId(userId);
    }

    /**
     * 查询病人所处医院信息列表
     * 
     * @param sysUserHospital 病人所处医院信息
     * @return 病人所处医院信息
     */
    @Override
    public List<SysUserHospital> selectSysUserHospitalList(SysUserHospital sysUserHospital)
    {
        return sysUserHospitalMapper.selectSysUserHospitalList(sysUserHospital);
    }

    /**
     * 新增病人所处医院信息
     * 
     * @param sysUserHospital 病人所处医院信息
     * @return 结果
     */
    @Override
    public int insertSysUserHospital(SysUserHospital sysUserHospital)
    {
        return sysUserHospitalMapper.insertSysUserHospital(sysUserHospital);
    }

    /**
     * 修改病人所处医院信息
     * 
     * @param sysUserHospital 病人所处医院信息
     * @return 结果
     */
    @Override
    public int updateSysUserHospital(SysUserHospital sysUserHospital)
    {
        return sysUserHospitalMapper.updateSysUserHospital(sysUserHospital);
    }

    /**
     * 批量删除病人所处医院信息
     * 
     * @param userIds 需要删除的病人所处医院信息主键
     * @return 结果
     */
    @Override
    public int deleteSysUserHospitalByUserIds(Long[] userIds)
    {
        return sysUserHospitalMapper.deleteSysUserHospitalByUserIds(userIds);
    }

    /**
     * 删除病人所处医院信息信息
     * 
     * @param userId 病人所处医院信息主键
     * @return 结果
     */
    @Override
    public int deleteSysUserHospitalByUserId(Long userId)
    {
        return sysUserHospitalMapper.deleteSysUserHospitalByUserId(userId);
    }
}
