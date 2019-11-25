import Vue from 'vue'
import Main from './Main.vue'
import Router from 'vue-router'
Vue.use(Router)
export default new Router({
    mode: "history",
    routes: [{
        path: '/',
        component: Main
    }]
})