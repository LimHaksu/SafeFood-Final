import Vue from 'vue'
import App from './App.vue'
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import VueSession from 'vue-session'
import router from './components'
Vue.config.productionTip = false
Vue.use(BootstrapVue)
Vue.use(VueSession)

new Vue({
  el: '#app',
  render: h => h(App),
  router
}).$mount('#app')