package com.ruoyi.caseCC.domain;

import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 病例订单信息对象 bingli_case
 * 
 * @author kda
 * @date 2024-09-12
 */
@Data
public class BingliCase extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 病例订单编号 */
    private int bingliCaseId;

    /** 病人编号 */
    @Excel(name = "病人编号")
    private int userId;

    /** 病床编号 */
    @Excel(name = "病床编号")
    private int sickbedId;

    /** 病人姓名 */
    @Excel(name = "病人姓名")
    private String userName;

    /** 病例名称 */
    @Excel(name = "病例名称")
    private String caseName;

    /** 药品名称 */
    @Excel(name = "药品名称")
    private String medicineName;

    /** 医嘱名称 */
    @Excel(name = "医嘱名称")
    private String orderName;

    /** 药品ID */
    @Excel(name = "药品Id")
    private int medicineId;



    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private Integer caseStatus;

    /** 医生编号 */
    @Excel(name = "医生编号")
    private int doctorId;

    /** 医生名称 */
    @Excel(name = "医生名称")
    private String doctorName;

}
