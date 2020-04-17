<template>
	<div class="container">
		<div class="section">
			<h2>Problem: {{ this.problem.title }}</h2>
		</div>

		<div class="section">
			<h2>Team</h2>
			<p>{{ this.attempt.user.username }}</p>
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
			<h2>Input used</h2>
			<pre class="input">{{ this.problem.testInput }}</pre>
		</div>

		<div class="section">
			<div class="diff-viewer">
				<div>
					<h2>Expected output</h2>
					<div id="diff-expected">
						<pre v-for="l in expectedLines" :key="l.key"><span :class="l.class">{{ l.text }}</span></pre>
					</div>
				</div>

				<div>
					<h2>Runtime output</h2>
					<div id="diff-runtime">
						<pre v-for="l in runtimeLines" :key="l.key"><span :class="l.class">{{ l.text }}</span></pre>
					</div>
				</div>
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
import { formatDateTime } from '../api/util.js';

import * as Diff from 'diff';

export default {
	name: 'grade-attempt',
	data() {
		return {
			status: '',
			problem: {},
			attempt: {
				user: {},
			},
			expectedLines: [],
			runtimeLines: [],
		};
	},
	methods: {
		submitForm: async function() {
			if (this.status !== '') {
				await gradeAttempt(this.attempt.id, this.status);
			}
		},
		setupOutputDiff: function() {
			const diffs = Diff.diffLines(
				this.problem.expectedOutput + '\n',
				this.attempt.runtimeOutput + '\n',
			);
			console.log(diffs);
			let key = 0;
			const hasContext = /\S/;
			diffs.forEach(diff => {
				const text = diff.value;

				let blankClass = '';
				if (!hasContext.test(text)) {
					blankClass = ' blank';
					console.log(diff);
				}

				if (diff.added) {
					this.runtimeLines.push({ text, class: `diff-added${blankClass}`, key });
				} else if (diff.removed) {
					this.expectedLines.push({ text, class: `diff-removed${blankClass}`, key });
				} else {
					this.runtimeLines.push({ text, key });
					this.expectedLines.push({ text, key });
				}
				key++;
			});
		},
		formatDateTime,
	},
	async created() {
		// TODO: Ensure problem is the right one???
		let p = getProblem(this.$route.params.problem_id);
		let a = getAttempt(this.$route.params.id);

		this.problem = await p;
		this.attempt = await a;

		this.setupOutputDiff();
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

	.select-status {
		margin-left: 15px;
	}

	.diff-viewer {
		display: flex;
		justify-content: space-evenly;
	}

	.diff-viewer > div {
		width: 40%;
	}

	.diff-viewer > div > div {
		background-color: #ccc;
		padding: 15px;
	}

	.diff-viewer pre {
		margin: 0;
		padding: 0;
		overflow: visible;
	}

	.diff-added {
		background-color: rgba(0, 128, 0, 0.3);
	}

	.diff-removed {
		background-color: rgba(255, 0, 0, 0.3);
	}

	.diff-added.blank:before {
		content: '+';
	}

	.diff-removed.blank:before {
		content: '-';
	}

	.blank {
		left: -10px;
		position: relative;
	}
</style>
