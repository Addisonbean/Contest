import { apiRequest } from './util.js';
import localForage from 'localforage';

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
	return await localForage.setItem('authToken', res.data['auth_token']);
}

export { createUser, login };
