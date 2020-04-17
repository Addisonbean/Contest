<template>
	<div class="container">
		<div class="section">
			<h2>Problem: {{ this.problem.title }}</h2>
		</div>

		<div class="section">
			<h2>Team: {{ this.attempt.user.username }}</h2>
		</div>

		<div class="section">
			<h2>Status</h2>
			<p>{{ this.attempt.status }}</p>
		</div>

		<div class="section">
			<h2>Input used</h2>
			<pre class="input">{{ this.problem.testInput }}</pre>
		</div>

		<div class="section outputs">
			<div>
				<h2>Runtime output</h2>
				<pre>{{ this.attempt.runtimeOutput }}</pre>
			</div>

			<div>
				<h2>Expected output</h2>
				<pre>{{ this.problem.expectedOutput }}</pre>
			</div>
		</div>

		<div class="section form-group">
			<label for="status">Status</label>
			<select class="select-status" id="status" v-model="status">
				<option value="accepted">Accept</option>
				<option value="wrong_answer">Wrong Answer</option>
			</select>
		</div>

		<button type="button" @click="submitForm">Submit</button>
	</div>
</template>

<script>
import { getAttempt, gradeAttempt } from '../api/attempt.js';
import { getProblem } from '../api/problem.js';

export default {
	name: 'grade-attempt',
	data() {
		return {
			status: '',
			problem: {},
			attempt: {
				user: {},
			},
		};
	},
	methods: {
		submitForm: async function() {
			if (this.status !== '') {
				await gradeAttempt(this.attempt.id, this.status);
			}
		},
	},
	async created() {
		// TODO: Ensure problem is the right one???
		let p = getProblem(this.$route.params.problem_id);
		let a = getAttempt(this.$route.params.id);

		this.problem = await p;
		this.attempt = await a;
	},
};
</script>

<style scoped>
	/* TODO */
	/* make h2 not bold, except the team name and prob name part */

	.container {
		width: 1500px;
	}

	.section {
		margin: 20px 0;
	}

	pre {
		color: #333;
		background-color: #ccc;
		text-align: left;
		padding: 15px;
	}

	.input {
		width: 50%;
		margin: 0 auto;
	}

	.outputs {
		display: flex;
		justify-content: space-evenly;
	}

	.outputs > div {
		width: 40%;
	}

	.select-status {
		margin-left: 15px;
	}
</style>
