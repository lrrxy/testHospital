package com.ruoyi.payment.mapper;

import java.util.List;
import com.ruoyi.payment.domain.PaymentRecord;

/**
 * 缴费记录信息Mapper接口
 * 
 * @author kda
 * @date 2024-09-03
 */
public interface PaymentRecordMapper 
{
    /**
     * 查询缴费记录信息
     * 
     * @param recordId 缴费记录信息主键
     * @return 缴费记录信息
     */
    public PaymentRecord selectPaymentRecordByRecordId(Long recordId);

    /**
     * 查询缴费记录信息列表
     * 
     * @param paymentRecord 缴费记录信息
     * @return 缴费记录信息集合
     */
    public List<PaymentRecord> selectPaymentRecordList(PaymentRecord paymentRecord);

    /**
     * 新增缴费记录信息
     * 
     * @param paymentRecord 缴费记录信息
     * @return 结果
     */
    public int insertPaymentRecord(PaymentRecord paymentRecord);

    /**
     * 修改缴费记录信息
     * 
     * @param paymentRecord 缴费记录信息
     * @return 结果
     */
    public int updatePaymentRecord(PaymentRecord paymentRecord);

    /**
     * 删除缴费记录信息
     * 
     * @param recordId 缴费记录信息主键
     * @return 结果
     */
    public int deletePaymentRecordByRecordId(Long recordId);

    /**
     * 批量删除缴费记录信息
     * 
     * @param recordIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePaymentRecordByRecordIds(Long[] recordIds);
}
