package com.ruoyi.user.service.impl;

import com.ruoyi.ExamineTreatmentCase.domain.ExamineTreatmentCase;
import com.ruoyi.caseCC.domain.BingliCase;
import com.ruoyi.doctor.domain.Doctor;
import com.ruoyi.payment.domain.PaymentRecord;
import com.ruoyi.user.domain.JiaGexx;
import com.ruoyi.user.domain.Transfer_order;
import com.ruoyi.user.domain.User;
import com.ruoyi.user.mapper.*;
import com.ruoyi.user.service.UserAPIService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Random;
//import tk.mybatis.mapper.entity.Example;

@Service
@Slf4j
public class UserAPIServicelmpl implements UserAPIService {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private JiagexxMapper jiagexxMapper;

    @Autowired
    private TransferMapper transferMapper;

    @Autowired
    private BingliMapper bingliMapper;

    @Autowired
    private DoctorALLMapper doctorALLMapper;

    @Autowired
    private ExamineTreatmentCaseCCMapper examineTreatmentCaseCCMapper;



    /**
     * 生成订单编号
     */
    public static Long generateOrderId() {
        StringBuilder sb = new StringBuilder();
        Random random = new Random();

        // 添加当前时间戳的后几位
        String timestamp = String.valueOf(System.currentTimeMillis()).substring(5); // 获取后几位，避免太长
        sb.append(timestamp);

        // 添加随机数字
        for (int i = 0; i < 5; i++) {  // 控制随机数字的长度
            sb.append(random.nextInt(10)); // 生成 0-9 的随机数字
        }

        // 将生成的字符串转换为 Long 类型
        return Long.parseLong(sb.toString());
    }



    /**
     * 生成用户唯一的id
     * @return
     */
    private  long creatUserCodeU() {
        User u = new User();

        boolean b = true;
        long usercode = 0;
        while (b) {
            usercode = (long) ((Math.random() * 90000000) + 10000000);
            u.setUserId(usercode);
            int have = userMapper.selectCount(u);
            if (have == 0) {
                b = false;
            }
        }
        return usercode;
    }

    /**
     * 用户名登录
     * @param user
     * @return
     */
    @Override
    public User loginByName(User user) {
        return userMapper.loginByName(user.getUserZhanghao(), user.getUserPassword());
    }

    /**
     * 手机号登录
     * @param user
     * @return
     */
    @Override
    public User loginByPhone(User user) {
        return userMapper.loginByPhone(user.getUserPhone(), user.getUserPassword());

    }

    /**
     * 查询用户信息
     * @param userId
     * @return
     */
    @Override
    public User selectUserAll(Long userId) {
        return userMapper.selectUserByUserId(userId);
    }

    /**
     * 根据床号判断是否有无此人
     * @param sickbedId
     * @return
     */
    @Override
    public User selectSickbedID(int sickbedId) {
        return userMapper.selectSickbedID(sickbedId);
    }

    /**
     * 申请转院，添加转院订单
     * @param u
     * @param hospitalName
     * @param newHospitalName
     * @param condition
     */
    @Override
    public void inserTransfer(User u, String hospitalName, String newHospitalName, String condition) {
        Transfer_order t = new Transfer_order();
        t.setCondition(condition);
        t.setOrderId(generateOrderId());
        t.setUserId(Math.toIntExact(u.getUserId()));
        t.setStatus(1);
        t.setHospitalName(hospitalName);
        t.setNew_hospitalName(newHospitalName);
        t.setTransferTime(LocalDateTime.now());
        transferMapper.insertTransfer(t);
    }

    /**
     * 费用查询方法
     * @param jiageId
     * @param userName
     * @return
     */
    @Override
    public JiaGexx selectJiaGe(int jiageId, String userName) {
        JiaGexx j = new JiaGexx();
        j.setExaminePriceId(jiagexxMapper.selectExamineId(jiageId));
        j.setMedicinePriceId(jiagexxMapper.selectMedicineId(jiageId));
        j.setTreatmentPriceId(jiagexxMapper.selectTreatmentId(jiageId));
        j.setUserName(userName);
        j.setUserId(jiageId);
        j.setExaminePrice(jiagexxMapper.selectExamine(j.getExaminePriceId()));   //检查价格
        j.setMedicinePrice(jiagexxMapper.selectMedicine(j.getMedicinePriceId()));  //药品价格
        j.setTreatmentPrice(jiagexxMapper.selectTreatment(j.getTreatmentPriceId()));  //治疗价格
        j.setUserPrice(jiagexxMapper.selectSickbedPrice(j.getUserId()));          //床位价格
        j.setSumPrice(j.getExaminePrice()+j.getMedicinePrice()+j.getTreatmentPrice()+j.getUserPrice());  //总价
        return j;
    }

    /**
     * 缴费记录查询
     * @param userId
     * @return
     */
    @Override
    public List<PaymentRecord> selectPay(int userId) {
        return transferMapper.selectPay(userId);
    }

    /**
     * 缴费实现
     * @param userId
     * @return
     */
    @Override
    public List<PaymentRecord> selectStatusPay(int userId) {
        return transferMapper.selectStatusPay(userId);
    }

    @Override
    public void updateStatus(int recordId) {
        transferMapper.updateStatus(recordId);
        transferMapper.updatePaymentMethod(recordId);
    }

    @Override
    public BingliCase selectBingli(int sickbedId, String userName) {
        BingliCase b = new BingliCase();
        b.setSickbedId(sickbedId);
        b.setUserId(bingliMapper.selectBingliUserId(sickbedId));
        b.setUserName(userName);
        b.setCaseStatus(1);
        b.setCaseName(bingliMapper.selectBingliName(b.getUserId()));
        b.setOrderName(bingliMapper.selectBingliOrder(b.getUserId()));
        b.setMedicineId(1);
        b.setMedicineName(bingliMapper.selectBingliMedicine(b.getMedicineId()));
        b.setDoctorId(bingliMapper.selectBingliDoctor(b.getUserId()));
        b.setDoctorName(bingliMapper.selectBingliDoctorName(b.getDoctorId()));
        return b;
    }

    @Override
    public List<Doctor> selectDoctor(int doctorStatus) {
        return doctorALLMapper.selectDoctor(doctorStatus);
    }

    @Override
    public void insertExamineTreatmentCase(ExamineTreatmentCase e) {
        e.setDoctorName(doctorALLMapper.selectDoctorNameById(e.getDoctorId()));
        e.setCaseStatus(1);
        examineTreatmentCaseCCMapper.insertExamineTreatmentCase(e);
    }

    @Override
    public void delectAppointment(int userId) {
        examineTreatmentCaseCCMapper.delectAppointment(userId);
    }

    @Override
    public double selectBalance(int userId) {
        return transferMapper.selectBalance(userId);
    }

    @Override
    public ExamineTreatmentCase selectByPay(int userId) {
        return examineTreatmentCaseCCMapper.selectByPay(userId);
    }


}
