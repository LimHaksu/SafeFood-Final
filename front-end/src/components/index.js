import Vue from 'vue'
import Router from 'vue-router'
import Main from './Main.vue'
import Qna from './Qna.vue'
import QnaWrite from './QnaWrite.vue'
import QnaPost from './QnaPost.vue'
import FoodInfo from './FoodInfo.vue'
Vue.use(Router)
export default new Router({
    mode: "history",
    routes: [{
            path: '/',
            component: Main
        },
        {
            path: '/qna',
            component: Qna
        },
        {
            path: '/qna_write',
            component: QnaWrite
        },
        {
            path: '/qna_post',
            component: QnaPost
        },
        {
            path: '/food_info',
            component: FoodInfo
        }
    ]
})