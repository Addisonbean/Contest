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
						<p><pre>{{problem.exampleInput}}</pre></p>
					</div>
				</div>
				<div class="output">
					<h3>Example Output</h3>
					<div class="console">
						<p><pre>{{problem.exampleOutput}}</pre></p>
					</div>
				</div>
			</div>
			<div>
				<router-link :to="submitLink">
					<button class="space_after">Submit a Solution</button>
				</router-link>
			</div>
			<div>
				<router-link :to="editLink" v-if="user.admin">
					<button class="space_after">Edit problem</button>
				</router-link>
			</div>
		</div>
	</div>
	<div v-else>
		Problem not found
	</div>
</template>

<script>
import { mapState } from 'vuex';
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
		editLink: function() {
			return `/problems/${this.problem.id}/edit`;
		},
		...mapState(['user']),
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
		background: rgba(240, 240, 240, 0.9);
		color: #2c3e50;
		padding: 30px;
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
	.console {
		font-family: "Lucida Console", Courier, monospace;
		font-size: 14px;
		padding: 10px;
        background: #d4d7dc;
		border: solid 1px;
	}
	.clearfix:after {
        content: ".";
        display: block;
        height: 0;
        clear: both;
        visibility: hidden;
    }
	.space_after {
		margin: 10px;
	}
</style>
