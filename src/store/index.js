import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

import UserStore from './UserStore'
import BeerStore from './BeerStore'

export const store = new Vuex.Store({

  /*
    Different stores(state) have been separated and imported here in a single index file
    The stores can get pretty big and splitting them up keeps them more organized
   */
  modules: {
    UserStore: UserStore,
    BeerStore: BeerStore
  }
})