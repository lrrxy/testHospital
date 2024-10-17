package com.ruoyi.ward.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 病房信息对象 ward
 * 
 * @author gsq
 * @date 2024-07-07
 */
public class Ward extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 病房ID */
    private Long wardId;

    /** 病房信息 */
    @Excel(name = "病房信息")
    private String wardInformation;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String wardStatus;

    public void setWardId(Long wardId) 
    {
        this.wardId = wardId;
    }

    public Long getWardId() 
    {
        return wardId;
    }
    public void setWardInformation(String wardInformation) 
    {
        this.wardInformation = wardInformation;
    }

    public String getWardInformation() 
    {
        return wardInformation;
    }
    public void setWardStatus(String wardStatus) 
    {
        this.wardStatus = wardStatus;
    }

    public String getWardStatus() 
    {
        return wardStatus;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("wardId", getWardId())
            .append("wardInformation", getWardInformation())
            .append("wardStatus", getWardStatus())
            .append("createTime", getCreateTime())
            .toString();
    }
}
