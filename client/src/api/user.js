import { apiUrl } from '../env.js';

async function apiRequest({ method, path, headers = {}, body = null }) {
	const res = await fetch(`${apiUrl}${path}`, {
		method,
		headers: {
			Accept: 'application/json',
			'Content-Type': 'application/json',
			...headers,
		},
		body: body !== null ? JSON.stringify(body) : null,
	});
	const json = await res.json();
	return { data: json, status: res.status };
}

function createUser(user) {
	return apiRequest({
		path: '/signup',
		method: 'POST',
		body: user,
	});
}

export { createUser };
