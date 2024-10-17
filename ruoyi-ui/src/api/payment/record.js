import request from '@/utils/request'

// 查询缴费记录信息列表
export function listRecord(query) {
  return request({
    url: '/payment/record/list',
    method: 'get',
    params: query
  })
}

// 查询缴费记录信息详细
export function getRecord(recordId) {
  return request({
    url: '/payment/record/' + recordId,
    method: 'get'
  })
}

// 新增缴费记录信息
export function addRecord(data) {
  return request({
    url: '/payment/record',
    method: 'post',
    data: data
  })
}

// 修改缴费记录信息
export function updateRecord(data) {
  return request({
    url: '/payment/record',
    method: 'put',
    data: data
  })
}

// 删除缴费记录信息
export function delRecord(recordId) {
  return request({
    url: '/payment/record/' + recordId,
    method: 'delete'
  })
}
