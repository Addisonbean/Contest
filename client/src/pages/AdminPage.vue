<template>
	<div>
		<h2>Judge Menu</h2>

		<h3>Current contest</h3>
		<ul class= "navList">
			<li>
				<router-link to="/attempts"><button>View attempts</button></router-link>
			</li>
		</ul>
		<h3>General links</h3>
		<ul class = "navList">
			<li>
				<router-link to="/contest/new"><button>Add new contest</button></router-link>
			</li>
			<li>
				<router-link to="/problem/new"><button>Add new problem</button></router-link>
			</li>
			<li>
				<router-link to="/signup"><button>Add new user</button></router-link>
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
