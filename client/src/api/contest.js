import { apiRequest } from './util.js';

function createContest(contest) {
	return apiRequest({
		method: 'POST',
		path: '/contest',
		auth: true,
		body: { contest },
	});
}

function updateContest(contest) {
	return apiRequest({
		method: 'PUT',
		path: '/contest',
		auth: true,
		body: { contest },
	});
}

function getCurrentContestProblems() {
	return apiRequest({
		method: 'GET',
		path: '/contest/problems',
	});
}

function getCurrentContest() {
	return apiRequest({
		method: 'GET',
		path: '/contest',
	});
}

export { createContest, updateContest, getCurrentContestProblems, getCurrentContest };
