import store from '@/store'

/**
 * @param {Array} value
 * @returns {Boolean}
 * @example see @/views/permission/directive.vue
 */
export default function checkPermission(value) {
  if (!value) {
    throw new Error(`权限不能为空! 例如 v-permission="'sys:config:save'",v-permission="['sys:config:save','sys:config:update']"`)
  }
  if (typeof value === 'string' && value !== '') {
    value = [value]
  }
  if (!(value instanceof Array && value.length > 0)) {
    throw new Error(`权限不能为空! 例如 v-permission="'sys:config:save'",v-permission="['sys:config:save','sys:config:update']"`)
  }

  const permissions = value
  const allPermissions = store.getters && store.getters.permissions
  return permissions.some(permission => {
    if (!permission.indexOf(',')) {
      return allPermissions.includes(permission)
    } else {
      const permissionSubAnds = permission.split(',')
      return permissionSubAnds.every(permissionSubAdd => {
        return allPermissions.includes(permissionSubAdd)
      })
    }
  })
}
