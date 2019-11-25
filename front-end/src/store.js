import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)
/* eslint-disable no-console */
// root state object.
// each Vuex instance is just a single state tree.
export default new Vuex.Store({
    state: {},
    getters: {
        user: () => JSON.parse(sessionStorage.getItem('user'))
    },
    mutations: {
        login(state, user) {
            state;
            sessionStorage.setItem('user', JSON.stringify(user));
        },
        logout(state) {
            state;
            sessionStorage.removeItem('user');
        }
    }
})
// mutations are operations that actually mutates the state.
// each mutation handler gets the entire state tree as the
// first argument, followed by additional payload arguments.
// mutations must be synchronous and can be recorded by plugins
// for debugging purposes.
// const mutations = {
//     LOGIN(state) {
//         localStorage.setItem('user', state.user)
//         state.isAuth = true
//         localStorage.setItem('isAuth', state.isAuth)
//     },
//     LOGOUT(state) {
//         localStorage.removeItem('user')
//         state.isAuth = false
//         localStorage.removeItem('isAuth')
//     }
// }
// actions are functions that cause side effects and can involve
// asynchronous operations.
// const actions = {
//     LOGIN: (commit) => commit('LOGIN'),
//     LOGOUT: (commit) => commit('LOGOUT'),
// }

// getters are functions
// const getters = {}

// A Vuex instance is created by combining the state, mutations, actions,
// and getters.
// export default new Vuex.Store({
//     state,
//     getters,
//     actions,
//     mutations
// })