<template>
	<div>
		<error-msg :api-error="apiError" />
		<form>
			<div class="form-group">
				<label for="username">Username</label>
				<input class="form-control" type="text" id="username" v-model="user.username" />
			</div>
			<div class="form-group">
				<label for="password">Password</label>
				<input class="form-control" type="password" id="password" v-model="user.password" />
			</div>
			<button type="button" class="btn btn-primary" @click="submitForm">Create account</button>
		</form>
	</div>
</template>

<script>
import { createUser } from '../api/user.js';
import ErrorMsg from '../components/ErrorMsg.vue';

export default {
	name: 'Signup',
	components: { ErrorMsg },
	data() {
		return {
			user: {
				username: '',
				password: '',
			},
			apiError: {},
		};
	},
	methods: {
		submitForm: async function() {
			try {
				await createUser(this.user);
				this.$router.push('/judge');
			} catch (e) {
				this.apiError = e.data;
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
