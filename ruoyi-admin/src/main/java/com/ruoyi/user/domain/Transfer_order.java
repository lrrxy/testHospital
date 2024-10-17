package com.ruoyi.user.domain;


import com.ruoyi.common.annotation.Excel;
import lombok.Data;
import net.sf.jsqlparser.expression.DateTimeLiteralExpression;

import java.time.LocalDateTime;

//转院订单对象
@Data
public class Transfer_order {

    @Excel(name = "订单编号")
    private Long orderId;
    @Excel(name = "病人编号")
    private int userId;
    @Excel(name = "病人姓名")
    private String userName;
    @Excel(name = "所处医院名称")
    private String hospitalName;
    @Excel(name = "转院时间")
    private LocalDateTime transferTime;
    @Excel(name = "转院医院名称")
    private String new_hospitalName;
    @Excel(name = "转院原因")
    private String condition;
    @Excel(name = "转院状态")
    private int status;
}
