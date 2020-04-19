<template>
	<div>
		<h2>Judge Menu</h2>

		<h3>Current contest</h3>
		<ul>
			<li>
				<router-link to="/attempts">View attempts</router-link>
			</li>
		</ul>
		<h3>General links</h3>
		<ul>
			<li>
				<router-link to="/contest/new">Add new contest</router-link>
			</li>
			<li>
				<router-link to="/problem/new">Add new problem</router-link>
			</li>
			<li>
				<router-link to="/signup">Add new user</router-link>
			</li>
		</ul>
	</div>
</template>

<script>
export default {
	name: 'admin-page',
};
</script>

<style scoped>
ul {
	list-style-type: none;
	padding: 0;
}
</style>
