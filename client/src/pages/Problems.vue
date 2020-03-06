<template>
	<div>
		<h1>{{ contest.title }}</h1>

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
import { mapState } from 'vuex';
import { getCurrentContestProblems } from '../api/contest.js';

export default {
	name: 'problems',
	computed: mapState(['contest']),
	data() {
		return {
			problems: [],
		}
	},
	async created() {
		this.problems = await getCurrentContestProblems();
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
