import { apiRequest } from './util.js';

function getProblem(idOrTitle) {
	return apiRequest({
		method: 'GET',
		path: `/problem/${encodeURIComponent(idOrTitle)}`,
	}).then(r => r.data.problem);
}

function createProblem(problem, { addToCurrentContest = false }) {
	return apiRequest({
		method: 'POST',
		path: '/problem',
		body: { problem, addToCurrentContest },
		auth: true,
	}).then(r => r.data.problem);
}

function submitAttempt(problemId, attempt) {
	return apiRequest({
		method: 'POST',
		path: `/problem/${problemId}/attempt`,
		auth: true,
		body: { attempt },
	});
}

export { getProblem, createProblem, submitAttempt };
