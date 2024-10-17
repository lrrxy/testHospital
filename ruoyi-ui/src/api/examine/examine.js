import request from '@/utils/request'

// 查询检查信息列表
export function listExamine(query) {
  return request({
    url: '/examine/examine/list',
    method: 'get',
    params: query
  })
}

// 查询检查信息详细
export function getExamine(examineId) {
  return request({
    url: '/examine/examine/' + examineId,
    method: 'get'
  })
}

// 新增检查信息
export function addExamine(data) {
  return request({
    url: '/examine/examine',
    method: 'post',
    data: data
  })
}

// 修改检查信息
export function updateExamine(data) {
  return request({
    url: '/examine/examine',
    method: 'put',
    data: data
  })
}

// 删除检查信息
export function delExamine(examineId) {
  return request({
    url: '/examine/examine/' + examineId,
    method: 'delete'
  })
}
