package com.ruoyi.medicine.mapper;

import java.util.List;
import com.ruoyi.medicine.domain.Medicine;

/**
 * 药品信息Mapper接口
 * 
 * @author gsq
 * @date 2024-07-07
 */
public interface MedicineMapper 
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
     * 删除药品信息
     * 
     * @param medicineId 药品信息主键
     * @return 结果
     */
    public int deleteMedicineByMedicineId(Long medicineId);

    /**
     * 批量删除药品信息
     * 
     * @param medicineIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMedicineByMedicineIds(Long[] medicineIds);
}
