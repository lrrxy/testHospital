package com.ruoyi.department.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 科室信息对象 department
 * 
 * @author gsq
 * @date 2024-07-07
 */
public class Department extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 科室ID */
    private Long departmentId;

    /** 科室名称 */
    @Excel(name = "科室名称")
    private String departmentName;

    /** 科室楼层 */
    @Excel(name = "科室楼层")
    private Long departmentNum;

    /** 科室类别 */
    @Excel(name = "科室类别")
    private String departmentCategory;

    public void setDepartmentId(Long departmentId) 
    {
        this.departmentId = departmentId;
    }

    public Long getDepartmentId() 
    {
        return departmentId;
    }
    public void setDepartmentName(String departmentName) 
    {
        this.departmentName = departmentName;
    }

    public String getDepartmentName() 
    {
        return departmentName;
    }
    public void setDepartmentNum(Long departmentNum) 
    {
        this.departmentNum = departmentNum;
    }

    public Long getDepartmentNum() 
    {
        return departmentNum;
    }
    public void setDepartmentCategory(String departmentCategory) 
    {
        this.departmentCategory = departmentCategory;
    }

    public String getDepartmentCategory() 
    {
        return departmentCategory;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("departmentId", getDepartmentId())
            .append("departmentName", getDepartmentName())
            .append("departmentNum", getDepartmentNum())
            .append("departmentCategory", getDepartmentCategory())
            .toString();
    }
}
