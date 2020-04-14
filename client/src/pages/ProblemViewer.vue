<template>
	<div v-if="Object.keys(problem).length">
		<div class="container">
			<div>
				<h1>{{problem.title}}</h1>
			</div>
			<p>{{problem.backgroundInfo}}</p>
			<p>{{problem.description}}</p>
			<h2>Input Description</h2>
			<p>{{problem.inputDescription}}</p>
			<h2>Output Description</h2>
			<p>{{problem.outputDescription}}</p>
			<div class="wrapper clearfix">
				<div class="input">
					<h3>Example Input</h3>
					<div class="console">
						<p>{{problem.exampleInput}}</p>
					</div>
				</div>
				<div class="output">
					<h3>Example Output</h3>
					<div class="console">
						<p>{{problem.exampleOutput}}</p>
					</div>
				</div>
			</div>

			<router-link :to="submitLink">Submit this problem</router-link>
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
	computed: {
		submitLink: function() {
			return `/contest/submit?p=${this.problem.id}`;
		},
	},
	async created() {
		try {
			this.problem = await getProblem(this.problemName);
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
	p {
		text-align: left;
	}
	.container {
        width: 100%;
        background: #f2f2f2; 
    }
	.input, .output {
        float: left; 
        min-height: 250px;
        box-sizing: border-box;
    }
    .input {            
        width: 50%;
    }
    .output {
        width: 50%;
    }
	.console {
		font-family: "Lucida Console", Courier, monospace;
		font-size: 14px;
		padding: 10px;
        background: #d4d7dc;
		min-height: 195px;
		border: solid 1px;
	}
	.clearfix:after {
        content: ".";
        display: block;
        height: 0;
        clear: both;
        visibility: hidden;
    }
</style>
