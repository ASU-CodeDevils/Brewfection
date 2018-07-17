// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'  // for different routes
import { store } from './store'  // to work with state

Vue.config.productionTip = false

new Vue({
  el: '#app',
  router,  // include in the vue instance
  store,  // include in the vue instance
  template: '<App/>',
  components: { App }
})
