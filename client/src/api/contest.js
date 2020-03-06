import { apiRequest } from './util.js';

function createContest(contest) {
	return apiRequest({
		method: 'POST',
		path: '/contest',
		auth: true,
		body: { contest },
	}).then(r => r.data.contest);
}

function updateContest(contest) {
	return apiRequest({
		method: 'PUT',
		path: '/contest',
		auth: true,
		body: { contest },
	}).then(r => r.data.contest);
}

function getCurrentContestProblems() {
	return apiRequest({
		method: 'GET',
		path: '/contest/problems',
	}).then(r => r.data.problems);
}

function getCurrentContest() {
	return apiRequest({
		method: 'GET',
		path: '/contest',
	}).then(r => r.data.contest);
}

export { createContest, updateContest, getCurrentContestProblems, getCurrentContest };
