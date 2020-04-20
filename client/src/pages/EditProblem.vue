<template>
	<div v-if="Object.keys(problem).length">
		<div class="container">
			<div>
				<h1>{{problem.title}}</h1>
			</div>

			<div class="form-group">
				<label for="background-info">Background Info</label>
				<textarea id="background-info" v-model="problem.backgroundInfo" />
			</div>

			<div class="form-group">
				<label for="description">Description</label>
				<textarea id="description" v-model="problem.description" />
			</div>

			<div class="form-group">
				<label for="input-description">Input Description</label>
				<textarea id="input-description" v-model="problem.inputDescription" />
			</div>

			<div class="form-group">
				<label for="output-description">Output Description</label>
				<textarea id="output-description" v-model="problem.outputDescription" />
			</div>

			<div class="cf">
				<div class="input">
					<label for="example-input">Example Input</label>
					<textarea id="example-input" v-model="problem.exampleInput"></textarea>
				</div>
				<div class="output">
					<label for="example-output">Example Output</label>
					<textarea id="example-output" v-model="problem.exampleOutput"></textarea>
				</div>
			</div>

			<div class="cf">
				<div class="input real">
					<label for="test-input">Test Input</label>
					<textarea id="test-input" v-model="problem.testInput"></textarea>
				</div>
				<div class="output real">
					<label for="expected-ouput">Expected Output</label>
					<textarea id="expected-ouput" v-model="problem.expectedOutput"></textarea>
				</div>
			</div>

			<button @click="saveChanges">Save Changes</button>
		</div>
	</div>
	<div v-else>
		Problem not found
	</div>
</template>

<script>
import { getProblem, editProblem } from '../api/problem.js';

export default {
	name: 'problem-viewer',
	data() {
		return {
			problemId: this.$route.params.problem,
			problem: {},
		};
	},
	methods: {
		saveChanges: function() {
			editProblem(this.problem);
		},
	},
	async created() {
		try {
			this.problem = await getProblem(this.problemId, true);
		} catch (e) {
			this.problem = {};
		}
	},
};
</script>

<style scoped>
	.container {
        width: 100%;
		background: #f2f2f2;
		color: #2c3e50;
		margin-bottom: 20px;
		padding: 20px;
    }

	.input, .output {
        float: left; 
        box-sizing: border-box;
		padding: 5px;
    }

    .input {            
        width: 50%;
    }

    .output {
        width: 50%;
    }

	label {
		display: block;
	}

	textarea {
		height: 100px;
		width: 50%;
	}

	.input textarea, .output textarea {
		width: 100%;
	}

	.input.real textarea, .output.real textarea {
		height: 500px;
	}
</style>
