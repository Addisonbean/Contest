<template>
	<div>
		<form>
			<div class="form-group">
				<label for="title">Title</label>
				<input class="form-control" type="text" id="title" v-model="problem.title" />
			</div>
			<div class="form-group">
				<label for="description">Description</label>
				<textarea class="form-control" id="description" v-model="problem.description"></textarea>
			</div>
			<div class="form-group">
				<label for="background-info">Background Information</label>
				<textarea class="form-control" id="background-info" v-model="problem.backgroundInfo"></textarea>
			</div>
			<div class="form-group">
				<label for="input-description">Input Description</label>
				<textarea class="form-control" id="input-description" v-model="problem.inputDescription"></textarea>
			</div>
			<div class="form-group">
				<label for="output-description">Output Description</label>
				<textarea class="form-control" id="output-description" v-model="problem.outputDescription"></textarea>
			</div>
			<div class="form-group">
				<label for="example-input">Example Input</label>
				<textarea class="form-control" id="example-input" v-model="problem.exampleInput"></textarea>
			</div>
			<div class="form-group">
				<label for="example-output">Example Output</label>
				<textarea class="form-control" id="example-output" v-model="problem.exampleOutput"></textarea>
			</div>
			<div class="form-group">
				<label for="test-input">Test Input</label>
				<textarea class="form-control" id="test-input" v-model="problem.testInput"></textarea>
			</div>
			<div class="form-group">
				<label for="expected-output">Expected Output</label>
				<textarea class="form-control" id="expected-output" v-model="problem.expectedOutput"></textarea>
			</div>
			<div class="form-group">
				<input class="form-check-input" type="checkbox" id="add-to-current-contest" v-model="addToCurrentContest" />
				<label for="add-to-current-contest" class="form-check-label">Add to current contest?</label>
			</div>
			<button type="button" class="btn btn-primary" @click="submitForm">Create problem</button>
		</form>
	</div>
</template>

<script>
import { createProblem } from '../api/problem.js';

export default {
	name: 'create-problem',
	data() {
		return {
			problem: {
				title: '',
				description: '',
				backgroundInfo: '',
				inputDescription: '',
				outputDescription: '',
				exampleInput: '',
				exampleOutput: '',
				testInput: '',
				expectedOutput: '',
			},
			addToCurrentContest: false,
		};
	},
	methods: {
		submitForm: async function() {
			const problem = await createProblem(this.problem, {
				addToCurrentContest: this.addToCurrentContest,
			});
			this.$router.push(`/problems/${problem.title}`);
		},
	},
};
</script>

<style scoped>
form {
	width: 500px;
	margin: 20px auto;
}
</style>
