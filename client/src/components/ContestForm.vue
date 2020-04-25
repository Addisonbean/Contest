<template>
	<div>
		<error-msg :api-error="errors" />

		<form>
			<div class="form-group">
				<label for="title">Title</label>
				<input class="form-control" type="text" id="title" v-model="contestData.title" />
			</div>
			<div class="form-group">
				<label for="start-date">Date</label>
				<input class="form-control" type="date" id="start-date" v-model="contestData.date" />
			</div>
			<div class="form-group">
				<label for="start-time">Start time</label>
				<input class="form-control" type="time" id="start-time" v-model="contestData.startTime" />
			</div>
			<div class="form-group">
				<label for="end-time">End time</label>
				<input class="form-control" type="time" id="end-time" v-model="contestData.endTime" />
			</div>
			<div class="form-group">
				<input class="form-check-input" type="checkbox" id="active" v-model="contestData.active" />
				<label for="active" class="form-check-label">Make active?</label>
			</div>
			<button type="button" class="btn btn-primary" @click="submitForm">{{ buttonText }}</button>
		</form>
	</div>
</template>
<script>
import { createContest, updateContest, getContest } from '../api/contest.js';
import ErrorMsg from '../components/ErrorMsg.vue';
import moment from 'moment';

export default {
	name: 'contest-form',
	components: { ErrorMsg },
	props: ['contestId'],
	data() {
		const emptyContest = {
			id: null,
			title: '',
			date: '',
			startTime: '',
			endTime: '',
			active: false,
		};
		return {
			contestData: emptyContest,
			errors: {},
		};
	},
	computed: {
		isUpdate: function() {
			return this.contestId !== null && this.contestId !== undefined;
		},
		contestJson: function() {
			return {
				title: this.contestData.title,
				startTime: new Date(`${this.contestData.date} ${this.contestData.startTime}`),
				endTime: new Date(`${this.contestData.date} ${this.contestData.endTime}`),
				active: this.contestData.active,
				id: this.contestData.id,
			};
		},
		buttonText: function() {
			if (this.isUpdate) {
				return "Update Contest";
			} else {
				return "Create Contest";
			}
		},
	},
	methods: {
		submitForm: async function() {
			try {
				if (this.isUpdate) {
					await updateContest(this.contestJson);
				} else {
					await createContest(this.contestJson);
					this.$router.push('/problem/new');
				}
			} catch (e) {
				this.errors = e.data;
			}
		},
	},
	async created() {
		if (this.contestId !== null && this.contestId !== undefined) {
			const c = await getContest(this.contestId);
			console.log(c);

			this.contestData.id = c.id;
			this.contestData.title = c.title;
			this.contestData.date = moment(c.startTime).format('YYYY-MM-DD');
			this.contestData.startTime = moment(c.startTime).format('kk:mm');
			this.contestData.endTime = moment(c.endTime).format('kk:mm');
			this.contestData.active = c.active;
		}
	},
};
</script>

<style scoped>
form {
	width: 400px;
	margin: 20px auto;
}

input[type=date], input[type=time] {
	width: 200px;
	margin: 0 auto;
}
</style>
