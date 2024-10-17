package com.ruoyi.nurse.controller;

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
import com.ruoyi.nurse.domain.Nurse;
import com.ruoyi.nurse.service.INurseService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 护士信息Controller
 * 
 * @author gsq
 * @date 2024-07-07
 */
@RestController
@RequestMapping("/nurse/nurse")
public class NurseController extends BaseController
{
    @Autowired
    private INurseService nurseService;

    /**
     * 查询护士信息列表
     */
    @PreAuthorize("@ss.hasPermi('nurse:nurse:list')")
    @GetMapping("/list")
    public TableDataInfo list(Nurse nurse)
    {
        startPage();
        List<Nurse> list = nurseService.selectNurseList(nurse);
        return getDataTable(list);
    }

    /**
     * 导出护士信息列表
     */
    @PreAuthorize("@ss.hasPermi('nurse:nurse:export')")
    @Log(title = "护士信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Nurse nurse)
    {
        List<Nurse> list = nurseService.selectNurseList(nurse);
        ExcelUtil<Nurse> util = new ExcelUtil<Nurse>(Nurse.class);
        util.exportExcel(response, list, "护士信息数据");
    }

    /**
     * 获取护士信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('nurse:nurse:query')")
    @GetMapping(value = "/{nurseId}")
    public AjaxResult getInfo(@PathVariable("nurseId") Long nurseId)
    {
        return success(nurseService.selectNurseByNurseId(nurseId));
    }

    /**
     * 新增护士信息
     */
    @PreAuthorize("@ss.hasPermi('nurse:nurse:add')")
    @Log(title = "护士信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Nurse nurse)
    {
        return toAjax(nurseService.insertNurse(nurse));
    }

    /**
     * 修改护士信息
     */
    @PreAuthorize("@ss.hasPermi('nurse:nurse:edit')")
    @Log(title = "护士信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Nurse nurse)
    {
        return toAjax(nurseService.updateNurse(nurse));
    }

    /**
     * 删除护士信息
     */
    @PreAuthorize("@ss.hasPermi('nurse:nurse:remove')")
    @Log(title = "护士信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{nurseIds}")
    public AjaxResult remove(@PathVariable Long[] nurseIds)
    {
        return toAjax(nurseService.deleteNurseByNurseIds(nurseIds));
    }
}
