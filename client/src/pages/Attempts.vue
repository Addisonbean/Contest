<template>
	<div>
		<ul class="attempt-list">
			<li v-for="a in attempts" :key="a.id">
				<div class="cf">
					<p class="left">{{ a.problem.title }}</p>
					<p class="right">{{ formatDateTime(a.createdAt) }}</p>
				</div>

				<div class="cf">
					<p class="left">Team - {{ a.user.username }}</p>
					<router-link :to="linkForAttempt(a)" class="right">View submission</router-link>
				</div>
			</li>
		</ul>

	</div>
</template>

<script>
import { getAttemptsForCurrentContest } from '../api/attempt.js';
import { formatDateTime } from '../api/util.js';

export default {
	name: 'attempts',
	data() {
		return {
			attempts: [],
		};
	},
	async created() {
		this.attempts = await getAttemptsForCurrentContest();
		this.attempts.sort((a, b) => new Date(b.createdAt) - new Date(a.createdAt));
	},
	methods: {
		linkForAttempt: function(attempt) {
			return `/problem/${attempt.problem.id}/attempt/${attempt.id}`;
		},
		formatDateTime,
	},
};
</script>

<style scoped>
.attempt-list {
	width: 400px;
	margin: 0 auto;
	list-style: none;
	padding: 0;
}

.attempt-list li {
	margin: 20px 0;
	text-align: center;
	border-bottom: 1px solid #555;
	text-align: left;
}

.left {
	float: left;
}

.right {
	float: right;
}
</style>
