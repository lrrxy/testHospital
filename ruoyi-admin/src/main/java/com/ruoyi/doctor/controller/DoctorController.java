package com.ruoyi.doctor.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.doctor.domain.Doctor;
import com.ruoyi.doctor.service.IDoctorService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 医生信息Controller
 * 
 * @author gsq
 * @date 2024-07-07
 */
@RestController
@RequestMapping("/doctor/doctor")
public class DoctorController extends BaseController
{
    @Autowired
    private IDoctorService doctorService;

    /**
     * 查询医生信息列表
     */
    @PreAuthorize("@ss.hasPermi('doctor:doctor:list')")
    @GetMapping("/list")
    public TableDataInfo list(Doctor doctor)
    {
        startPage();
        List<Doctor> list = doctorService.selectDoctorList(doctor);
        return getDataTable(list);
    }

    /**
     * 导出医生信息列表
     */
    @PreAuthorize("@ss.hasPermi('doctor:doctor:export')")
    @Log(title = "医生信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Doctor doctor)
    {
        List<Doctor> list = doctorService.selectDoctorList(doctor);
        ExcelUtil<Doctor> util = new ExcelUtil<Doctor>(Doctor.class);
        util.exportExcel(response, list, "医生信息数据");
    }

    /**
     * 获取医生信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('doctor:doctor:query')")
    @GetMapping(value = "/{doctorId}")
    public AjaxResult getInfo(@PathVariable("doctorId") Long doctorId)
    {
        return success(doctorService.selectDoctorByDoctorId(doctorId));
    }

    /**
     * 新增医生信息
     */
    @PreAuthorize("@ss.hasPermi('doctor:doctor:add')")
    @Log(title = "医生信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Doctor doctor)
    {
        return toAjax(doctorService.insertDoctor(doctor));
    }

    /**
     * 修改医生信息
     */
    @PreAuthorize("@ss.hasPermi('doctor:doctor:edit')")
    @Log(title = "医生信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Doctor doctor)
    {
        return toAjax(doctorService.updateDoctor(doctor));
    }

    /**
     * 删除医生信息
     */
    @PreAuthorize("@ss.hasPermi('doctor:doctor:remove')")
    @Log(title = "医生信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{doctorIds}")
    public AjaxResult remove(@PathVariable Long[] doctorIds)
    {
        return toAjax(doctorService.deleteDoctorByDoctorIds(doctorIds));
    }
}
