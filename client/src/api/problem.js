import { apiRequest } from './util.js';

function getProblem(idOrTitle) {
	return apiRequest({
		method: 'GET',
		path: `/problem/${encodeURIComponent(idOrTitle)}`,
	});
}

export { getProblem };
