package com.ruoyi.user.mapper;

import java.util.List;
import com.ruoyi.user.domain.User;
//import tk.mybatis.mapper.common.Mapper;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
//import tk.mybatis.mapper.entity.Example;

/**
 * 病人信息Mapper接口
 * 
 * @author gsq
 * @date 2024-07-07
 */
@Mapper
public interface UserMapper
{
    /**
     * 查询病人信息
     * 
     * @param userId 病人信息主键
     * @return 病人信息
     */
    public User selectUserByUserId(Long userId);

    /**
     * 查询病人信息列表
     * 
     * @param user 病人信息
     * @return 病人信息集合
     */
    public List<User> selectUserList(User user);

    /**
     * 新增病人信息
     * 
     * @param user 病人信息
     * @return 结果
     */
    public int insertUser(User user);

    /**
     * 修改病人信息
     * 
     * @param user 病人信息
     * @return 结果
     */
    public int updateUser(User user);

    /**
     * 删除病人信息
     * 
     * @param userId 病人信息主键
     * @return 结果
     */
    public int deleteUserByUserId(Long userId);

    /**
     * 批量删除病人信息
     * 
     * @param userIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteUserByUserIds(Long[] userIds);


    @Select("select user_id from user where user_id = #{userId}")
    int selectCount(User u);

    /**
     * 用户名登录
     * @param userZhanghao
     * @param userPassword
     * @return
     */
    User loginByName(@Param("userZhanghao") String userZhanghao, @Param("userPassword") String userPassword);

    /**
     * 手机号登录
     * @param userPhone
     * @param userPassword
     * @return
     */
    User loginByPhone(@Param("userPhone") String userPhone, @Param("userPassword") String userPassword);


    User selectSickbedID(int sickbedId);


}
