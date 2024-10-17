package com.ruoyi.user.service;

import java.util.List;
import com.ruoyi.user.domain.User;

/**
 * 病人信息Service接口
 * 
 * @author gsq
 * @date 2024-07-07
 */
public interface IUserService 
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
     * 批量删除病人信息
     * 
     * @param userIds 需要删除的病人信息主键集合
     * @return 结果
     */
    public int deleteUserByUserIds(Long[] userIds);

    /**
     * 删除病人信息信息
     * 
     * @param userId 病人信息主键
     * @return 结果
     */
    public int deleteUserByUserId(Long userId);
}
