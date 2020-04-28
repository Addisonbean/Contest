import Vue from 'vue';
import Vuex from 'vuex';

import { getCurrentUser, logout } from './api/user.js';
import { getCurrentContest } from './api/contest.js';

Vue.use(Vuex);

export default new Vuex.Store({
	state: {
		loggedIn: false,
		user: newEmptyUser(),
		contest: newEmptyContest(),
		isNavOpen: false,
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
		setContest: function(state, contest) {
			state.contest = contest;
		},
		setIsNavOpen: function(state, yesno){
			state.isNavOpen = yesno;
		},
		toggleNav: function(state){
			state.isNavOpen = !state.isNavOpen;
		}
	},
	actions: {
		initializeState: async function({ commit }) {
			let u = getCurrentUser();
			let c = getCurrentContest();

			try {
				u = await u;
				if (u) { commit('login', u) }
			} catch (e) {
				logout();
			}

			try {
				c = await c;
				if (c) { commit('setContest', c) }
			} catch (e) {
				console.log('ugh');
			}
		},
	},
});

function newEmptyUser() {
	return {
		id: 0,
		username: '',
		admin: false,
	};
}

function newEmptyContest() {
	return {
		id: 0,
		title: '',
		start_time: new Date(),
		end_time: new Date(),
		active: false,
	};
}
