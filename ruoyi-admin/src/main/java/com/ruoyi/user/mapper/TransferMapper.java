package com.ruoyi.user.mapper;

import com.ruoyi.payment.domain.PaymentRecord;
import com.ruoyi.user.domain.Transfer_order;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface TransferMapper {

    /**
     * 转院申请订单添加
     * @param t
     */
    @Insert("INSERT INTO sys_transfer_order " +
            "(transfer_order_id, user_id, hospital_name, new_hospital_name, transfer_order_time, transfer_order_condition, order_status) " +
            "VALUES (#{orderId}, #{userId}, #{hospitalName}, #{new_hospitalName}, #{transferTime}, #{condition}, #{status})")
    void insertTransfer(Transfer_order t);


    /**
     * 查询用户支付记录
     * @param userId
     * @return
     */
    @Select("SELECT record_id AS recordId, user_id AS userId, user_name AS userName, " +
            "project_name AS projectName, payment_method AS paymentMethod, sum, status, payment_date AS paymentDate " +
            "FROM payment_record WHERE user_id = #{userId}")
    List<PaymentRecord> selectPay(int userId);

    /**
     * 获取未支付的信息
     * @param userId
     * @return
     */
    @Select("SELECT record_id AS recordId, user_id AS userId, user_name AS userName, " +
            "project_name AS projectName, payment_method AS paymentMethod, sum, status, payment_date AS paymentDate " +
            "FROM payment_record WHERE user_id = #{userId} AND status = 0")
    List<PaymentRecord> selectStatusPay(int userId);


    @Update("UPDATE payment_record SET status = 1 WHERE record_id = #{recordId}")
    void updateStatus(int recordId);


    @Update("UPDATE payment_record SET payment_method = 1 WHERE record_id = #{recordId}")
    void updatePaymentMethod(int recordId);

    @Select("SELECT balance_sum FROM balance WHERE user_id = #{userId}")
    double selectBalance(int userId);
}
