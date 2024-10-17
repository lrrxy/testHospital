package com.ruoyi.dingdan.mapper;

import java.util.List;
import com.ruoyi.dingdan.domain.Dingdan;
import org.apache.ibatis.annotations.Mapper;

/**
 * 订单信息Mapper接口
 * 
 * @author gsq
 * @date 2024-07-07
 */
@Mapper
public interface DingdanMapper 
{
    /**
     * 查询订单信息
     * 
     * @param dingdanId 订单信息主键
     * @return 订单信息
     */
    public Dingdan selectDingdanByDingdanId(Long dingdanId);

    /**
     * 查询订单信息列表
     * 
     * @param dingdan 订单信息
     * @return 订单信息集合
     */
    public List<Dingdan> selectDingdanList(Dingdan dingdan);

    /**
     * 新增订单信息
     * 
     * @param dingdan 订单信息
     * @return 结果
     */
    public int insertDingdan(Dingdan dingdan);

    /**
     * 修改订单信息
     * 
     * @param dingdan 订单信息
     * @return 结果
     */
    public int updateDingdan(Dingdan dingdan);

    /**
     * 删除订单信息
     * 
     * @param dingdanId 订单信息主键
     * @return 结果
     */
    public int deleteDingdanByDingdanId(Long dingdanId);

    /**
     * 批量删除订单信息
     * 
     * @param dingdanIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDingdanByDingdanIds(Long[] dingdanIds);
}
