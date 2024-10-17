import request from '@/utils/request'

// 查询病人所处医院信息列表
export function listHospital(query) {
  return request({
    url: '/hospital/hospital/list',
    method: 'get',
    params: query
  })
}

// 查询病人所处医院信息详细
export function getHospital(userId) {
  return request({
    url: '/hospital/hospital/' + userId,
    method: 'get'
  })
}

// 新增病人所处医院信息
export function addHospital(data) {
  return request({
    url: '/hospital/hospital',
    method: 'post',
    data: data
  })
}

// 修改病人所处医院信息
export function updateHospital(data) {
  return request({
    url: '/hospital/hospital',
    method: 'put',
    data: data
  })
}

// 删除病人所处医院信息
export function delHospital(userId) {
  return request({
    url: '/hospital/hospital/' + userId,
    method: 'delete'
  })
}
