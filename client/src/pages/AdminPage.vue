<template>
	<div>
		<h2>Judge Menu</h2>

		<h3>Current contest</h3>
		<ul class= "navList">
			<li>
				<router-link to="/attempts">View attempts</router-link>
			</li>
		</ul>
		<h3>General links</h3>
		<ul class = "navList">
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

<style>
.navList{	
	list-style-type: none;
}
ul>li>a{
	text-decoration: none!important;
	color: #ffffff;
	font-size: 1.5rem;
	display: block;
	padding-right: 2.5rem;
}
</style>
