import request from '@/utils/request'

// 查询转院订单信息列表
export function listOrder(query) {
  return request({
    url: '/transfer/order/list',
    method: 'get',
    params: query
  })
}

// 查询转院订单信息详细
export function getOrder(transferOrderId) {
  return request({
    url: '/transfer/order/' + transferOrderId,
    method: 'get'
  })
}

// 新增转院订单信息
export function addOrder(data) {
  return request({
    url: '/transfer/order',
    method: 'post',
    data: data
  })
}

// 修改转院订单信息
export function updateOrder(data) {
  return request({
    url: '/transfer/order',
    method: 'put',
    data: data
  })
}

// 删除转院订单信息
export function delOrder(transferOrderId) {
  return request({
    url: '/transfer/order/' + transferOrderId,
    method: 'delete'
  })
}
