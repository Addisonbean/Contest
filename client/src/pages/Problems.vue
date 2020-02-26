<template>
	<div>
        <li
			v-for="problem in problems"
			v-bind:key="problem.id"
		>
			<router-link :to="problemPath(problem)">
				{{ problem.title }}
			</router-link>
        </li>
	</div>
</template>

<script>
import { getCurrentContestProblems } from '../api/contest.js';

export default {
	name: 'problems',
	data() {
		return {
			problems: [],
		}
	},
	async created() {
		const res = await getCurrentContestProblems();
		this.problems = res.data.problems;
	},
	methods: {
		problemPath: function(problem) {
			return `/problems/${problem.title}`;
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
