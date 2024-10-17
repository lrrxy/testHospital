package com.ruoyi.nurse.domain;

import com.ruoyi.common.annotation.Excel;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Transfer_order_scora {
    @Excel(name = "订单编号")
    private Long orderId;
    @Excel(name = "病人编号")
    private Long userId;
    @Excel(name = "病人姓名")
    private String userName;
    @Excel(name = "所处医院名称")
    private String hospitalName;
    @Excel(name = "拒绝申请转院时间")
    private LocalDateTime transferTime;
    @Excel(name = "转院医院名称")
    private String new_hospitalName;
    @Excel(name = "转院原因")
    private String condition;
    @Excel(name = "拒绝转院申请的原因")
    private String notcondition;
    @Excel(name = "转院状态")
    private int status;
}
