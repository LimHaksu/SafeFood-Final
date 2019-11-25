import Vue from 'vue'
import Router from 'vue-router'
import Main from './Main.vue'
import Board from './Board.vue'
Vue.use(Router)
export default new Router({
    mode: "history",
    routes: [{
            path: '/',
            component: Main
        },
        {
            path: '/qna',
            component: Board
        }
    ]
})