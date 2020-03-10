import Vue from 'vue';
import Vuex from 'vuex';

import { getCurrentUser } from './api/user.js';
import { getCurrentContest } from './api/contest.js';

Vue.use(Vuex);

export default new Vuex.Store({
	state: {
		loggedIn: false,
		user: newEmptyUser(),
		contest: newEmptyContest(),
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
	},
	actions: {
		initializeState: function({ commit }) {
			getCurrentUser().then(u => commit('login', u));
			getCurrentContest().then(c => commit('setContest', c));
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
