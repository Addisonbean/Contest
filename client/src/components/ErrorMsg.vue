<template>
	<div class="error-container" v-if="formattedErrors.length">
		<h1>The following errors occurred:</h1>
		<ul>
			<li v-for="(e, i) in formattedErrors" :key="i">{{ e }}</li>
		</ul>
	</div>
</template>

<script>
export default {
	name: 'error-msg',
	props: ['errors'],
	computed: {
		formattedErrors: function() {
			if (Array.isArray(this.errors)) {
				return this.errors;
			} else if (typeof this.errors === 'string') {
				return [this.errors];
			} else {
				let errors = [];
				for (let [key, value] of Object.entries(this.errors)) {
					errors.push(`${key} ${value}`);
				}
				return errors;
			}
		},
	},
};
</script>

<style scoped>
h1 {
	font-size: 1.4em;
}

.error-container {
	width: 500px;
	margin: 15px auto;
	padding: 15px;

	border: 1px solid #d48888;
	border-radius: 8px;
	background-color: #af403f;
	color: white;
}

ul {
	list-style-type: '-  ';
	text-align: left;
}
</style>
