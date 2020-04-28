import { apiRequest } from './util.js';

// TODO: does this work???
function submitAttempt(problemId, attempt) {
	return apiRequest({
		method: 'POST',
		path: `/problem/${problemId}/attempt`,
		auth: true,
		body: { attempt },
	});
}

function getAttempt(id) {
	return apiRequest({
		method: 'GET',
		path: `/attempt/${id}`,
		auth: true,
	}).then(r => r.data.attempt);
}

function gradeAttempt(id, newStatus) {
	return apiRequest({
		method: 'POST',
		path: `/attempt/${id}/grade`,
		auth: true,
		body: {
			attempt: {
				status: newStatus,
				id,
			}
		},
	});
}

function getAttemptsForCurrentContest() {
	return apiRequest({
		method: 'GET',
		path: '/contest/attempts',
		auth: true,
	}).then(r => r.data.attempts);
}

function getMyAttempts() {
	return apiRequest({
		method: 'GET',
		path: '/attempts',
		auth: true,
	}).then(r => r.data.attempts);
}

export { submitAttempt, getAttempt, gradeAttempt, getAttemptsForCurrentContest, getMyAttempts };
