package com.ruoyi.payment.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.payment.mapper.PaymentRecordMapper;
import com.ruoyi.payment.domain.PaymentRecord;
import com.ruoyi.payment.service.IPaymentRecordService;

/**
 * 缴费记录信息Service业务层处理
 * 
 * @author kda
 * @date 2024-09-03
 */
@Service
public class PaymentRecordServiceImpl implements IPaymentRecordService 
{
    @Autowired
    private PaymentRecordMapper paymentRecordMapper;

    /**
     * 查询缴费记录信息
     * 
     * @param recordId 缴费记录信息主键
     * @return 缴费记录信息
     */
    @Override
    public PaymentRecord selectPaymentRecordByRecordId(Long recordId)
    {
        return paymentRecordMapper.selectPaymentRecordByRecordId(recordId);
    }

    /**
     * 查询缴费记录信息列表
     * 
     * @param paymentRecord 缴费记录信息
     * @return 缴费记录信息
     */
    @Override
    public List<PaymentRecord> selectPaymentRecordList(PaymentRecord paymentRecord)
    {
        return paymentRecordMapper.selectPaymentRecordList(paymentRecord);
    }

    /**
     * 新增缴费记录信息
     * 
     * @param paymentRecord 缴费记录信息
     * @return 结果
     */
    @Override
    public int insertPaymentRecord(PaymentRecord paymentRecord)
    {
        return paymentRecordMapper.insertPaymentRecord(paymentRecord);
    }

    /**
     * 修改缴费记录信息
     * 
     * @param paymentRecord 缴费记录信息
     * @return 结果
     */
    @Override
    public int updatePaymentRecord(PaymentRecord paymentRecord)
    {
        return paymentRecordMapper.updatePaymentRecord(paymentRecord);
    }

    /**
     * 批量删除缴费记录信息
     * 
     * @param recordIds 需要删除的缴费记录信息主键
     * @return 结果
     */
    @Override
    public int deletePaymentRecordByRecordIds(Long[] recordIds)
    {
        return paymentRecordMapper.deletePaymentRecordByRecordIds(recordIds);
    }

    /**
     * 删除缴费记录信息信息
     * 
     * @param recordId 缴费记录信息主键
     * @return 结果
     */
    @Override
    public int deletePaymentRecordByRecordId(Long recordId)
    {
        return paymentRecordMapper.deletePaymentRecordByRecordId(recordId);
    }
}
