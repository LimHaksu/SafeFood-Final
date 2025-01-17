import Vue from 'vue'
import App from './App.vue'
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import router from './components'
import store from './store'
import VueCharts from 'vue-chartjs'
import FullCalendar from 'vue-full-calendar'
Vue.config.productionTip = false
Vue.use(BootstrapVue)
Vue.use(VueCharts)
Vue.use(FullCalendar)
new Vue({
  el: '#app',
  render: h => h(App),
  router,
  store
}).$mount('#app')
  