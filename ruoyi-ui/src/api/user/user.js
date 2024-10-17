import request from '@/utils/request'

// 查询病人信息列表
export function listUser(query) {
  return request({
    url: '/user/user/list',
    method: 'get',
    params: query
  })
}

// 查询病人信息详细
export function getUser(userId) {
  return request({
    url: '/user/user/' + userId,
    method: 'get'
  })
}

// 新增病人信息
export function addUser(data) {
  return request({
    url: '/user/user',
    method: 'post',
    data: data
  })
}

// 修改病人信息
export function updateUser(data) {
  return request({
    url: '/user/user',
    method: 'put',
    data: data
  })
}

// 删除病人信息
export function delUser(userId) {
  return request({
    url: '/user/user/' + userId,
    method: 'delete'
  })
}
