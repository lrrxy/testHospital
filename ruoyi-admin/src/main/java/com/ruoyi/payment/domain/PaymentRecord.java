package com.ruoyi.payment.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 缴费记录信息对象 payment_record
 * 
 * @author kda
 * @date 2024-09-03
 */
@Data
public class PaymentRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 订单ID */
    private Long recordId;

    /** 病人ID */
    @Excel(name = "病人ID")
    private Long userId;

    /** 病人名称 */
    @Excel(name = "病人名称")
    private String userName;

    /** 项目名称 */
    @Excel(name = "项目名称")
    private Integer projectName;

    /** 支付方式（1微信 0支付宝） */
    @Excel(name = "支付方式", readConverterExp = "1=微信,0=支付宝")
    private Integer paymentMethod;

    /** 金额 */
    @Excel(name = "项目金额")
    private Long sum;

    /** 支付状态（0待支付 1已支付） */
    @Excel(name = "支付状态", readConverterExp = "0=待支付,1=已支付")
    private Integer status;

    /** 缴费日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "缴费日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date paymentDate;
}
