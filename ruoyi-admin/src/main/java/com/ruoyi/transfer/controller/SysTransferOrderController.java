package com.ruoyi.transfer.controller;

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
import com.ruoyi.transfer.domain.SysTransferOrder;
import com.ruoyi.transfer.service.ISysTransferOrderService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 转院订单信息Controller
 * 
 * @author kda
 * @date 2024-08-27
 */
@RestController
@RequestMapping("/transfer/order")
public class SysTransferOrderController extends BaseController
{
    @Autowired
    private ISysTransferOrderService sysTransferOrderService;

    /**
     * 查询转院订单信息列表
     */
    @PreAuthorize("@ss.hasPermi('transfer:order:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysTransferOrder sysTransferOrder)
    {
        startPage();
        List<SysTransferOrder> list = sysTransferOrderService.selectSysTransferOrderList(sysTransferOrder);
        return getDataTable(list);
    }

    /**
     * 导出转院订单信息列表
     */
    @PreAuthorize("@ss.hasPermi('transfer:order:export')")
    @Log(title = "转院订单信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysTransferOrder sysTransferOrder)
    {
        List<SysTransferOrder> list = sysTransferOrderService.selectSysTransferOrderList(sysTransferOrder);
        ExcelUtil<SysTransferOrder> util = new ExcelUtil<SysTransferOrder>(SysTransferOrder.class);
        util.exportExcel(response, list, "转院订单信息数据");
    }

    /**
     * 获取转院订单信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('transfer:order:query')")
    @GetMapping(value = "/{transferOrderId}")
    public AjaxResult getInfo(@PathVariable("transferOrderId") Long transferOrderId)
    {
        return success(sysTransferOrderService.selectSysTransferOrderByTransferOrderId(transferOrderId));
    }

    /**
     * 新增转院订单信息
     */
    @PreAuthorize("@ss.hasPermi('transfer:order:add')")
    @Log(title = "转院订单信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysTransferOrder sysTransferOrder)
    {
        return toAjax(sysTransferOrderService.insertSysTransferOrder(sysTransferOrder));
    }

    /**
     * 修改转院订单信息
     */
    @PreAuthorize("@ss.hasPermi('transfer:order:edit')")
    @Log(title = "转院订单信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysTransferOrder sysTransferOrder)
    {
        return toAjax(sysTransferOrderService.updateSysTransferOrder(sysTransferOrder));
    }

    /**
     * 删除转院订单信息
     */
    @PreAuthorize("@ss.hasPermi('transfer:order:remove')")
    @Log(title = "转院订单信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{transferOrderIds}")
    public AjaxResult remove(@PathVariable Long[] transferOrderIds)
    {
        return toAjax(sysTransferOrderService.deleteSysTransferOrderByTransferOrderIds(transferOrderIds));
    }
}
