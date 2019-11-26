import Vue from 'vue'
import App from './App.vue'
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import router from './components'
import store from './store'
import VueCharts from 'vue-chartjs'
import VueI18n from 'vue-i18n'
// import i18n from 'i18n-js'
Vue.config.productionTip = false
Vue.use(BootstrapVue)
Vue.use(VueCharts)
Vue.use(VueI18n)
import {
  messages
} from 'vue-bootstrap-calendar'; // you can include your own translation here if you want!

window.i18n = new VueI18n({
  locale: 'en',
  messages
});
new Vue({
  el: '#app',
  i18n: window.i18n,
  render: h => h(App),
  router,
  store
}).$mount('#app')