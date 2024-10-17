import request from '@/utils/request'

// 查询检查或手术订单信息列表
export function listExamineTreatmentCase(query) {
  return request({
    url: '/ExamineTreatmentCase/ExamineTreatmentCase/list',
    method: 'get',
    params: query
  })
}

// 查询检查或手术订单信息详细
export function getExamineTreatmentCase(examineTreatmentCaseId) {
  return request({
    url: '/ExamineTreatmentCase/ExamineTreatmentCase/' + examineTreatmentCaseId,
    method: 'get'
  })
}

// 新增检查或手术订单信息
export function addExamineTreatmentCase(data) {
  return request({
    url: '/ExamineTreatmentCase/ExamineTreatmentCase',
    method: 'post',
    data: data
  })
}

// 修改检查或手术订单信息
export function updateExamineTreatmentCase(data) {
  return request({
    url: '/ExamineTreatmentCase/ExamineTreatmentCase',
    method: 'put',
    data: data
  })
}

// 删除检查或手术订单信息
export function delExamineTreatmentCase(examineTreatmentCaseId) {
  return request({
    url: '/ExamineTreatmentCase/ExamineTreatmentCase/' + examineTreatmentCaseId,
    method: 'delete'
  })
}
