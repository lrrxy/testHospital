package com.ruoyi.caseCC.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.caseCC.mapper.BingliCaseMapper;
import com.ruoyi.caseCC.domain.BingliCase;
import com.ruoyi.caseCC.service.IBingliCaseService;

/**
 * 病例订单信息Service业务层处理
 * 
 * @author kda
 * @date 2024-09-12
 */
@Service
public class BingliCaseServiceImpl implements IBingliCaseService 
{
    @Autowired
    private BingliCaseMapper bingliCaseMapper;
    /**
     * 查询病例订单信息
     * 
     * @param bingliCaseId 病例订单信息主键
     * @return 病例订单信息
     */
    @Override
    public BingliCase selectBingliCaseByBingliCaseId(Long bingliCaseId)
    {
        return bingliCaseMapper.selectBingliCaseByBingliCaseId(bingliCaseId);
    }

    /**
     * 查询病例订单信息列表
     * 
     * @param bingliCase 病例订单信息
     * @return 病例订单信息
     */
    @Override
    public List<BingliCase> selectBingliCaseList(BingliCase bingliCase)
    {
        return bingliCaseMapper.selectBingliCaseList(bingliCase);
    }

    /**
     * 新增病例订单信息
     * 
     * @param bingliCase 病例订单信息
     * @return 结果
     */
    @Override
    public int insertBingliCase(BingliCase bingliCase)
    {
        return bingliCaseMapper.insertBingliCase(bingliCase);
    }

    /**
     * 修改病例订单信息
     * 
     * @param bingliCase 病例订单信息
     * @return 结果
     */
    @Override
    public int updateBingliCase(BingliCase bingliCase)
    {
        return bingliCaseMapper.updateBingliCase(bingliCase);
    }

    /**
     * 批量删除病例订单信息
     * 
     * @param bingliCaseIds 需要删除的病例订单信息主键
     * @return 结果
     */
    @Override
    public int deleteBingliCaseByBingliCaseIds(Long[] bingliCaseIds)
    {
        return bingliCaseMapper.deleteBingliCaseByBingliCaseIds(bingliCaseIds);
    }

    /**
     * 删除病例订单信息信息
     * 
     * @param bingliCaseId 病例订单信息主键
     * @return 结果
     */
    @Override
    public int deleteBingliCaseByBingliCaseId(Long bingliCaseId)
    {
        return bingliCaseMapper.deleteBingliCaseByBingliCaseId(bingliCaseId);
    }
}
