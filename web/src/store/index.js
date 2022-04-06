import Vue from 'vue'
import Vuex from 'vuex'

//Make Vuex persisted 
import createPersistedState from 'vuex-persistedstate'

import user from './modules/user'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {},
  mutations: {},
  actions: {},
  modules: {
    user,
  },
  plugins: [createPersistedState()],
})
