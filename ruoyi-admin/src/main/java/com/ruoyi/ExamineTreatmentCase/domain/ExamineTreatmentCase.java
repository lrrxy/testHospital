package com.ruoyi.ExamineTreatmentCase.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 检查或手术订单信息对象 examine_treatment_case
 * 
 * @author kda
 * @date 2024-09-14
 */
@Data
public class ExamineTreatmentCase extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 检查或者手术订单编号 */
    private int examineTreatmentCaseId;

    /** 检查或者手术订单类别（0检查 1手术） */
    @Excel(name = "检查或者手术订单类别", readConverterExp = "0=检查,1=手术")
    private int examineTreatmentCategory;

    /** 医生ID */
    @Excel(name = "医生ID")
    private int doctorId;

    /** 医生姓名 */
    @Excel(name = "医生姓名")
    private String doctorName;

    /** 医生状态（0已满 1未满） */
    @Excel(name = "医生状态", readConverterExp = "0=已满,1=未满")
    private int doctorStatus;

    /** 检查或者手术名称 */
    @Excel(name = "护士ID")
    private int nurseId;

    /** 病人ID */
    @Excel(name = "病人ID")
    private int userId;

    @Excel(name = "病人名称")
    private String userName;

    @Excel(name = "病人性别")
    private String userSex;

    @Excel(name = "病人电话")
    private String userPhone;

    /** 订单状态（0停用 1启用） */
    @Excel(name = "订单状态", readConverterExp = "0=停用,1=启用")
    private int caseStatus;

    /** 检查或者手术日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "检查或者手术日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date examineTreatmentDate;

}
