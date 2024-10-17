package com.ruoyi.caseCC.controller;

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
import com.ruoyi.caseCC.domain.BingliCase;
import com.ruoyi.caseCC.service.IBingliCaseService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 病例订单信息Controller
 * 
 * @author kda
 * @date 2024-09-12
 */
@RestController
@RequestMapping("/case/case")
public class BingliCaseController extends BaseController
{
    @Autowired
    private IBingliCaseService bingliCaseService;

    /**
     * 查询病例订单信息列表
     */
    @PreAuthorize("@ss.hasPermi('case:case:list')")
    @GetMapping("/list")
    public TableDataInfo list(BingliCase bingliCase)
    {
        startPage();
        List<BingliCase> list = bingliCaseService.selectBingliCaseList(bingliCase);
        return getDataTable(list);
    }

    /**
     * 导出病例订单信息列表
     */
    @PreAuthorize("@ss.hasPermi('case:case:export')")
    @Log(title = "病例订单信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BingliCase bingliCase)
    {
        List<BingliCase> list = bingliCaseService.selectBingliCaseList(bingliCase);
        ExcelUtil<BingliCase> util = new ExcelUtil<BingliCase>(BingliCase.class);
        util.exportExcel(response, list, "病例订单信息数据");
    }

    /**
     * 获取病例订单信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('case:case:query')")
    @GetMapping(value = "/{bingliCaseId}")
    public AjaxResult getInfo(@PathVariable("bingliCaseId") Long bingliCaseId)
    {
        return success(bingliCaseService.selectBingliCaseByBingliCaseId(bingliCaseId));
    }

    /**
     * 新增病例订单信息
     */
    @PreAuthorize("@ss.hasPermi('case:case:add')")
    @Log(title = "病例订单信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BingliCase bingliCase)
    {
        return toAjax(bingliCaseService.insertBingliCase(bingliCase));
    }

    /**
     * 修改病例订单信息
     */
    @PreAuthorize("@ss.hasPermi('case:case:edit')")
    @Log(title = "病例订单信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BingliCase bingliCase)
    {
        return toAjax(bingliCaseService.updateBingliCase(bingliCase));
    }

    /**
     * 删除病例订单信息
     */
    @PreAuthorize("@ss.hasPermi('case:case:remove')")
    @Log(title = "病例订单信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{bingliCaseIds}")
    public AjaxResult remove(@PathVariable Long[] bingliCaseIds)
    {
        return toAjax(bingliCaseService.deleteBingliCaseByBingliCaseIds(bingliCaseIds));
    }
}
