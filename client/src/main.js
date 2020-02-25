import Vue from 'vue';
import App from './App.vue';
import VueRouter from 'vue-router';

import Home from './pages/Home.vue';
import Login from './pages/Login.vue';
import Signup from './pages/Signup.vue';
import Scoreboard from './pages/Scoreboard.vue';
import ContestEditor from './pages/ContestEditor.vue';
import Problems from './pages/Problems.vue';
import ProblemViewer from './pages/ProblemViewer.vue';

import store from './store.js';

Vue.config.productionTip = false;
Vue.use(VueRouter);

const router = new VueRouter({
	mode: 'history',
	routes: [
		{ path: '/', component: Home },
		{ path: '/login', component: Login },
		{ path: '/signup', component: Signup },
		{ path: '/scoreboard', component: Scoreboard },
		{ path: '/contest/new', component: ContestEditor },
		{ path: '/problems', component: Problems},
		{ path: '/problems/:problem', component: ProblemViewer, props: true, name: 'ProblemViewer'},
	],
});

new Vue({
	render: h => h(App),
	router,
	store,
}).$mount('#app');
