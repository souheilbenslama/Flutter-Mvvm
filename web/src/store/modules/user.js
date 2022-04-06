export default {
  state: {
    currentUser: localStorage.getItem('user') != null ? JSON.parse(localStorage.getItem('user')) : null,
    token: null,
  },
  getters: {
    currentUser: state => state.currentUser,
    token: state => state.token,
  },
  mutations: {
    setUser(state, payload) {
      state.currentUser = payload.user
      state.token = payload.token
    },
    setLogout(state) {
      state.currentUser = null
      state.token = null
    },
  },
  actions: {
    setUser({ commit }, payload) {
        localStorage.setItem('user', JSON.stringify(payload.user))
        localStorage.setItem('token', payload.token)
        commit('setUser', payload)
    },
    signOut({ commit }) {
        localStorage.removeItem('user')
        localStorage.removeItem('token')
        commit('setLogout')
    }
  }
}
