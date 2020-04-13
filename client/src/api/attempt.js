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

export { submitAttempt, getAttempt, gradeAttempt };