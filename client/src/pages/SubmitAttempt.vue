<template>
	<div>
		<div class="form-group">
			<label for="problem">Problem</label>
			<select id="problem" name="problem" v-model="problemId">
				<option disabled selected>
					Pick an option
				</option>
				<option
					v-for="p in problems"
					:key="p.id"
					:value="p.id"
				>
					{{ p.title }}
				</option>
			</select>
		</div>

		<div class="form-group">
			<label for="language">Language</label>
			<select id="language" name="language" v-model="language">
				<option disabled selected>
					Pick an option
				</option>
				<option value="python">Python</option>
				<option value="ruby">Ruby</option>
				<option value="haskell">Haskell</option>
				<option value="c++">C++</option>
				<option value="java">Java</option>
			</select>
		</div>

		<div class="form-group">
			<input type="file" @change="fileChanged" />
		</div>

		<div class="form-group">
			<button type="button" @click="submitForm">Submit</button>
		</div>
	</div>
</template>

<script>
import { getCurrentContestProblems } from '../api/contest.js';
import { submitAttempt } from '../api/attempt.js';

export default {
	name: 'submit-attempt',
	data() {
		const fileReader = new FileReader();
		fileReader.onload = this.fileLoaded;

		let problemId = this.$route.query.p;
		if (problemId === undefined || problemId === '') {
			problemId = null;
		}

		return {
			problems: [],
			uploadData: '',
			readyToSubmit: false,
			submissionAttempted: false,
			problemId,
			language: '',
			filename: '',
			fileReader,
		};
	},
	async created() {
		this.problems = await getCurrentContestProblems();
		console.log(this.problems);
	},
	methods: {
		fileChanged: function(e) {
			this.readyToSubmit = false;
			if (e.target.files.length === 0) return;

			this.filename = e.target.files[0].name;
			this.fileReader.readAsText(e.target.files[0], "UTF-8");
		},
		fileLoaded: function(e) {
			this.uploadData = btoa(e.target.result);
			this.readyToSubmit = true;
			if (this.submissionAttempted) {
				this.submitForm();
			}
		},
		submitForm: function() {
			this.submissionAttempted = true;
			if (this.readyToSubmit) {
				const data = {
					language: this.language,
					problemId: this.problemId,
					file: {
						contents: this.uploadData,
						filename: this.filename,
					},
				};
				submitAttempt(this.problemId, data);
			}
		},
	},
};
</script>
