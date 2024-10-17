package com.ruoyi.user.domain;


import com.ruoyi.common.annotation.Excel;
import lombok.Data;

@Data
public class Hospital {

    @Excel(name = "病人床号")
    private int userId;
    @Excel(name = "医院ID")
    private int hospitalId;
    @Excel(name = "医院名称")
    private String hospitalName;
    @Excel(name = "医院地址")
    private String hospitalDizhi;
    @Excel(name = "医院状态 1正常 0异常")
    private int status;
}
