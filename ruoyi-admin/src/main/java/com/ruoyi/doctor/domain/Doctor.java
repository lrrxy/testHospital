package com.ruoyi.doctor.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 医生信息对象 doctor
 * 
 * @author gsq
 * @date 2024-07-07
 */
@Data
public class Doctor extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 医生ID */
    private int doctorId;

    /** 医生名称 */
    @Excel(name = "医生名称")
    private String doctorName;

    /** 年龄 */
    @Excel(name = "年龄")
    private int doctorAge;

    /** 性别（0男 1女 2未知） */
    @Excel(name = "性别", readConverterExp = "0=男,1=女,2=未知")
    private char doctorSex;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private int doctorStatus;

    /** 生日 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "生日", width = 30, dateFormat = "yyyy-MM-dd")
    private Date doctorBirthday;

    /** 身份证号 */
    @Excel(name = "身份证号")
    private String idCard;

    /** 科室ID */
    @Excel(name = "科室ID")
    private Long departmentId;

    @Excel(name = "科室名称")
    private String departmentName;

    @Excel(name = "医生手机号")
    private String doctorPhone;

    @Excel(name = "医生账号")
    private String doctorZhanghao;

    @Excel(name = "医生密码")
    private String doctorPassword;

    @Excel(name = "医生邮箱")
    private String doctorEmail;

    @Excel(name = "医生职位")
    private String doctorPosition;

    @Excel(name = "医生评分")
    private int doctorScore;



}
