<template>
	<div id="app">
		<Header />
		<router-view />
	</div>
</template>

<script>
import Header from './components/Header.vue';

export default {
	name: 'app',
	components: { Header },
	created: function() {
		this.$store.dispatch('initializeState');
	},
};
</script>

<style>
#app {
	font-family: 'Avenir', Helvetica, Arial, sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	text-align: center;
	color: #2c3e50;
}
html {
    height: 100%;
}
body {
    height: 100%;
    margin: 0;
    background-repeat: no-repeat;
    background-attachment: fixed;
	background: #242940 ;
}

.cf:after {
  content: "";
  display: table;
  clear: both;
}
</style>
