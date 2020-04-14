<template>
	<div>
		<div>
			<br>
			<h3>Time Left: 0:00:00</h3> <!--TODO: Implement Timer-->
		</div>
		<div>
		<table class="table table-dark">
			<thead>
				<tr>
					<th scope="col"></th>
					<th v-for="p in problems" v-bind:key="p.id">
						{{ p.title }}
					</th>
					<th scope="col">Totals</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row"><strong>Team</strong></th>
					<td v-for="p in problems" v-bind:key="p.id">
						Mins <span class=spacer></span> Tries
					</td>
					<td> Mins <span class=spacer></span> Tries</td>
					<td><strong>Accepted</strong></td>
				</tr>
				<tr v-for="user in sortedTeams" v-bind:key="user.id">
					<th scope="row">{{ user.username }}</th>
					<td v-for="p in user.problemStandings" v-bind:key="p.id">
						{{ p.totalMinutes }} <span class=spacer></span><span class=spacer></span> {{ p.totalAttempts }}
					</td>
					<td>{{ user.standing.totalMinutes }} <span class=spacer></span><span class=spacer></span> {{ user.totalAttempts }}</td>
					<td>{{ user.standing.totalSolved }}</td>
				</tr>
			</tbody>
		</table>
		</div>
	</div>
</template>

<script>
import { getCurrentScoreboard } from '../api/contest.js';

export default {
	name: 'Scoreboard',
	data() {
		return {
			users: [],
			problems: [],
		};
	},
	computed: {
		sortedTeams: function() {
			let sortedUsers = this.users.slice();
			return sortedUsers.sort((u1, u2) => {
				const diff = u2.totalSolved - u1.totalSolved;
				if (diff !== 0) {
					return diff;
				} else {
					return u1.totalMinutes - u2.totalMinutes;
				}
			});
		},
	},
	async created() {
		let scores = await getCurrentScoreboard();
		this.users = scores.users;
		this.problems = scores.problems;
	},
};
</script>

<style scoped>
h2 {
	text-align: center;
}
.spacer{
	display: inline-block;
	width: 16px;
}
</style>
