import Vue from 'vue';
import Vuex from 'vuex';

import { getCurrentUser } from './api/user.js';

Vue.use(Vuex);

export default new Vuex.Store({
	state: {
		loggedIn: false,
		user: newEmptyUser(),
	},
	mutations: {
		login: function(state, user) {
			state.user = user;
			state.loggedIn = true;
		},
		logout: function(state) {
			state.user = newEmptyUser(),
			state.loggedIn = false;
		},
	},
	actions: {
		initializeState: async function({ commit }) {
			const u = await getCurrentUser();
			if (u) {
				commit('login', u);
			}
		},
	},
});

function newEmptyUser() {
	return {
		id: 0,
		username: '',
	};
}
