import request from '@/utils/request'

// 查询护士信息列表
export function listNurse(query) {
  return request({
    url: '/nurse/nurse/list',
    method: 'get',
    params: query
  })
}

// 查询护士信息详细
export function getNurse(nurseId) {
  return request({
    url: '/nurse/nurse/' + nurseId,
    method: 'get'
  })
}

// 新增护士信息
export function addNurse(data) {
  return request({
    url: '/nurse/nurse',
    method: 'post',
    data: data
  })
}

// 修改护士信息
export function updateNurse(data) {
  return request({
    url: '/nurse/nurse',
    method: 'put',
    data: data
  })
}

// 删除护士信息
export function delNurse(nurseId) {
  return request({
    url: '/nurse/nurse/' + nurseId,
    method: 'delete'
  })
}
