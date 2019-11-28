import Vue from 'vue'
import Router from 'vue-router'
import Main from './Main.vue'
import Qna from './Qna.vue'
import QnaWrite from './QnaWrite.vue'
import QnaPost from './QnaPost.vue'
import FoodInfo from './FoodInfo.vue'
import UserInfo from './UserInfo.vue'
import MyIntake from './MyIntake.vue'
import MyFriends from './MyFriends.vue'
import FriendIntake from './FriendIntake.vue'

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
        },
        {
            path: '/user_info',
            component: UserInfo
        },
        {
            path: '/my_intake',
            component: MyIntake
        },
        {
            path: '/my_friends',
            component: MyFriends
        },
        {
            path: '/friend_intake',
            component: FriendIntake
        }
    ]
})