import request from '@/utils/request'

// 查询病房信息列表
export function listWard(query) {
  return request({
    url: '/ward/ward/list',
    method: 'get',
    params: query
  })
}

// 查询病房信息详细
export function getWard(wardId) {
  return request({
    url: '/ward/ward/' + wardId,
    method: 'get'
  })
}

// 新增病房信息
export function addWard(data) {
  return request({
    url: '/ward/ward',
    method: 'post',
    data: data
  })
}

// 修改病房信息
export function updateWard(data) {
  return request({
    url: '/ward/ward',
    method: 'put',
    data: data
  })
}

// 删除病房信息
export function delWard(wardId) {
  return request({
    url: '/ward/ward/' + wardId,
    method: 'delete'
  })
}
