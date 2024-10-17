package com.ruoyi.jiage.mapper;

import java.util.List;
import com.ruoyi.jiage.domain.Jiage;
import org.apache.ibatis.annotations.Mapper;

/**
 * 价格信息Mapper接口
 * 
 * @author gsq
 * @date 2024-07-07
 */

public interface JiageMapper 
{
    /**
     * 查询价格信息
     * 
     * @param jiageId 价格信息主键
     * @return 价格信息
     */
    public Jiage selectJiageByJiageId(Long jiageId);

    /**
     * 查询价格信息列表
     * 
     * @param jiage 价格信息
     * @return 价格信息集合
     */
    public List<Jiage> selectJiageList(Jiage jiage);

    /**
     * 新增价格信息
     * 
     * @param jiage 价格信息
     * @return 结果
     */
    public int insertJiage(Jiage jiage);

    /**
     * 修改价格信息
     * 
     * @param jiage 价格信息
     * @return 结果
     */
    public int updateJiage(Jiage jiage);

    /**
     * 删除价格信息
     * 
     * @param jiageId 价格信息主键
     * @return 结果
     */
    public int deleteJiageByJiageId(Long jiageId);

    /**
     * 批量删除价格信息
     * 
     * @param jiageIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteJiageByJiageIds(Long[] jiageIds);
}
