import Vue from 'vue'
import Main from './Main.vue'
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import VueSession from 'vue-session'
Vue.config.productionTip = false
Vue.use(BootstrapVue)
Vue.use(VueSession)

new Vue({
  render: h => h(Main),
}).$mount('#main')