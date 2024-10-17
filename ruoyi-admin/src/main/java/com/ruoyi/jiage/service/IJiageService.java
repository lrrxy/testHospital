package com.ruoyi.jiage.service;

import java.util.List;
import com.ruoyi.jiage.domain.Jiage;

/**
 * 价格信息Service接口
 * 
 * @author gsq
 * @date 2024-07-07
 */
public interface IJiageService 
{
    /**
     * 查询价格信息
     * 
     * @param jiageId 价格信息主键
     * @return 价格信息
     */
    public Jiage selectJiageByJiageId(Long jiageId);

    /**
     * 查询价格信息列表
     * 
     * @param jiage 价格信息
     * @return 价格信息集合
     */
    public List<Jiage> selectJiageList(Jiage jiage);

    /**
     * 新增价格信息
     * 
     * @param jiage 价格信息
     * @return 结果
     */
    public int insertJiage(Jiage jiage);

    /**
     * 修改价格信息
     * 
     * @param jiage 价格信息
     * @return 结果
     */
    public int updateJiage(Jiage jiage);

    /**
     * 批量删除价格信息
     * 
     * @param jiageIds 需要删除的价格信息主键集合
     * @return 结果
     */
    public int deleteJiageByJiageIds(Long[] jiageIds);

    /**
     * 删除价格信息信息
     * 
     * @param jiageId 价格信息主键
     * @return 结果
     */
    public int deleteJiageByJiageId(Long jiageId);
}
