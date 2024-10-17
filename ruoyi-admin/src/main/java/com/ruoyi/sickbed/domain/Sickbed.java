package com.ruoyi.sickbed.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 病床信息对象 sickbed
 * 
 * @author gsq
 * @date 2024-07-07
 */
public class Sickbed extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 病床ID */
    private Long sickbedId;

    /** 病床信息 */
    @Excel(name = "病床信息")
    private String sickbedInformation;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String sickbedStatus;

    /** 病房ID */
    @Excel(name = "病房ID")
    private Long wardId;

    /** 床位价格 */
    @Excel(name = "床位价格")
    private BigDecimal sickbedPrice;

    public void setSickbedId(Long sickbedId) 
    {
        this.sickbedId = sickbedId;
    }

    public Long getSickbedId() 
    {
        return sickbedId;
    }
    public void setSickbedInformation(String sickbedInformation) 
    {
        this.sickbedInformation = sickbedInformation;
    }

    public String getSickbedInformation() 
    {
        return sickbedInformation;
    }
    public void setSickbedStatus(String sickbedStatus) 
    {
        this.sickbedStatus = sickbedStatus;
    }

    public String getSickbedStatus() 
    {
        return sickbedStatus;
    }
    public void setWardId(Long wardId) 
    {
        this.wardId = wardId;
    }

    public Long getWardId() 
    {
        return wardId;
    }
    public void setSickbedPrice(BigDecimal sickbedPrice) 
    {
        this.sickbedPrice = sickbedPrice;
    }

    public BigDecimal getSickbedPrice() 
    {
        return sickbedPrice;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("sickbedId", getSickbedId())
            .append("sickbedInformation", getSickbedInformation())
            .append("sickbedStatus", getSickbedStatus())
            .append("createTime", getCreateTime())
            .append("wardId", getWardId())
            .append("sickbedPrice", getSickbedPrice())
            .toString();
    }
}
