package com.ruoyi.examine.controller;

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
import com.ruoyi.examine.domain.Examine;
import com.ruoyi.examine.service.IExamineService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 检查信息Controller
 * 
 * @author gsq
 * @date 2024-07-07
 */
@RestController
@RequestMapping("/examine/examine")
public class ExamineController extends BaseController
{
    @Autowired
    private IExamineService examineService;

    /**
     * 查询检查信息列表
     */
    @PreAuthorize("@ss.hasPermi('examine:examine:list')")
    @GetMapping("/list")
    public TableDataInfo list(Examine examine)
    {
        startPage();
        List<Examine> list = examineService.selectExamineList(examine);
        return getDataTable(list);
    }

    /**
     * 导出检查信息列表
     */
    @PreAuthorize("@ss.hasPermi('examine:examine:export')")
    @Log(title = "检查信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Examine examine)
    {
        List<Examine> list = examineService.selectExamineList(examine);
        ExcelUtil<Examine> util = new ExcelUtil<Examine>(Examine.class);
        util.exportExcel(response, list, "检查信息数据");
    }

    /**
     * 获取检查信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('examine:examine:query')")
    @GetMapping(value = "/{examineId}")
    public AjaxResult getInfo(@PathVariable("examineId") Long examineId)
    {
        return success(examineService.selectExamineByExamineId(examineId));
    }

    /**
     * 新增检查信息
     */
    @PreAuthorize("@ss.hasPermi('examine:examine:add')")
    @Log(title = "检查信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Examine examine)
    {
        return toAjax(examineService.insertExamine(examine));
    }

    /**
     * 修改检查信息
     */
    @PreAuthorize("@ss.hasPermi('examine:examine:edit')")
    @Log(title = "检查信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Examine examine)
    {
        return toAjax(examineService.updateExamine(examine));
    }

    /**
     * 删除检查信息
     */
    @PreAuthorize("@ss.hasPermi('examine:examine:remove')")
    @Log(title = "检查信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{examineIds}")
    public AjaxResult remove(@PathVariable Long[] examineIds)
    {
        return toAjax(examineService.deleteExamineByExamineIds(examineIds));
    }
}
