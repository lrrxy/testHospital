package com.ruoyi.medicine.service;

import java.util.List;
import com.ruoyi.medicine.domain.Medicine;

/**
 * 药品信息Service接口
 * 
 * @author gsq
 * @date 2024-07-07
 */
public interface IMedicineService 
{
    /**
     * 查询药品信息
     * 
     * @param medicineId 药品信息主键
     * @return 药品信息
     */
    public Medicine selectMedicineByMedicineId(Long medicineId);

    /**
     * 查询药品信息列表
     * 
     * @param medicine 药品信息
     * @return 药品信息集合
     */
    public List<Medicine> selectMedicineList(Medicine medicine);

    /**
     * 新增药品信息
     * 
     * @param medicine 药品信息
     * @return 结果
     */
    public int insertMedicine(Medicine medicine);

    /**
     * 修改药品信息
     * 
     * @param medicine 药品信息
     * @return 结果
     */
    public int updateMedicine(Medicine medicine);

    /**
     * 批量删除药品信息
     * 
     * @param medicineIds 需要删除的药品信息主键集合
     * @return 结果
     */
    public int deleteMedicineByMedicineIds(Long[] medicineIds);

    /**
     * 删除药品信息信息
     * 
     * @param medicineId 药品信息主键
     * @return 结果
     */
    public int deleteMedicineByMedicineId(Long medicineId);
}
