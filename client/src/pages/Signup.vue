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
			<button type="button" class="btn btn-primary" @click="submitForm">Create account</button>
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
			try {
				const res = await createUser({ user: this.user });
				console.log(res);
				console.log(this.user);
			} catch (e) {
				console.log("got an error: ");
				console.log(e.data);
				console.log(e.status);
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
