import request from '@/utils/request'

// 查询治疗信息列表
export function listTreatment(query) {
  return request({
    url: '/treatment/treatment/list',
    method: 'get',
    params: query
  })
}

// 查询治疗信息详细
export function getTreatment(treatmentId) {
  return request({
    url: '/treatment/treatment/' + treatmentId,
    method: 'get'
  })
}

// 新增治疗信息
export function addTreatment(data) {
  return request({
    url: '/treatment/treatment',
    method: 'post',
    data: data
  })
}

// 修改治疗信息
export function updateTreatment(data) {
  return request({
    url: '/treatment/treatment',
    method: 'put',
    data: data
  })
}

// 删除治疗信息
export function delTreatment(treatmentId) {
  return request({
    url: '/treatment/treatment/' + treatmentId,
    method: 'delete'
  })
}
