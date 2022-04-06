import store from '@/store'

export const AuthRequired = function (to, from, next) {
  let token = store.getters.token
  if (token) {
    next()
  } else {
    localStorage.removeItem('user')
    localStorage.removeItem('token')
    next('/')
  }
}

export const NotAuthRequired = function (to, from, next) {
  let token = store.getters.token
  if (!token) {
    next()
  } else {
    next('/home/vaccines');
  }
}