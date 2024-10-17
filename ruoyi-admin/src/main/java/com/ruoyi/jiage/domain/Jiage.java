package com.ruoyi.jiage.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 价格信息对象 jiage
 * 
 * @author gsq
 * @date 2024-07-07
 */
public class Jiage extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 价格ID */
    private Long jiageId;

    /** 总金额 */
    @Excel(name = "总金额")
    private BigDecimal sumMoney;

    /** 药品ID */
    @Excel(name = "药品ID")
    private Long medicineId;

    /** 检查ID */
    @Excel(name = "检查ID")
    private Long examineId;

    /** 治疗ID */
    @Excel(name = "治疗ID")
    private Long treatmentId;

    /** 病床ID */
    @Excel(name = "病床ID")
    private Long sickbedId;

    public void setJiageId(Long jiageId) 
    {
        this.jiageId = jiageId;
    }

    public Long getJiageId() 
    {
        return jiageId;
    }
    public void setSumMoney(BigDecimal sumMoney) 
    {
        this.sumMoney = sumMoney;
    }

    public BigDecimal getSumMoney() 
    {
        return sumMoney;
    }
    public void setMedicineId(Long medicineId) 
    {
        this.medicineId = medicineId;
    }

    public Long getMedicineId() 
    {
        return medicineId;
    }
    public void setExamineId(Long examineId) 
    {
        this.examineId = examineId;
    }

    public Long getExamineId() 
    {
        return examineId;
    }
    public void setTreatmentId(Long treatmentId) 
    {
        this.treatmentId = treatmentId;
    }

    public Long getTreatmentId() 
    {
        return treatmentId;
    }
    public void setSickbedId(Long sickbedId) 
    {
        this.sickbedId = sickbedId;
    }

    public Long getSickbedId() 
    {
        return sickbedId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("jiageId", getJiageId())
            .append("sumMoney", getSumMoney())
            .append("medicineId", getMedicineId())
            .append("examineId", getExamineId())
            .append("treatmentId", getTreatmentId())
            .append("sickbedId", getSickbedId())
            .toString();
    }
}
