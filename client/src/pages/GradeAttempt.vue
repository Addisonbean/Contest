<template>
	<div>
		<h2>Problem: {{ this.problem.title }}</h2>

		<h2>Team: {{ this.attempt.user.username }}</h2>

		<h2>Input used</h2>
		<pre>{{ this.problem.testInput }}</pre>

		<h2>Expected output</h2>
		<pre>{{ this.problem.expectedOutput }}</pre>

		<h2>Runtime output</h2>
		<pre>{{ this.attempt.runtimeOutput }}</pre>

		<h2>Status</h2>
		<pre>{{ this.attempt.status }}</pre>

		<div class="form-group">
			<label for="status">Status</label>
			<select id="status" v-model="status">
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

<style>
</style>
