import Vue from 'vue'
import Router from 'vue-router'

import App from '../App'

Vue.use(Router)

export default new Router({
  mode: 'history',  // removes the '#' in the url
  routes: [
    { path: '/', name: 'app', component: App}  // going to / in the url routes you to the App.vue component
  ]
})