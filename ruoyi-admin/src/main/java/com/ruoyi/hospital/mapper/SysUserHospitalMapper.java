package com.ruoyi.hospital.mapper;

import java.util.List;
import com.ruoyi.hospital.domain.SysUserHospital;

/**
 * 病人所处医院信息Mapper接口
 * 
 * @author kda
 * @date 2024-08-27
 */
public interface SysUserHospitalMapper 
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
     * 删除病人所处医院信息
     * 
     * @param userId 病人所处医院信息主键
     * @return 结果
     */
    public int deleteSysUserHospitalByUserId(Long userId);

    /**
     * 批量删除病人所处医院信息
     * 
     * @param userIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysUserHospitalByUserIds(Long[] userIds);
}
