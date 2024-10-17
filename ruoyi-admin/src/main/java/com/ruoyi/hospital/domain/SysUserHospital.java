package com.ruoyi.hospital.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 病人所处医院信息对象 sys_user_hospital
 * 
 * @author kda
 * @date 2024-08-27
 */
public class SysUserHospital extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 病人编号 */
    private Long userId;

    /** 医院编号 */
    @Excel(name = "医院编号")
    private Long hospitalId;

    /** 医院名称 */
    @Excel(name = "医院名称")
    private String hospitalName;

    /** 医院地址 */
    @Excel(name = "医院地址")
    private String hospitalDizhi;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private Long hospitalStatus;

    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setHospitalId(Long hospitalId) 
    {
        this.hospitalId = hospitalId;
    }

    public Long getHospitalId() 
    {
        return hospitalId;
    }
    public void setHospitalName(String hospitalName) 
    {
        this.hospitalName = hospitalName;
    }

    public String getHospitalName() 
    {
        return hospitalName;
    }
    public void setHospitalDizhi(String hospitalDizhi) 
    {
        this.hospitalDizhi = hospitalDizhi;
    }

    public String getHospitalDizhi() 
    {
        return hospitalDizhi;
    }
    public void setHospitalStatus(Long hospitalStatus) 
    {
        this.hospitalStatus = hospitalStatus;
    }

    public Long getHospitalStatus() 
    {
        return hospitalStatus;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("userId", getUserId())
            .append("hospitalId", getHospitalId())
            .append("hospitalName", getHospitalName())
            .append("hospitalDizhi", getHospitalDizhi())
            .append("hospitalStatus", getHospitalStatus())
            .toString();
    }
}
