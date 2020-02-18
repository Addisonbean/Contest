import Vue from 'vue';
import App from './App.vue';
import VueRouter from 'vue-router';

import Home from './pages/Home.vue';
import Login from './pages/Login.vue';
import Signup from './pages/Signup.vue';

import store from './store.js';

Vue.config.productionTip = false;
Vue.use(VueRouter);

const router = new VueRouter({
	mode: 'history',
	routes: [
		{ path: '/', component: Home },
		{ path: '/login', component: Login },
		{ path: '/signup', component: Signup },
	],
});

new Vue({
	render: h => h(App),
	router,
	store,
}).$mount('#app');
