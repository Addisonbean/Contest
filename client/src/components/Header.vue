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
						<router-link to="/problems" class="nav-link">Problems</router-link>
					</li>
					<li class="nav-item">
						<router-link to="/scoreboard" class="nav-link">Scoreboard</router-link>
					</li>
					<li class="nav-item" v-if="displayMyAttempts">
						<router-link to="/my-attempts" class="nav-link">My Attempts</router-link>
					</li>
					<li class="nav-item" v-if="displayAdminLinks">
						<router-link to="/judge" class="nav-link">Judge Menu</router-link>
					</li>
				</ul>
			</nav>
		</div>

		<div class="aside">
			<div v-if="loggedIn">
				<a href="#" @click.prevent="logout">Log out</a>
			</div>
			<div v-else>
				<router-link to="/login">Log in</router-link>
			</div>
			<div>Settings?</div>
		</div>
	</header>
</template>

<script>
import { mapState } from 'vuex';
import { logout } from '../api/user.js';

export default {
	name: 'Header',
	methods: {
		logout,
	},
	computed: {
		...mapState(['loggedIn', 'user']),

		displayAdminLinks: function() {
			return this.user.admin;
		},
		displayMyAttempts: function() {
			return this.loggedIn && !this.user.admin;
		},
	},
};
</script>

<style scoped>
header {
	background-color: #161A2A ;
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
	background: #181D39 ;
	border-radius: 5px;
	margin: 0 8px;
}

.nav-item:hover {
	background: #161A2A ;
}

.nav-link {
	color: #C0C0C0 ;
	position: relative;
}

.nav-link:hover {
	top: 1px;
}

.manage-session {
}

h1{
	color: #C0C0C0 ;
}
</style>
