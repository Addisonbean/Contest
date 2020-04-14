<template>
	<div>
		<ul class="attempt-list">
			<li v-for="a in attempts" :key="a.id">
				<p>{{ a.problem.title }}</p>

				<div class="cf">
					<p class="attempt-team">Team - {{ a.user.username }}</p>
					<router-link :to="linkForAttempt(a)" class="attempt-link">View submission</router-link>
				</div>
			</li>
		</ul>

	</div>
</template>

<script>
import { getAttemptsForCurrentContest } from '../api/attempt.js';

export default {
	name: 'attempts',
	data() {
		return {
			attempts: [],
		};
	},
	async created() {
		this.attempts = await getAttemptsForCurrentContest();
		console.log(this.attempts);
	},
	methods: {
		linkForAttempt: function(attempt) {
			return `/problem/${attempt.problem.id}/attempt/${attempt.id}`;
		}
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

.attempt-team {
	float: left;
}

.attempt-link {
	float: right;
}
</style>
