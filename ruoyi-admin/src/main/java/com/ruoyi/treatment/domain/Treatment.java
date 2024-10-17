package com.ruoyi.treatment.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 治疗信息对象 treatment
 * 
 * @author gsq
 * @date 2024-07-07
 */
public class Treatment extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 治疗ID */
    private Long treatmentId;

    /** 治疗名称 */
    @Excel(name = "治疗名称")
    private String treatmentName;

    /** 治疗价格 */
    @Excel(name = "治疗价格")
    private Long treatmentPrice;

    /** 治疗类型 */
    @Excel(name = "治疗类型")
    private String treatmentType;

    /** 医生ID */
    @Excel(name = "医生ID")
    private Long doctorId;

    public void setTreatmentId(Long treatmentId) 
    {
        this.treatmentId = treatmentId;
    }

    public Long getTreatmentId() 
    {
        return treatmentId;
    }
    public void setTreatmentName(String treatmentName) 
    {
        this.treatmentName = treatmentName;
    }

    public String getTreatmentName() 
    {
        return treatmentName;
    }
    public void setTreatmentPrice(Long treatmentPrice) 
    {
        this.treatmentPrice = treatmentPrice;
    }

    public Long getTreatmentPrice() 
    {
        return treatmentPrice;
    }
    public void setTreatmentType(String treatmentType) 
    {
        this.treatmentType = treatmentType;
    }

    public String getTreatmentType() 
    {
        return treatmentType;
    }
    public void setDoctorId(Long doctorId) 
    {
        this.doctorId = doctorId;
    }

    public Long getDoctorId() 
    {
        return doctorId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("treatmentId", getTreatmentId())
            .append("treatmentName", getTreatmentName())
            .append("treatmentPrice", getTreatmentPrice())
            .append("treatmentType", getTreatmentType())
            .append("doctorId", getDoctorId())
            .toString();
    }
}
