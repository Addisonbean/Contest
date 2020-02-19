import { apiRequest } from './util.js';

function createContest(contest) {
	return apiRequest({
		method: 'POST',
		path: '/contest',
		auth: true,
		body: { contest },
	});
}

export { createContest };
