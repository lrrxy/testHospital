package com.ruoyi.examine.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 检查信息对象 examine
 * 
 * @author gsq
 * @date 2024-07-07
 */
public class Examine extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 检查ID */
    private Long examineId;

    /** 检查名称 */
    @Excel(name = "检查名称")
    private String examineName;

    /** 检查价格 */
    @Excel(name = "检查价格")
    private Long examinePrice;

    /** 检查类型 */
    @Excel(name = "检查类型")
    private String examineType;

    public void setExamineId(Long examineId) 
    {
        this.examineId = examineId;
    }

    public Long getExamineId() 
    {
        return examineId;
    }
    public void setExamineName(String examineName) 
    {
        this.examineName = examineName;
    }

    public String getExamineName() 
    {
        return examineName;
    }
    public void setExaminePrice(Long examinePrice) 
    {
        this.examinePrice = examinePrice;
    }

    public Long getExaminePrice() 
    {
        return examinePrice;
    }
    public void setExamineType(String examineType) 
    {
        this.examineType = examineType;
    }

    public String getExamineType() 
    {
        return examineType;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("examineId", getExamineId())
            .append("examineName", getExamineName())
            .append("examinePrice", getExaminePrice())
            .append("examineType", getExamineType())
            .toString();
    }
}
