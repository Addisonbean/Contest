<template>
	<div>
		<h1>Some header text...</h1>

		<h2>
			Go to current contest
		</h2>

		<h2>
			<router-link to="/login">Log in</router-link> (if not already...)
		</h2>
	</div>
</template>

<script>
export default {
	name: 'Home',
};
</script>

<style scoped>
h2 {
	text-align: center;
}
</style>
