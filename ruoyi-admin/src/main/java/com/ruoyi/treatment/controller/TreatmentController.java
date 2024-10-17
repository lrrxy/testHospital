package com.ruoyi.treatment.controller;

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
import com.ruoyi.treatment.domain.Treatment;
import com.ruoyi.treatment.service.ITreatmentService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 治疗信息Controller
 * 
 * @author gsq
 * @date 2024-07-07
 */
@RestController
@RequestMapping("/treatment/treatment")
public class TreatmentController extends BaseController
{
    @Autowired
    private ITreatmentService treatmentService;

    /**
     * 查询治疗信息列表
     */
    @PreAuthorize("@ss.hasPermi('treatment:treatment:list')")
    @GetMapping("/list")
    public TableDataInfo list(Treatment treatment)
    {
        startPage();
        List<Treatment> list = treatmentService.selectTreatmentList(treatment);
        return getDataTable(list);
    }

    /**
     * 导出治疗信息列表
     */
    @PreAuthorize("@ss.hasPermi('treatment:treatment:export')")
    @Log(title = "治疗信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Treatment treatment)
    {
        List<Treatment> list = treatmentService.selectTreatmentList(treatment);
        ExcelUtil<Treatment> util = new ExcelUtil<Treatment>(Treatment.class);
        util.exportExcel(response, list, "治疗信息数据");
    }

    /**
     * 获取治疗信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('treatment:treatment:query')")
    @GetMapping(value = "/{treatmentId}")
    public AjaxResult getInfo(@PathVariable("treatmentId") Long treatmentId)
    {
        return success(treatmentService.selectTreatmentByTreatmentId(treatmentId));
    }

    /**
     * 新增治疗信息
     */
    @PreAuthorize("@ss.hasPermi('treatment:treatment:add')")
    @Log(title = "治疗信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Treatment treatment)
    {
        return toAjax(treatmentService.insertTreatment(treatment));
    }

    /**
     * 修改治疗信息
     */
    @PreAuthorize("@ss.hasPermi('treatment:treatment:edit')")
    @Log(title = "治疗信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Treatment treatment)
    {
        return toAjax(treatmentService.updateTreatment(treatment));
    }

    /**
     * 删除治疗信息
     */
    @PreAuthorize("@ss.hasPermi('treatment:treatment:remove')")
    @Log(title = "治疗信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{treatmentIds}")
    public AjaxResult remove(@PathVariable Long[] treatmentIds)
    {
        return toAjax(treatmentService.deleteTreatmentByTreatmentIds(treatmentIds));
    }
}
