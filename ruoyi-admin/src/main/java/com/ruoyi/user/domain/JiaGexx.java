package com.ruoyi.user.domain;

import com.ruoyi.common.annotation.Excel;
import lombok.Data;

@Data
public class JiaGexx {


    @Excel(name = "病床ID")
    private int userId;

    @Excel(name = "药品价格ID")
    private int medicinePriceId;

    @Excel(name = "检查价格ID")
    private int examinePriceId;

    @Excel(name = "治疗价格ID")
    private int treatmentPriceId;


    @Excel(name = "病人名称")
    private String userName;

    @Excel(name = "药品价格")
    private int medicinePrice;

    @Excel(name = "治疗价格")
    private int treatmentPrice;

    @Excel(name = "检查价格")
    private int examinePrice;

    @Excel(name = "病床价格")
    private int userPrice;

    @Excel(name = "合计")
    private int sumPrice;
}
