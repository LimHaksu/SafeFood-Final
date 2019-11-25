import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

// root state object.
// each Vuex instance is just a single state tree.
const state = {
    user: localStorage.getItem('user'),
    isAuth: localStorage.getItem('isAuth')
}

// mutations are operations that actually mutates the state.
// each mutation handler gets the entire state tree as the
// first argument, followed by additional payload arguments.
// mutations must be synchronous and can be recorded by plugins
// for debugging purposes.
const mutations = {
    LOGIN(state) {
        localStorage.setItem('user', state.user)
        state.isAuth = true
        localStorage.setItem('isAuth', state.isAuth)
    },
    LOGOUT(state) {
        localStorage.removeItem('user')
        state.isAuth = false
        localStorage.removeItem('isAuth')
    }
}
// actions are functions that cause side effects and can involve
// asynchronous operations.
const actions = {
    LOGIN: (commit) => commit('LOGIN'),
    LOGOUT: (commit) => commit('LOGOUT'),
}

// getters are functions
const getters = {}

// A Vuex instance is created by combining the state, mutations, actions,
// and getters.
export default new Vuex.Store({
    state,
    getters,
    actions,
    mutations
})