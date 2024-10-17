package com.ruoyi.payment.controller;

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
import com.ruoyi.payment.domain.PaymentRecord;
import com.ruoyi.payment.service.IPaymentRecordService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 缴费记录信息Controller
 * 
 * @author kda
 * @date 2024-09-03
 */
@RestController
@RequestMapping("/payment/record")
public class PaymentRecordController extends BaseController
{
    @Autowired
    private IPaymentRecordService paymentRecordService;

    /**
     * 查询缴费记录信息列表
     */
    @PreAuthorize("@ss.hasPermi('payment:record:list')")
    @GetMapping("/list")
    public TableDataInfo list(PaymentRecord paymentRecord)
    {
        startPage();
        List<PaymentRecord> list = paymentRecordService.selectPaymentRecordList(paymentRecord);
        return getDataTable(list);
    }

    /**
     * 导出缴费记录信息列表
     */
    @PreAuthorize("@ss.hasPermi('payment:record:export')")
    @Log(title = "缴费记录信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PaymentRecord paymentRecord)
    {
        List<PaymentRecord> list = paymentRecordService.selectPaymentRecordList(paymentRecord);
        ExcelUtil<PaymentRecord> util = new ExcelUtil<PaymentRecord>(PaymentRecord.class);
        util.exportExcel(response, list, "缴费记录信息数据");
    }

    /**
     * 获取缴费记录信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('payment:record:query')")
    @GetMapping(value = "/{recordId}")
    public AjaxResult getInfo(@PathVariable("recordId") Long recordId)
    {
        return success(paymentRecordService.selectPaymentRecordByRecordId(recordId));
    }

    /**
     * 新增缴费记录信息
     */
    @PreAuthorize("@ss.hasPermi('payment:record:add')")
    @Log(title = "缴费记录信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PaymentRecord paymentRecord)
    {
        return toAjax(paymentRecordService.insertPaymentRecord(paymentRecord));
    }

    /**
     * 修改缴费记录信息
     */
    @PreAuthorize("@ss.hasPermi('payment:record:edit')")
    @Log(title = "缴费记录信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PaymentRecord paymentRecord)
    {
        return toAjax(paymentRecordService.updatePaymentRecord(paymentRecord));
    }

    /**
     * 删除缴费记录信息
     */
    @PreAuthorize("@ss.hasPermi('payment:record:remove')")
    @Log(title = "缴费记录信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{recordIds}")
    public AjaxResult remove(@PathVariable Long[] recordIds)
    {
        return toAjax(paymentRecordService.deletePaymentRecordByRecordIds(recordIds));
    }
}
