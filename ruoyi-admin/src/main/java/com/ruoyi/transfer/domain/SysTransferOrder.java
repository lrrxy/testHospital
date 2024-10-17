package com.ruoyi.transfer.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 转院订单信息对象 sys_transfer_order
 * 
 * @author kda
 * @date 2024-08-27
 */
public class SysTransferOrder extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 转院订单ID */
    private Long transferOrderId;

    /** 病人ID */
    @Excel(name = "病人ID")
    private Long userId;

    /** 所在医院ID */
    @Excel(name = "所在医院ID")
    private Long hospitalId;

    /** 欲转医院ID */
    @Excel(name = "欲转医院ID")
    private Long newHospitalId;

    /** 订单创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "订单创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date transferOrderTime;

    /** 转院原因 */
    @Excel(name = "转院原因")
    private String transferOrderCondition;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private Long orderStatus;

    public void setTransferOrderId(Long transferOrderId) 
    {
        this.transferOrderId = transferOrderId;
    }

    public Long getTransferOrderId() 
    {
        return transferOrderId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setHospitalId(Long hospitalId) 
    {
        this.hospitalId = hospitalId;
    }

    public Long getHospitalId() 
    {
        return hospitalId;
    }
    public void setNewHospitalId(Long newHospitalId) 
    {
        this.newHospitalId = newHospitalId;
    }

    public Long getNewHospitalId() 
    {
        return newHospitalId;
    }
    public void setTransferOrderTime(Date transferOrderTime) 
    {
        this.transferOrderTime = transferOrderTime;
    }

    public Date getTransferOrderTime() 
    {
        return transferOrderTime;
    }
    public void setTransferOrderCondition(String transferOrderCondition) 
    {
        this.transferOrderCondition = transferOrderCondition;
    }

    public String getTransferOrderCondition() 
    {
        return transferOrderCondition;
    }
    public void setOrderStatus(Long orderStatus) 
    {
        this.orderStatus = orderStatus;
    }

    public Long getOrderStatus() 
    {
        return orderStatus;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("transferOrderId", getTransferOrderId())
            .append("userId", getUserId())
            .append("hospitalId", getHospitalId())
            .append("newHospitalId", getNewHospitalId())
            .append("transferOrderTime", getTransferOrderTime())
            .append("transferOrderCondition", getTransferOrderCondition())
            .append("orderStatus", getOrderStatus())
            .toString();
    }
}
