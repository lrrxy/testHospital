package com.ruoyi.department.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.department.mapper.DepartmentMapper;
import com.ruoyi.department.domain.Department;
import com.ruoyi.department.service.IDepartmentService;

/**
 * 科室信息Service业务层处理
 * 
 * @author gsq
 * @date 2024-07-07
 */
@Service
public class DepartmentServiceImpl implements IDepartmentService 
{
    @Autowired
    private DepartmentMapper departmentMapper;

    /**
     * 查询科室信息
     * 
     * @param departmentId 科室信息主键
     * @return 科室信息
     */
    @Override
    public Department selectDepartmentByDepartmentId(Long departmentId)
    {
        return departmentMapper.selectDepartmentByDepartmentId(departmentId);
    }

    /**
     * 查询科室信息列表
     * 
     * @param department 科室信息
     * @return 科室信息
     */
    @Override
    public List<Department> selectDepartmentList(Department department)
    {
        return departmentMapper.selectDepartmentList(department);
    }

    /**
     * 新增科室信息
     * 
     * @param department 科室信息
     * @return 结果
     */
    @Override
    public int insertDepartment(Department department)
    {
        return departmentMapper.insertDepartment(department);
    }

    /**
     * 修改科室信息
     * 
     * @param department 科室信息
     * @return 结果
     */
    @Override
    public int updateDepartment(Department department)
    {
        return departmentMapper.updateDepartment(department);
    }

    /**
     * 批量删除科室信息
     * 
     * @param departmentIds 需要删除的科室信息主键
     * @return 结果
     */
    @Override
    public int deleteDepartmentByDepartmentIds(Long[] departmentIds)
    {
        return departmentMapper.deleteDepartmentByDepartmentIds(departmentIds);
    }

    /**
     * 删除科室信息信息
     * 
     * @param departmentId 科室信息主键
     * @return 结果
     */
    @Override
    public int deleteDepartmentByDepartmentId(Long departmentId)
    {
        return departmentMapper.deleteDepartmentByDepartmentId(departmentId);
    }
}
