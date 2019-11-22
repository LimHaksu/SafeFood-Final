import Vue from 'vue'
import Main from './Main.vue'
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

Vue.config.productionTip = false
Vue.use(BootstrapVue)
new Vue({
  render: h => h(Main),
  methods: {
    login() {
      axios
        .get("http://localhost:8080/login", )
        //.get('./emp.json')
        .then(response => (this.info = response.data))
        .catch(error => {
          console.log(error);
          this.errored = true;
        })
        .finally(() => (this.loading = false));
    }
  }
}).$mount('#main')