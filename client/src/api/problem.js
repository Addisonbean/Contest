import { apiRequest } from './util.js';

function getProblem(idOrTitle) {
	return apiRequest({
		method: 'GET',
		path: `/problem/${encodeURIComponent(idOrTitle)}`,
	});
}

function createProblem(problem, { addToCurrentContest = false }) {
	return apiRequest({
		method: 'POST',
		path: '/problem',
		body: { problem, addToCurrentContest },
		auth: true,
	});
}

export { getProblem, createProblem };
