package com.ruoyi.sickbed.controller;

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
import com.ruoyi.sickbed.domain.Sickbed;
import com.ruoyi.sickbed.service.ISickbedService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 病床信息Controller
 * 
 * @author gsq
 * @date 2024-07-07
 */
@RestController
@RequestMapping("/sickbed/sickbed")
public class SickbedController extends BaseController
{
    @Autowired
    private ISickbedService sickbedService;

    /**
     * 查询病床信息列表
     */
    @PreAuthorize("@ss.hasPermi('sickbed:sickbed:list')")
    @GetMapping("/list")
    public TableDataInfo list(Sickbed sickbed)
    {
        startPage();
        List<Sickbed> list = sickbedService.selectSickbedList(sickbed);
        return getDataTable(list);
    }

    /**
     * 导出病床信息列表
     */
    @PreAuthorize("@ss.hasPermi('sickbed:sickbed:export')")
    @Log(title = "病床信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Sickbed sickbed)
    {
        List<Sickbed> list = sickbedService.selectSickbedList(sickbed);
        ExcelUtil<Sickbed> util = new ExcelUtil<Sickbed>(Sickbed.class);
        util.exportExcel(response, list, "病床信息数据");
    }

    /**
     * 获取病床信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('sickbed:sickbed:query')")
    @GetMapping(value = "/{sickbedId}")
    public AjaxResult getInfo(@PathVariable("sickbedId") Long sickbedId)
    {
        return success(sickbedService.selectSickbedBySickbedId(sickbedId));
    }

    /**
     * 新增病床信息
     */
    @PreAuthorize("@ss.hasPermi('sickbed:sickbed:add')")
    @Log(title = "病床信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Sickbed sickbed)
    {
        return toAjax(sickbedService.insertSickbed(sickbed));
    }

    /**
     * 修改病床信息
     */
    @PreAuthorize("@ss.hasPermi('sickbed:sickbed:edit')")
    @Log(title = "病床信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Sickbed sickbed)
    {
        return toAjax(sickbedService.updateSickbed(sickbed));
    }

    /**
     * 删除病床信息
     */
    @PreAuthorize("@ss.hasPermi('sickbed:sickbed:remove')")
    @Log(title = "病床信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{sickbedIds}")
    public AjaxResult remove(@PathVariable Long[] sickbedIds)
    {
        return toAjax(sickbedService.deleteSickbedBySickbedIds(sickbedIds));
    }
}
