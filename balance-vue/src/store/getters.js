const getters = {
  sidebar: state => state.app.sidebar,
  device: state => state.app.device,
  size: state => state.app.size,
  token: state => state.user.token,
  avatar: state => state.user.avatar,
  defaultAvatar: state => state.user.defaultAvatar,
  name: state => state.user.name,
  sysUser: state => state.user.sysUser,
  sysRole: state => state.user.sysRole,
  sysRoles: state => state.user.sysRoles,
  sysOrg: state => state.user.sysOrg,
  funcIds: state => state.user.funcIds,
  permissions: state => state.user.permissions,
  menuList: state => state.user.menuList,
  routes: state => state.permission.routes,
  addRoutes: state => state.permission.addRoutes,
  visitedViews: state => state.tagsView.visitedViews,
  cachedViews: state => state.tagsView.cachedViews
}
export default getters
