package com.ruoyi.medicine.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 药品信息对象 medicine
 * 
 * @author gsq
 * @date 2024-07-07
 */
@Data
public class Medicine extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 药品ID */
    private Long medicineId;

    /** 药品名称 */
    @Excel(name = "药品名称")
    private String medicineName;

    /** 药品价格 */
    @Excel(name = "药品价格")
    private Long medicinePrice;

    /** 药品生产日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "药品生产日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date medicineDatetime;

    /** 药品数量 */
    @Excel(name = "药品数量")
    private Long medicineCount;

    /** 药品类型 */
    @Excel(name = "药品单位")
    private String medicineType;

    /** 药品保质期 */
    @Excel(name = "药品保质期")
    private Long medicineNum;

    /** 药品用途 */
    @Excel(name = "药品用途")
    private String medicinePurpose;


}
