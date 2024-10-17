package com.ruoyi.transfer.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.transfer.mapper.SysTransferOrderMapper;
import com.ruoyi.transfer.domain.SysTransferOrder;
import com.ruoyi.transfer.service.ISysTransferOrderService;

/**
 * 转院订单信息Service业务层处理
 * 
 * @author kda
 * @date 2024-08-27
 */
@Service
public class SysTransferOrderServiceImpl implements ISysTransferOrderService 
{
    @Autowired
    private SysTransferOrderMapper sysTransferOrderMapper;

    /**
     * 查询转院订单信息
     * 
     * @param transferOrderId 转院订单信息主键
     * @return 转院订单信息
     */
    @Override
    public SysTransferOrder selectSysTransferOrderByTransferOrderId(Long transferOrderId)
    {
        return sysTransferOrderMapper.selectSysTransferOrderByTransferOrderId(transferOrderId);
    }

    /**
     * 查询转院订单信息列表
     * 
     * @param sysTransferOrder 转院订单信息
     * @return 转院订单信息
     */
    @Override
    public List<SysTransferOrder> selectSysTransferOrderList(SysTransferOrder sysTransferOrder)
    {
        return sysTransferOrderMapper.selectSysTransferOrderList(sysTransferOrder);
    }

    /**
     * 新增转院订单信息
     * 
     * @param sysTransferOrder 转院订单信息
     * @return 结果
     */
    @Override
    public int insertSysTransferOrder(SysTransferOrder sysTransferOrder)
    {
        return sysTransferOrderMapper.insertSysTransferOrder(sysTransferOrder);
    }

    /**
     * 修改转院订单信息
     * 
     * @param sysTransferOrder 转院订单信息
     * @return 结果
     */
    @Override
    public int updateSysTransferOrder(SysTransferOrder sysTransferOrder)
    {
        return sysTransferOrderMapper.updateSysTransferOrder(sysTransferOrder);
    }

    /**
     * 批量删除转院订单信息
     * 
     * @param transferOrderIds 需要删除的转院订单信息主键
     * @return 结果
     */
    @Override
    public int deleteSysTransferOrderByTransferOrderIds(Long[] transferOrderIds)
    {
        return sysTransferOrderMapper.deleteSysTransferOrderByTransferOrderIds(transferOrderIds);
    }

    /**
     * 删除转院订单信息信息
     * 
     * @param transferOrderId 转院订单信息主键
     * @return 结果
     */
    @Override
    public int deleteSysTransferOrderByTransferOrderId(Long transferOrderId)
    {
        return sysTransferOrderMapper.deleteSysTransferOrderByTransferOrderId(transferOrderId);
    }
}
