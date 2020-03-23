import { apiRequest } from './util.js';
import store from '../store.js';
import localForage from 'localforage';

async function getCurrentUser() {
	const token = await localForage.getItem('authToken');
	if (token) {
		try {
			const res = await apiRequest({
				path: '/user',
				method: 'GET',
				auth: true,
			});
			return res.data.user;
		} catch {
			await localForage.removeItem('authToken');
			return null;
		}
	}
}

function createUser(user) {
	return apiRequest({
		path: '/signup',
		method: 'POST',
		body: { user },
		auth: true,
	}).then(r => r.data.user);
}

async function login(user) {
	let res = await apiRequest({
		path: '/login',
		method: 'POST',
		body: { user },
	});
	store.commit('login', res.data.user);
	await localForage.setItem('authToken', res.data.authToken);
	return res.data.user;
}

function logout() {
	store.commit('logout');
	localForage.removeItem('authToken');
}

export { getCurrentUser, createUser, login, logout };
