package com.ruoyi.hospital.service;

import java.util.List;
import com.ruoyi.hospital.domain.SysUserHospital;

/**
 * 病人所处医院信息Service接口
 * 
 * @author kda
 * @date 2024-08-27
 */
public interface ISysUserHospitalService 
{
    /**
     * 查询病人所处医院信息
     * 
     * @param userId 病人所处医院信息主键
     * @return 病人所处医院信息
     */
    public SysUserHospital selectSysUserHospitalByUserId(Long userId);

    /**
     * 查询病人所处医院信息列表
     * 
     * @param sysUserHospital 病人所处医院信息
     * @return 病人所处医院信息集合
     */
    public List<SysUserHospital> selectSysUserHospitalList(SysUserHospital sysUserHospital);

    /**
     * 新增病人所处医院信息
     * 
     * @param sysUserHospital 病人所处医院信息
     * @return 结果
     */
    public int insertSysUserHospital(SysUserHospital sysUserHospital);

    /**
     * 修改病人所处医院信息
     * 
     * @param sysUserHospital 病人所处医院信息
     * @return 结果
     */
    public int updateSysUserHospital(SysUserHospital sysUserHospital);

    /**
     * 批量删除病人所处医院信息
     * 
     * @param userIds 需要删除的病人所处医院信息主键集合
     * @return 结果
     */
    public int deleteSysUserHospitalByUserIds(Long[] userIds);

    /**
     * 删除病人所处医院信息信息
     * 
     * @param userId 病人所处医院信息主键
     * @return 结果
     */
    public int deleteSysUserHospitalByUserId(Long userId);
}
