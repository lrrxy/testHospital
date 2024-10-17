package com.ruoyi.department.mapper;

import java.util.List;
import com.ruoyi.department.domain.Department;
import org.apache.ibatis.annotations.Mapper;

/**
 * 科室信息Mapper接口
 * 
 * @author gsq
 * @date 2024-07-07
 */
@Mapper
public interface DepartmentMapper 
{
    /**
     * 查询科室信息
     * 
     * @param departmentId 科室信息主键
     * @return 科室信息
     */
    public Department selectDepartmentByDepartmentId(Long departmentId);

    /**
     * 查询科室信息列表
     * 
     * @param department 科室信息
     * @return 科室信息集合
     */
    public List<Department> selectDepartmentList(Department department);

    /**
     * 新增科室信息
     * 
     * @param department 科室信息
     * @return 结果
     */
    public int insertDepartment(Department department);

    /**
     * 修改科室信息
     * 
     * @param department 科室信息
     * @return 结果
     */
    public int updateDepartment(Department department);

    /**
     * 删除科室信息
     * 
     * @param departmentId 科室信息主键
     * @return 结果
     */
    public int deleteDepartmentByDepartmentId(Long departmentId);

    /**
     * 批量删除科室信息
     * 
     * @param departmentIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDepartmentByDepartmentIds(Long[] departmentIds);
}
