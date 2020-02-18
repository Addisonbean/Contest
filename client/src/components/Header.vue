<template>
	<header>
		<div class="aside"></div>

		<div class="main">
			<h1>Welcome!</h1>
			<nav class="navbar navbar-expand">
				<ul class="navbar-nav">
					<li class="nav-item">
						<router-link to="/" class="nav-link">Home</router-link>
					</li>
					<li class="nav-item">
						<router-link to="/" class="nav-link">Problems</router-link>
					</li>
					<li class="nav-item">
						<router-link to="/Scoreboard" class="nav-link">Scoreboard</router-link>
					</li>
					<li class="nav-item">
						<router-link to="/" class="nav-link">My Attempts</router-link>
					</li>
				</ul>
			</nav>
		</div>

		<div class="aside">
			<div><router-link to="/login">Log in</router-link></div>
			<div><router-link to="/logout">Log out</router-link></div>
			<div>Settings?</div>
		</div>
	</header>
</template>

<script>
export default {
	name: 'Header',
};
</script>

<style scoped>
header {
	background-color: #f9f9f9;
	padding: 20px 0;
	display: flex;
	content-justify: space-between;
}

.aside {
	flex-basis: 100px;
	flex-grow: 0;
}

.main {
	flex-grow: 1;
}

.navbar-nav {
	margin: 0 auto;
}

.nav-item {
	background: linear-gradient(0deg, rgb(243, 243, 243) 0%, rgb(245, 245, 245) 100%);
	border-radius: 5px;
	margin: 0 8px;
	border: 1px solid #eaeaea;
}

.nav-item:hover {
	background: linear-gradient(0deg, rgb(243, 243, 243) 0%, rgb(228, 228, 228) 100%);
}

.nav-link {
	color: #555;
	position: relative;
}

.nav-link:hover {
	top: 1px;
}

.manage-session {
}
</style>
