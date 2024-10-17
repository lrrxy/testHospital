package com.ruoyi.jiage.controller;

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
import com.ruoyi.jiage.domain.Jiage;
import com.ruoyi.jiage.service.IJiageService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 价格信息Controller
 * 
 * @author gsq
 * @date 2024-07-07
 */
@RestController
@RequestMapping("/jiage/jiage")
public class JiageController extends BaseController
{
    @Autowired
    private IJiageService jiageService;

    /**
     * 查询价格信息列表
     */
    @PreAuthorize("@ss.hasPermi('jiage:jiage:list')")
    @GetMapping("/list")
    public TableDataInfo list(Jiage jiage)
    {
        startPage();
        List<Jiage> list = jiageService.selectJiageList(jiage);
        return getDataTable(list);
    }

    /**
     * 导出价格信息列表
     */
    @PreAuthorize("@ss.hasPermi('jiage:jiage:export')")
    @Log(title = "价格信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Jiage jiage)
    {
        List<Jiage> list = jiageService.selectJiageList(jiage);
        ExcelUtil<Jiage> util = new ExcelUtil<Jiage>(Jiage.class);
        util.exportExcel(response, list, "价格信息数据");
    }

    /**
     * 获取价格信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('jiage:jiage:query')")
    @GetMapping(value = "/{jiageId}")
    public AjaxResult getInfo(@PathVariable("jiageId") Long jiageId)
    {
        return success(jiageService.selectJiageByJiageId(jiageId));
    }

    /**
     * 新增价格信息
     */
    @PreAuthorize("@ss.hasPermi('jiage:jiage:add')")
    @Log(title = "价格信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Jiage jiage)
    {
        return toAjax(jiageService.insertJiage(jiage));
    }

    /**
     * 修改价格信息
     */
    @PreAuthorize("@ss.hasPermi('jiage:jiage:edit')")
    @Log(title = "价格信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Jiage jiage)
    {
        return toAjax(jiageService.updateJiage(jiage));
    }

    /**
     * 删除价格信息
     */
    @PreAuthorize("@ss.hasPermi('jiage:jiage:remove')")
    @Log(title = "价格信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{jiageIds}")
    public AjaxResult remove(@PathVariable Long[] jiageIds)
    {
        return toAjax(jiageService.deleteJiageByJiageIds(jiageIds));
    }
}
