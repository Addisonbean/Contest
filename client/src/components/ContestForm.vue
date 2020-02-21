<template>
	<div>
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
			<button type="button" class="btn btn-primary" @click="submitForm">Create contest</button>
		</form>
	</div>
</template>
<script>
import { createContest, updateContest } from '../api/contest.js';

export default {
	name: 'contest-form',
	props: {
		contest: Object,
		default: {},
	},
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
			contestData: { ...emptyContest, ...this.contest },
		};
	},
	computed: {
		contestJson: function() {
			return {
				title: this.contestData.title,
				startTime: new Date(`${this.contestData.date} ${this.contestData.startTime}`),
				endTime: new Date(`${this.contestData.date} ${this.contestData.endTime}`),
				active: this.contestData.active,
			};
		},
	},
	methods: {
		submitForm: async function() {
			if (this.contest.id !== null && this.contest.id !== undefined) {
				const res = await updateContest(this.contestJson);
				console.log(res);
			} else {
				const res = await createContest(this.contestJson);
				// TODO: what to do?
				console.log(res);
			}
		},
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
