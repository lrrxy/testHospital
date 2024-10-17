package com.ruoyi.dingdan.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 订单信息对象 dingdan
 * 
 * @author gsq
 * @date 2024-07-07
 */
public class Dingdan extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 订单ID */
    private Long dingdanId;

    /** 病床ID */
    @Excel(name = "病床ID")
    private Long sickbedId;

    /** 护士ID */
    @Excel(name = "护士ID")
    private Long nurseId;

    /** 医生ID */
    @Excel(name = "医生ID")
    private Long doctorId;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 价格ID */
    @Excel(name = "价格ID")
    private Long jiageId;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date UpdateDataTime;

    /** 订单状态 */
    @Excel(name = "订单状态")
    private Integer dingdanStatus;

    public void setDingdanId(Long dingdanId) 
    {
        this.dingdanId = dingdanId;
    }

    public Long getDingdanId() 
    {
        return dingdanId;
    }
    public void setSickbedId(Long sickbedId) 
    {
        this.sickbedId = sickbedId;
    }

    public Long getSickbedId() 
    {
        return sickbedId;
    }
    public void setNurseId(Long nurseId) 
    {
        this.nurseId = nurseId;
    }

    public Long getNurseId() 
    {
        return nurseId;
    }
    public void setDoctorId(Long doctorId) 
    {
        this.doctorId = doctorId;
    }

    public Long getDoctorId() 
    {
        return doctorId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setJiageId(Long jiageId) 
    {
        this.jiageId = jiageId;
    }

    public Long getJiageId() 
    {
        return jiageId;
    }
    public void setUpdateDataTime(Date UpdateDataTime) 
    {
        this.UpdateDataTime = UpdateDataTime;
    }

    public Date getUpdateDataTime() 
    {
        return UpdateDataTime;
    }
    public void setDingdanStatus(Integer dingdanStatus) 
    {
        this.dingdanStatus = dingdanStatus;
    }

    public Integer getDingdanStatus() 
    {
        return dingdanStatus;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("dingdanId", getDingdanId())
            .append("sickbedId", getSickbedId())
            .append("nurseId", getNurseId())
            .append("doctorId", getDoctorId())
            .append("userId", getUserId())
            .append("jiageId", getJiageId())
            .append("UpdateDataTime", getUpdateDataTime())
            .append("dingdanStatus", getDingdanStatus())
            .toString();
    }
}
