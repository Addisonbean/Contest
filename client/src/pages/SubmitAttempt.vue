<template>
	<div>
		<error-msg :api-error="apiError" :errors="errors" />
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
import ErrorMsg from '../components/ErrorMsg.vue';

export default {
	name: 'submit-attempt',
	components: { ErrorMsg },
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
			errors: [],
			apiError: {},
			fileUploadStarted: false,
		};
	},
	async created() {
		this.problems = await getCurrentContestProblems();
		console.log(this.problems);
	},
	methods: {
		fileChanged: function(e) {
			this.readyToSubmit = false;
			this.fileUploadStarted = e.target.files.length > 0;
			if (e.target.files.length === 0) return;

			this.filename = e.target.files[0].name;
			this.fileReader.readAsText(e.target.files[0], "UTF-8");
		},
		fileLoaded: function(e) {
			try {
				this.uploadData = btoa(e.target.result);
			} catch (e) {
				this.errors = ['Failed to read file as UTF-8. Please make sure you are submitting source code and not a compiled binary.'];
				return;
			}
			this.readyToSubmit = true;
			if (this.submissionAttempted) {
				this.submitForm();
			}
		},
		submitForm: async function() {
			this.submissionAttempted = true;
			if (this.readyToSubmit) {
				this.errors = [];
				this.apiError = {};
				const data = {
					language: this.language,
					problemId: this.problemId,
					file: {
						contents: this.uploadData,
						filename: this.filename,
					},
				};
				try {
					await submitAttempt(this.problemId, data);
				} catch (e) {
					this.apiError = e.data;
				}
			} else if (!this.fileUploadStarted) {
				this.errors = ['Please upload a file'];
			}
		},
	},
};
</script>
