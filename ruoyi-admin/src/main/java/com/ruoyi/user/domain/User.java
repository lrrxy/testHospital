package com.ruoyi.user.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import net.sf.jsqlparser.schema.Column;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 病人信息对象 user
 * 
 * @author gsq
 * @date 2024-07-07
 */
@Data
public class User extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 病人编号 */
    private Long userId;

    /** 病人名称 */
    @Excel(name = "病人名称")
    private String userName;

    /** 病人年龄 */
    @Excel(name = "病人年龄")
    private Integer userAge;

    /** 性别（0男 1女 2未知） */
    @Excel(name = "性别", readConverterExp = "0=男,1=女,2=未知")
    private String userSex;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String userStatus;

    /** 生日 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "生日", width = 30, dateFormat = "yyyy-MM-dd")
    private Date userBirthday;

    /** 病人病例 */
    @Excel(name = "病人病例")
    private String userCase;

    /** 病人医嘱 */
    @Excel(name = "病人医嘱")
    private String userOrder;

    /** 医生编号 */
    private Long doctorId;

    /** 护士编号 */
    private Long nurseId;

    /** 病床编号 */
    private Long sickbedId;

    /** 病房编号 */
    private Long wardId;

    /** 身份证号 */
    @Excel(name = "身份证号")
    private String idCard;

    /** 电话号码 */
    @Excel(name = "电话号码")
    private String userPhone;

    /** 订单编号 */
    @Excel(name = "订单编号")
    private Long dingdanId;

    /** 病人账号 */
    @Excel(name = "病人账号")
    private String userZhanghao;

    /** 病人密码 */
    @Excel(name = "病人密码")
    private String userPassword;

}
