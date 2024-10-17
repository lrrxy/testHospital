package com.ruoyi.ExamineTreatmentCase.controller;

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
import com.ruoyi.ExamineTreatmentCase.domain.ExamineTreatmentCase;
import com.ruoyi.ExamineTreatmentCase.service.IExamineTreatmentCaseService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 检查或手术订单信息Controller
 * 
 * @author kda
 * @date 2024-09-14
 */
@RestController
@RequestMapping("/ExamineTreatmentCase/ExamineTreatmentCase")
public class ExamineTreatmentCaseController extends BaseController
{
    @Autowired
    private IExamineTreatmentCaseService examineTreatmentCaseService;

    /**
     * 查询检查或手术订单信息列表
     */
    @PreAuthorize("@ss.hasPermi('ExamineTreatmentCase:ExamineTreatmentCase:list')")
    @GetMapping("/list")
    public TableDataInfo list(ExamineTreatmentCase examineTreatmentCase)
    {
        startPage();
        List<ExamineTreatmentCase> list = examineTreatmentCaseService.selectExamineTreatmentCaseList(examineTreatmentCase);
        return getDataTable(list);
    }

    /**
     * 导出检查或手术订单信息列表
     */
    @PreAuthorize("@ss.hasPermi('ExamineTreatmentCase:ExamineTreatmentCase:export')")
    @Log(title = "检查或手术订单信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ExamineTreatmentCase examineTreatmentCase)
    {
        List<ExamineTreatmentCase> list = examineTreatmentCaseService.selectExamineTreatmentCaseList(examineTreatmentCase);
        ExcelUtil<ExamineTreatmentCase> util = new ExcelUtil<ExamineTreatmentCase>(ExamineTreatmentCase.class);
        util.exportExcel(response, list, "检查或手术订单信息数据");
    }

    /**
     * 获取检查或手术订单信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('ExamineTreatmentCase:ExamineTreatmentCase:query')")
    @GetMapping(value = "/{examineTreatmentCaseId}")
    public AjaxResult getInfo(@PathVariable("examineTreatmentCaseId") Long examineTreatmentCaseId)
    {
        return success(examineTreatmentCaseService.selectExamineTreatmentCaseByExamineTreatmentCaseId(examineTreatmentCaseId));
    }

    /**
     * 新增检查或手术订单信息
     */
    @PreAuthorize("@ss.hasPermi('ExamineTreatmentCase:ExamineTreatmentCase:add')")
    @Log(title = "检查或手术订单信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExamineTreatmentCase examineTreatmentCase)
    {
        return toAjax(examineTreatmentCaseService.insertExamineTreatmentCase(examineTreatmentCase));
    }

    /**
     * 修改检查或手术订单信息
     */
    @PreAuthorize("@ss.hasPermi('ExamineTreatmentCase:ExamineTreatmentCase:edit')")
    @Log(title = "检查或手术订单信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ExamineTreatmentCase examineTreatmentCase)
    {
        return toAjax(examineTreatmentCaseService.updateExamineTreatmentCase(examineTreatmentCase));
    }

    /**
     * 删除检查或手术订单信息
     */
    @PreAuthorize("@ss.hasPermi('ExamineTreatmentCase:ExamineTreatmentCase:remove')")
    @Log(title = "检查或手术订单信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{examineTreatmentCaseIds}")
    public AjaxResult remove(@PathVariable Long[] examineTreatmentCaseIds)
    {
        return toAjax(examineTreatmentCaseService.deleteExamineTreatmentCaseByExamineTreatmentCaseIds(examineTreatmentCaseIds));
    }
}
