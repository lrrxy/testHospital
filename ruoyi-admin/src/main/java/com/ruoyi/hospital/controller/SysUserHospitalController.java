package com.ruoyi.hospital.controller;

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
import com.ruoyi.hospital.domain.SysUserHospital;
import com.ruoyi.hospital.service.ISysUserHospitalService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 病人所处医院信息Controller
 * 
 * @author kda
 * @date 2024-08-27
 */
@RestController
@RequestMapping("/hospital/hospital")
public class SysUserHospitalController extends BaseController
{
    @Autowired
    private ISysUserHospitalService sysUserHospitalService;

    /**
     * 查询病人所处医院信息列表
     */
    @PreAuthorize("@ss.hasPermi('hospital:hospital:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysUserHospital sysUserHospital)
    {
        startPage();
        List<SysUserHospital> list = sysUserHospitalService.selectSysUserHospitalList(sysUserHospital);
        return getDataTable(list);
    }

    /**
     * 导出病人所处医院信息列表
     */
    @PreAuthorize("@ss.hasPermi('hospital:hospital:export')")
    @Log(title = "病人所处医院信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysUserHospital sysUserHospital)
    {
        List<SysUserHospital> list = sysUserHospitalService.selectSysUserHospitalList(sysUserHospital);
        ExcelUtil<SysUserHospital> util = new ExcelUtil<SysUserHospital>(SysUserHospital.class);
        util.exportExcel(response, list, "病人所处医院信息数据");
    }

    /**
     * 获取病人所处医院信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('hospital:hospital:query')")
    @GetMapping(value = "/{userId}")
    public AjaxResult getInfo(@PathVariable("userId") Long userId)
    {
        return success(sysUserHospitalService.selectSysUserHospitalByUserId(userId));
    }

    /**
     * 新增病人所处医院信息
     */
    @PreAuthorize("@ss.hasPermi('hospital:hospital:add')")
    @Log(title = "病人所处医院信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysUserHospital sysUserHospital)
    {
        return toAjax(sysUserHospitalService.insertSysUserHospital(sysUserHospital));
    }

    /**
     * 修改病人所处医院信息
     */
    @PreAuthorize("@ss.hasPermi('hospital:hospital:edit')")
    @Log(title = "病人所处医院信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysUserHospital sysUserHospital)
    {
        return toAjax(sysUserHospitalService.updateSysUserHospital(sysUserHospital));
    }

    /**
     * 删除病人所处医院信息
     */
    @PreAuthorize("@ss.hasPermi('hospital:hospital:remove')")
    @Log(title = "病人所处医院信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{userIds}")
    public AjaxResult remove(@PathVariable Long[] userIds)
    {
        return toAjax(sysUserHospitalService.deleteSysUserHospitalByUserIds(userIds));
    }
}
