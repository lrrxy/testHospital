package com.ruoyi.nurse.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 护士信息对象 nurse
 * 
 * @author gsq
 * @date 2024-07-07
 */
@Data
public class Nurse extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 护士ID */
    private int nurseId;

    /** 护士名称 */
    @Excel(name = "护士名称")
    private String nurseName;

    /** 年龄 */
    @Excel(name = "年龄")
    private Integer nurseAge;

    /** 性别（0男 1女 2未知） */
    @Excel(name = "性别", readConverterExp = "0=男,1=女,2=未知")
    private String nurseSex;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String nurseStatus;

    /** 生日 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "生日", width = 30, dateFormat = "yyyy-MM-dd")
    private Date nurseBirthday;

    /** 身份证号 */
    @Excel(name = "身份证号")
    private String idCard;

    /** 科室ID */
    @Excel(name = "科室ID")
    private Long departmentId;

    @Excel(name = "护士邮箱")
    private String nurseEmail;

    @Excel(name = "护士职位")
    private String nursePosition;

    @Excel(name = "护士评分")
    private String nurseScore;

    @Excel(name = "护士账号")
    private String nurseZhanghao;

    @Excel(name = "护士密码")
    private String nursePassword;

    @Excel(name = "护士电话")
    private String nursePhone;


}
