import request from '@/utils/request'

// 查询病例订单信息列表
export function listCase(query) {
  return request({
    url: '/case/case/list',
    method: 'get',
    params: query
  })
}

// 查询病例订单信息详细
export function getCase(bingliCaseId) {
  return request({
    url: '/case/case/' + bingliCaseId,
    method: 'get'
  })
}

// 新增病例订单信息
export function addCase(data) {
  return request({
    url: '/case/case',
    method: 'post',
    data: data
  })
}

// 修改病例订单信息
export function updateCase(data) {
  return request({
    url: '/case/case',
    method: 'put',
    data: data
  })
}

// 删除病例订单信息
export function delCase(bingliCaseId) {
  return request({
    url: '/case/case/' + bingliCaseId,
    method: 'delete'
  })
}
