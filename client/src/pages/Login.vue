<template>
	<div>
		<error-msg :errors="errors" />
		<form>
			<div class="form-group">
				<label for="username">Username</label>
				<input class="form-control" type="text" id="username" v-model="user.username" />
			</div>
			<div class="form-group">
				<label for="password">Password</label>
				<input class="form-control" type="password" id="password" v-model="user.password" />
			</div>
			<button type="button" class="btn btn-primary" @click="submitForm">Log in</button>
		</form>
	</div>
</template>

<script>
import { login } from '../api/user.js';
import ErrorMsg from '../components/ErrorMsg.vue';

export default {
	name: 'Login',
	components: { ErrorMsg },
	data() {
		return {
			user: {
				username: '',
				password: '',
			},
			errors: [],
		};
	},
	methods: {
		submitForm: async function() {
			try {
				await login(this.user);
				this.$router.push('/contest');
			} catch (e) {
				this.errors = [e.data.msg];
			}
		},
	},
};
</script>

<style scoped>
form {
	width: 200px;
	margin: 20px auto;
}
</style>
