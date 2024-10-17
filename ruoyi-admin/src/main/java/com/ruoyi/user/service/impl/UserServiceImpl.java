package com.ruoyi.user.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import io.swagger.v3.oas.models.examples.Example;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.user.mapper.UserMapper;
import com.ruoyi.user.domain.User;
import com.ruoyi.user.service.IUserService;

/**
 * 病人信息Service业务层处理
 * 
 * @author gsq
 * @date 2024-07-07
 */
@Service
public class UserServiceImpl implements IUserService 
{
    @Autowired
    private UserMapper userMapper;

    /**
     * 查询病人信息
     * 
     * @param userId 病人信息主键
     * @return 病人信息
     */
    @Override
    public User selectUserByUserId(Long userId)
    {
        return userMapper.selectUserByUserId(userId);
    }

    /**
     * 查询病人信息列表
     * 
     * @param user 病人信息
     * @return 病人信息
     */
    @Override
    public List<User> selectUserList(User user)
    {
        return userMapper.selectUserList(user);
    }

    /**
     * 新增病人信息
     * 
     * @param user 病人信息
     * @return 结果
     */
    @Override
    public int insertUser(User user)
    {
        user.setCreateTime(DateUtils.getNowDate());
        return userMapper.insertUser(user);
    }

    /**
     * 修改病人信息
     * 
     * @param user 病人信息
     * @return 结果
     */
    @Override
    public int updateUser(User user)
    {
        return userMapper.updateUser(user);
    }

    /**
     * 批量删除病人信息
     * 
     * @param userIds 需要删除的病人信息主键
     * @return 结果
     */
    @Override
    public int deleteUserByUserIds(Long[] userIds)
    {
        return userMapper.deleteUserByUserIds(userIds);
    }

    /**
     * 删除病人信息信息
     * 
     * @param userId 病人信息主键
     * @return 结果
     */
    @Override
    public int deleteUserByUserId(Long userId)
    {
        return userMapper.deleteUserByUserId(userId);
    }









}
