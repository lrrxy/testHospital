package com.ruoyi.dingdan.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.dingdan.mapper.DingdanMapper;
import com.ruoyi.dingdan.domain.Dingdan;
import com.ruoyi.dingdan.service.IDingdanService;

/**
 * 订单信息Service业务层处理
 * 
 * @author gsq
 * @date 2024-07-07
 */
@Service
public class DingdanServiceImpl implements IDingdanService 
{
    @Autowired
    private DingdanMapper dingdanMapper;

    /**
     * 查询订单信息
     * 
     * @param dingdanId 订单信息主键
     * @return 订单信息
     */
    @Override
    public Dingdan selectDingdanByDingdanId(Long dingdanId)
    {
        return dingdanMapper.selectDingdanByDingdanId(dingdanId);
    }

    /**
     * 查询订单信息列表
     * 
     * @param dingdan 订单信息
     * @return 订单信息
     */
    @Override
    public List<Dingdan> selectDingdanList(Dingdan dingdan)
    {
        return dingdanMapper.selectDingdanList(dingdan);
    }

    /**
     * 新增订单信息
     * 
     * @param dingdan 订单信息
     * @return 结果
     */
    @Override
    public int insertDingdan(Dingdan dingdan)
    {
        return dingdanMapper.insertDingdan(dingdan);
    }

    /**
     * 修改订单信息
     * 
     * @param dingdan 订单信息
     * @return 结果
     */
    @Override
    public int updateDingdan(Dingdan dingdan)
    {
        return dingdanMapper.updateDingdan(dingdan);
    }

    /**
     * 批量删除订单信息
     * 
     * @param dingdanIds 需要删除的订单信息主键
     * @return 结果
     */
    @Override
    public int deleteDingdanByDingdanIds(Long[] dingdanIds)
    {
        return dingdanMapper.deleteDingdanByDingdanIds(dingdanIds);
    }

    /**
     * 删除订单信息信息
     * 
     * @param dingdanId 订单信息主键
     * @return 结果
     */
    @Override
    public int deleteDingdanByDingdanId(Long dingdanId)
    {
        return dingdanMapper.deleteDingdanByDingdanId(dingdanId);
    }
}
