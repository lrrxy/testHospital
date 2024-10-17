import request from '@/utils/request'

// 查询订单信息列表
export function listDingdan(query) {
  return request({
    url: '/dingdan/dingdan/list',
    method: 'get',
    params: query
  })
}

// 查询订单信息详细
export function getDingdan(dingdanId) {
  return request({
    url: '/dingdan/dingdan/' + dingdanId,
    method: 'get'
  })
}

// 新增订单信息
export function addDingdan(data) {
  return request({
    url: '/dingdan/dingdan',
    method: 'post',
    data: data
  })
}

// 修改订单信息
export function updateDingdan(data) {
  return request({
    url: '/dingdan/dingdan',
    method: 'put',
    data: data
  })
}

// 删除订单信息
export function delDingdan(dingdanId) {
  return request({
    url: '/dingdan/dingdan/' + dingdanId,
    method: 'delete'
  })
}
