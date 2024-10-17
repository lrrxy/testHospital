import request from '@/utils/request'

// 查询价格信息列表
export function listJiage(query) {
  return request({
    url: '/jiage/jiage/list',
    method: 'get',
    params: query
  })
}

// 查询价格信息详细
export function getJiage(jiageId) {
  return request({
    url: '/jiage/jiage/' + jiageId,
    method: 'get'
  })
}

// 新增价格信息
export function addJiage(data) {
  return request({
    url: '/jiage/jiage',
    method: 'post',
    data: data
  })
}

// 修改价格信息
export function updateJiage(data) {
  return request({
    url: '/jiage/jiage',
    method: 'put',
    data: data
  })
}

// 删除价格信息
export function delJiage(jiageId) {
  return request({
    url: '/jiage/jiage/' + jiageId,
    method: 'delete'
  })
}
