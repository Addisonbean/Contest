<template>
	<div>
		<h2>Judge Menu</h2>

		<h3>Current contest</h3>
		<ul>
			<li>
				<router-link to="/attempts"><button>View attempts</button></router-link>
			</li>
		</ul>
		<h3>General links</h3>
		<ul>
			<li>
				<router-link to="/contest/new"><button>Add new contest</button></router-link>
			</li><br>
			<li>
				<router-link to="/problem/new"><button>Add new problem</button></router-link>
			</li><br>
			<li>
				<router-link to="/signup"><button>Add new user</button></router-link>
			</li><br>
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
