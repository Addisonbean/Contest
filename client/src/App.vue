<template>
	<div id="app">
		<nav class="main-nav">
			<div class="logo">Welcome!</div>
			<Burger/>
		</nav>
		<Sidebar>
			<ul class="sidebar-panel-nav">
				<li>
					<router-link to="/" >Home</router-link>
				</li>
				<li>
					<router-link to="/problems">Problems</router-link>
				</li>
				<li>
					<router-link to="/scoreboard">Scoreboard</router-link>
				</li>
				<li>
					<router-link to="/">My Attempts</router-link>
				</li>
				<li v-if="displayAdminLinks">
					<router-link to="/judge">Judge Menu</router-link>
				</li>
				<li>
					<div class="aside">
						<div v-if="loggedIn">
							<a href="#" @click.prevent="logout" class = "log">Log out</a>
						</div>
						<div v-else>
							<router-link to="/login"  class = "log" >Log in</router-link>
						</div>
						<div>Settings?</div>
					</div>
				</li>
			</ul>
		</Sidebar>
	<router-view />
	</div>
</template>

<script>
import Sidebar from './components/Sidebar.vue';
import Burger from './components/Burger.vue';
import { mapState } from 'vuex';
import { logout } from './api/user.js';

export default {
	name: 'app',
	components: { 
		Sidebar,
		Burger
	},
	method:{
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
	created: function() {
		this.$store.dispatch('initializeState');
	},
};
</script>

<style>
#app {
	font-family: "Lato";
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	text-align: center;
<<<<<<< Updated upstream
	/* color: #2c3e50; */
	color: #ccc;
=======
	color: #ffffff;
>>>>>>> Stashed changes
}
html {
    min-height: 100%;
	max-width: 100%;
}
body {
    min-height: 100%;
	max-width: 100%;
    margin: 0;
	padding: 0;
    background-repeat: no-repeat;
    background-attachment: fixed;
	background: linear-gradient(
		45deg,
		rgba(101, 31, 87, 1) 0%,
		rgba(225, 113, 87, 1) 48%,
		rgba(249, 248, 113, 1) 100%
	);
}
.main-nav{
	display: flex;
	justify-content: space-between;
	padding: 0.5rem 0.8rem;
}

.sidebar-panel-nav {
	list-style-type: none;
}

ul.sidebar-panel-nav > li > a{
	color: #ffffff;
	text-decoration: none;
	font-size: 1.5rem;
	display: block;
	padding-bottom: 0.5em;
}

.log{
	color: #ffffff;
	text-decoration: none;
	font-size: 1.5rem;
	display: block;
	padding-bottom: 0.5em;
}

.cf:after {
  content: "";
  display: table;
  clear: both;
}
</style>
