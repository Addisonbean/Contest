import { apiRequest } from './util.js';

function createUser(user) {
	return apiRequest({
		path: '/signup',
		method: 'POST',
		body: user,
	});
}

// function login(user) {
	// return apiRequest({
		// path: '/login',
		// method: 'POST',
		// body: user,
	// });
// }

export { createUser };
