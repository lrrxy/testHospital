package com.ruoyi.caseCC.mapper;

import java.util.List;
import com.ruoyi.caseCC.domain.BingliCase;
import org.apache.ibatis.annotations.Mapper;

/**
 * 病例订单信息Mapper接口
 * 
 * @author kda
 * @date 2024-09-12
 */
@Mapper
public interface BingliCaseMapper 
{
    /**
     * 查询病例订单信息
     * 
     * @param bingliCaseId 病例订单信息主键
     * @return 病例订单信息
     */
    public BingliCase selectBingliCaseByBingliCaseId(Long bingliCaseId);

    /**
     * 查询病例订单信息列表
     * 
     * @param bingliCase 病例订单信息
     * @return 病例订单信息集合
     */
    public List<BingliCase> selectBingliCaseList(BingliCase bingliCase);

    /**
     * 新增病例订单信息
     * 
     * @param bingliCase 病例订单信息
     * @return 结果
     */
    public int insertBingliCase(BingliCase bingliCase);

    /**
     * 修改病例订单信息
     * 
     * @param bingliCase 病例订单信息
     * @return 结果
     */
    public int updateBingliCase(BingliCase bingliCase);

    /**
     * 删除病例订单信息
     * 
     * @param bingliCaseId 病例订单信息主键
     * @return 结果
     */
    public int deleteBingliCaseByBingliCaseId(Long bingliCaseId);

    /**
     * 批量删除病例订单信息
     * 
     * @param bingliCaseIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBingliCaseByBingliCaseIds(Long[] bingliCaseIds);
}
