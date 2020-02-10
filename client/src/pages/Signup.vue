<template>
	<div>
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
import { createUser } from '../api/user.js';

export default {
	name: 'Signup',
	data() {
		return {
			user: {
				username: '',
				password: '',
			},
		};
	},
	methods: {
		submitForm: async function() {
			const res = await createUser({ user: this.user });
			console.log(res);
			console.log(this.user);
		},
	},
};
</script>

<style scoped>
form {
	width: 200px;
	margin: 0 auto;
}
</style>
