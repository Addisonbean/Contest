import localForage from 'localforage';
import camelcaseKeys from 'camelcase-keys';
import snakeCaseKeys from 'snakecase-keys';

import { apiUrl } from '../env.js';

async function apiRequest({ method, path, headers = {}, body = null, auth = false }) {
	if (auth) {
		let authToken = await localForage.getItem('authToken');
		headers = { ...headers, Authorization: authToken };
	}
	const res = await fetch(`${apiUrl}${path}`, {
		method,
		headers: {
			Accept: 'application/json',
			'Content-Type': 'application/json',
			...headers,
		},
		body: body !== null ? JSON.stringify(snakeCaseKeys(body)) : null,
	});
	const json = camelcaseKeys(await res.json());
	if (res.status === 200) {
		return { data: json, status: res.status };
	} else {
		const e = new Error();
		e.data = json;
		e.status = res.status;
		throw e;
	}
	// TODO: throw an error if not 200 OK
}

export { apiRequest };
