import { apiRequest } from './util.js';
import store from '../store.js';
import localForage from 'localforage';

async function getCurrentUser() {
	const token = await localForage.getItem('authToken');
	if (token) {
		const res = apiRequest({
			path: '/user',
			method: 'GET',
			auth: true,
		});
		return res.data.user;
	}
}

function createUser(user) {
	return apiRequest({
		path: '/signup',
		method: 'POST',
		body: { user },
	});
}

async function login(user) {
	let res = await apiRequest({
		path: '/login',
		method: 'POST',
		body: { user },
	});
	store.commit('login', res.data.user);
	localForage.setItem('authToken', res.data['auth_token']);
}

export { getCurrentUser, createUser, login };
