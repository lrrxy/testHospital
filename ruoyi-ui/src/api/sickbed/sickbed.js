import request from '@/utils/request'

// 查询病床信息列表
export function listSickbed(query) {
  return request({
    url: '/sickbed/sickbed/list',
    method: 'get',
    params: query
  })
}

// 查询病床信息详细
export function getSickbed(sickbedId) {
  return request({
    url: '/sickbed/sickbed/' + sickbedId,
    method: 'get'
  })
}

// 新增病床信息
export function addSickbed(data) {
  return request({
    url: '/sickbed/sickbed',
    method: 'post',
    data: data
  })
}

// 修改病床信息
export function updateSickbed(data) {
  return request({
    url: '/sickbed/sickbed',
    method: 'put',
    data: data
  })
}

// 删除病床信息
export function delSickbed(sickbedId) {
  return request({
    url: '/sickbed/sickbed/' + sickbedId,
    method: 'delete'
  })
}
