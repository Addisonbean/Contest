<template>
	<div class="container">
		<div class="section">
			<h2>Problem: {{ this.problem.title }}</h2>
		</div>

		<div class="section">
			<h2>Time submitted</h2>
			<p>{{ formatDateTime(this.attempt.createdAt) }}</p>
		</div>

		<div class="section">
			<h2>Status</h2>
			<p>{{ this.attempt.status }}</p>
		</div>

		<div class="section">
			<h2>Language</h2>
			<p>{{ this.attempt.language }}</p>
		</div>

		<div class="section">
			<h3>{{ this.attempt.file.filename }}</h3>
			<p><pre class="source-code">{{ this.attempt.file.data }}</pre></p>
		</div>
	</div>
</template>

<script>
import { getAttempt } from '../api/attempt.js';
import { getProblem } from '../api/problem.js';
import { formatDateTime } from '../util.js';

export default {
	name: 'view-attempt',
	data() {
		return {
			problem: {},
			attempt: {
				user: {},
				file: {},
			},
		};
	},
	methods: {
		formatDateTime,
	},
	async created() {
		// TODO: Ensure problem is the right one???
		let p = getProblem(this.$route.params.problem_id, true);
		let a = getAttempt(this.$route.params.id);

		this.problem = await p;
		this.attempt = await a;
	},
};
</script>

<style scoped>
	.container {
		width: 1500px;
	}

	.section {
		margin: 20px 0;
	}

	.source-code {
		text-align: left;
		color: #333;
		background-color: #ccc;
		padding: 15px;
	}
</style>
