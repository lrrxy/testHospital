package com.ruoyi.medicine.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.medicine.mapper.MedicineMapper;
import com.ruoyi.medicine.domain.Medicine;
import com.ruoyi.medicine.service.IMedicineService;

/**
 * 药品信息Service业务层处理
 * 
 * @author gsq
 * @date 2024-07-07
 */
@Service
public class MedicineServiceImpl implements IMedicineService 
{
    @Autowired
    private MedicineMapper medicineMapper;

    /**
     * 查询药品信息
     * 
     * @param medicineId 药品信息主键
     * @return 药品信息
     */
    @Override
    public Medicine selectMedicineByMedicineId(Long medicineId)
    {
        return medicineMapper.selectMedicineByMedicineId(medicineId);
    }

    /**
     * 查询药品信息列表
     * 
     * @param medicine 药品信息
     * @return 药品信息
     */
    @Override
    public List<Medicine> selectMedicineList(Medicine medicine)
    {
        return medicineMapper.selectMedicineList(medicine);
    }

    /**
     * 新增药品信息
     * 
     * @param medicine 药品信息
     * @return 结果
     */
    @Override
    public int insertMedicine(Medicine medicine)
    {
        return medicineMapper.insertMedicine(medicine);
    }

    /**
     * 修改药品信息
     * 
     * @param medicine 药品信息
     * @return 结果
     */
    @Override
    public int updateMedicine(Medicine medicine)
    {
        return medicineMapper.updateMedicine(medicine);
    }

    /**
     * 批量删除药品信息
     * 
     * @param medicineIds 需要删除的药品信息主键
     * @return 结果
     */
    @Override
    public int deleteMedicineByMedicineIds(Long[] medicineIds)
    {
        return medicineMapper.deleteMedicineByMedicineIds(medicineIds);
    }

    /**
     * 删除药品信息信息
     * 
     * @param medicineId 药品信息主键
     * @return 结果
     */
    @Override
    public int deleteMedicineByMedicineId(Long medicineId)
    {
        return medicineMapper.deleteMedicineByMedicineId(medicineId);
    }
}
