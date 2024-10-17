package com.ruoyi.transfer.service;

import java.util.List;
import com.ruoyi.transfer.domain.SysTransferOrder;

/**
 * 转院订单信息Service接口
 * 
 * @author kda
 * @date 2024-08-27
 */
public interface ISysTransferOrderService 
{
    /**
     * 查询转院订单信息
     * 
     * @param transferOrderId 转院订单信息主键
     * @return 转院订单信息
     */
    public SysTransferOrder selectSysTransferOrderByTransferOrderId(Long transferOrderId);

    /**
     * 查询转院订单信息列表
     * 
     * @param sysTransferOrder 转院订单信息
     * @return 转院订单信息集合
     */
    public List<SysTransferOrder> selectSysTransferOrderList(SysTransferOrder sysTransferOrder);

    /**
     * 新增转院订单信息
     * 
     * @param sysTransferOrder 转院订单信息
     * @return 结果
     */
    public int insertSysTransferOrder(SysTransferOrder sysTransferOrder);

    /**
     * 修改转院订单信息
     * 
     * @param sysTransferOrder 转院订单信息
     * @return 结果
     */
    public int updateSysTransferOrder(SysTransferOrder sysTransferOrder);

    /**
     * 批量删除转院订单信息
     * 
     * @param transferOrderIds 需要删除的转院订单信息主键集合
     * @return 结果
     */
    public int deleteSysTransferOrderByTransferOrderIds(Long[] transferOrderIds);

    /**
     * 删除转院订单信息信息
     * 
     * @param transferOrderId 转院订单信息主键
     * @return 结果
     */
    public int deleteSysTransferOrderByTransferOrderId(Long transferOrderId);
}
