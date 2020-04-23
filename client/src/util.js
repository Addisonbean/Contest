import moment from 'moment';

function formatDateTime(dateTimeLike) {
	return moment(dateTimeLike).format('h:mm:ss A, MM/DD/YY');
}

export { formatDateTime };
