package com.ruoyi.jiage.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.jiage.mapper.JiageMapper;
import com.ruoyi.jiage.domain.Jiage;
import com.ruoyi.jiage.service.IJiageService;

/**
 * 价格信息Service业务层处理
 * 
 * @author gsq
 * @date 2024-07-07
 */
@Service
public class JiageServiceImpl implements IJiageService 
{
    @Autowired
    private JiageMapper jiageMapper;

    /**
     * 查询价格信息
     * 
     * @param jiageId 价格信息主键
     * @return 价格信息
     */
    @Override
    public Jiage selectJiageByJiageId(Long jiageId)
    {
        return jiageMapper.selectJiageByJiageId(jiageId);
    }

    /**
     * 查询价格信息列表
     * 
     * @param jiage 价格信息
     * @return 价格信息
     */
    @Override
    public List<Jiage> selectJiageList(Jiage jiage)
    {
        return jiageMapper.selectJiageList(jiage);
    }

    /**
     * 新增价格信息
     * 
     * @param jiage 价格信息
     * @return 结果
     */
    @Override
    public int insertJiage(Jiage jiage)
    {
        return jiageMapper.insertJiage(jiage);
    }

    /**
     * 修改价格信息
     * 
     * @param jiage 价格信息
     * @return 结果
     */
    @Override
    public int updateJiage(Jiage jiage)
    {
        return jiageMapper.updateJiage(jiage);
    }

    /**
     * 批量删除价格信息
     * 
     * @param jiageIds 需要删除的价格信息主键
     * @return 结果
     */
    @Override
    public int deleteJiageByJiageIds(Long[] jiageIds)
    {
        return jiageMapper.deleteJiageByJiageIds(jiageIds);
    }

    /**
     * 删除价格信息信息
     * 
     * @param jiageId 价格信息主键
     * @return 结果
     */
    @Override
    public int deleteJiageByJiageId(Long jiageId)
    {
        return jiageMapper.deleteJiageByJiageId(jiageId);
    }
}
