package com.ruoyi.dingdan.controller;

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
import com.ruoyi.dingdan.domain.Dingdan;
import com.ruoyi.dingdan.service.IDingdanService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 订单信息Controller
 * 
 * @author gsq
 * @date 2024-07-07
 */
@RestController
@RequestMapping("/dingdan/dingdan")
public class DingdanController extends BaseController
{
    @Autowired
    private IDingdanService dingdanService;

    /**
     * 查询订单信息列表
     */
    @PreAuthorize("@ss.hasPermi('dingdan:dingdan:list')")
    @GetMapping("/list")
    public TableDataInfo list(Dingdan dingdan)
    {
        startPage();
        List<Dingdan> list = dingdanService.selectDingdanList(dingdan);
        return getDataTable(list);
    }

    /**
     * 导出订单信息列表
     */
    @PreAuthorize("@ss.hasPermi('dingdan:dingdan:export')")
    @Log(title = "订单信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Dingdan dingdan)
    {
        List<Dingdan> list = dingdanService.selectDingdanList(dingdan);
        ExcelUtil<Dingdan> util = new ExcelUtil<Dingdan>(Dingdan.class);
        util.exportExcel(response, list, "订单信息数据");
    }

    /**
     * 获取订单信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('dingdan:dingdan:query')")
    @GetMapping(value = "/{dingdanId}")
    public AjaxResult getInfo(@PathVariable("dingdanId") Long dingdanId)
    {
        return success(dingdanService.selectDingdanByDingdanId(dingdanId));
    }

    /**
     * 新增订单信息
     */
    @PreAuthorize("@ss.hasPermi('dingdan:dingdan:add')")
    @Log(title = "订单信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Dingdan dingdan)
    {
        return toAjax(dingdanService.insertDingdan(dingdan));
    }

    /**
     * 修改订单信息
     */
    @PreAuthorize("@ss.hasPermi('dingdan:dingdan:edit')")
    @Log(title = "订单信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Dingdan dingdan)
    {
        return toAjax(dingdanService.updateDingdan(dingdan));
    }

    /**
     * 删除订单信息
     */
    @PreAuthorize("@ss.hasPermi('dingdan:dingdan:remove')")
    @Log(title = "订单信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{dingdanIds}")
    public AjaxResult remove(@PathVariable Long[] dingdanIds)
    {
        return toAjax(dingdanService.deleteDingdanByDingdanIds(dingdanIds));
    }
}
