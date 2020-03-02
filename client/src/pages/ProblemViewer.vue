<template>
	<div v-if="Object.keys(problem).length">
		<div>
			<h1>{{problem.title}}</h1>
			<p>{{problem.backgroundInfo}}</p>
			<p>{{problem.description}}</p>
			<h1>Input Description</h1>
			<p>{{problem.inputDescription}}</p>
			<h1>Output Description</h1>
			<p>{{problem.outputDescription}}</p>
			<h1>Example Input</h1>
			<p>{{problem.exampleInput}}</p>
			<h1>Example Output</h1>
			<p>{{problem.exampleOutput}}</p>
		</div>
	</div>
	<div v-else>
		Problem not found
	</div>
</template>

<script>
import { getProblem } from '../api/problem.js';

export default {
	name: 'problem-viewer',
	data() {
		return {
			problemName: this.$route.params.problem,
			problem: {},
		};
	},
	async created() {
		try {
			const res = await getProblem(this.problemName);
			this.problem = res.data.problem;
		} catch (e) {
			this.problem = {};
		}
	},
};
</script>

<style scoped>
	h2 {
		text-align: center;
	}
	ul{
		text-align: left;
	}
</style>
