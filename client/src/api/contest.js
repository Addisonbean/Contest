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
		method: 'POST',
		path: '/contest/update',
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

function getCurrentScoreboard() {
	return apiRequest({
		method: 'GET',
		path: '/scoreboard',
	}).then(r => r.data.scoreboard);
}

function getContest(id) {
	return apiRequest({
		method: 'GET',
		path: `/contest/${id}`,
		auth: true,
	}).then(r => r.data.contest);
}

export { createContest, updateContest, getCurrentContestProblems, getCurrentContest, getCurrentScoreboard, getContest };
