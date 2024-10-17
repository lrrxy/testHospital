package com.ruoyi.ward.controller;

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
import com.ruoyi.ward.domain.Ward;
import com.ruoyi.ward.service.IWardService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 病房信息Controller
 * 
 * @author gsq
 * @date 2024-07-07
 */
@RestController
@RequestMapping("/ward/ward")
public class WardController extends BaseController
{
    @Autowired
    private IWardService wardService;

    /**
     * 查询病房信息列表
     */
    @PreAuthorize("@ss.hasPermi('ward:ward:list')")
    @GetMapping("/list")
    public TableDataInfo list(Ward ward)
    {
        startPage();
        List<Ward> list = wardService.selectWardList(ward);
        return getDataTable(list);
    }

    /**
     * 导出病房信息列表
     */
    @PreAuthorize("@ss.hasPermi('ward:ward:export')")
    @Log(title = "病房信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Ward ward)
    {
        List<Ward> list = wardService.selectWardList(ward);
        ExcelUtil<Ward> util = new ExcelUtil<Ward>(Ward.class);
        util.exportExcel(response, list, "病房信息数据");
    }

    /**
     * 获取病房信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('ward:ward:query')")
    @GetMapping(value = "/{wardId}")
    public AjaxResult getInfo(@PathVariable("wardId") Long wardId)
    {
        return success(wardService.selectWardByWardId(wardId));
    }

    /**
     * 新增病房信息
     */
    @PreAuthorize("@ss.hasPermi('ward:ward:add')")
    @Log(title = "病房信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Ward ward)
    {
        return toAjax(wardService.insertWard(ward));
    }

    /**
     * 修改病房信息
     */
    @PreAuthorize("@ss.hasPermi('ward:ward:edit')")
    @Log(title = "病房信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Ward ward)
    {
        return toAjax(wardService.updateWard(ward));
    }

    /**
     * 删除病房信息
     */
    @PreAuthorize("@ss.hasPermi('ward:ward:remove')")
    @Log(title = "病房信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{wardIds}")
    public AjaxResult remove(@PathVariable Long[] wardIds)
    {
        return toAjax(wardService.deleteWardByWardIds(wardIds));
    }
}
