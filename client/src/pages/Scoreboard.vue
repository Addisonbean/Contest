<template>
	<div>
	<table class="table table-dark">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Name</th>
          <th scope="col">Problem1</th>
          <th scope="col">Problem2</th>
          <th scope="col">Total</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for = "user in sortedTeams">
          <th scope="row">1</th>
		  <td>{{ user.userName }}</td>
          <td v-for = "value in user.problems">
		    {{ value }}
		  </td>
        </tr>
      </tbody>
    </table>
	</div>
</template>

<script>
export default {
	name: 'Scoreboard',
	data() {
		return {
			users: [
				{
					userName: 'Lipscomb Gold',
					problems: [
						45,//Problem1[TimeTaken,Solved?]
						0,//Problem2
					],
					total: 45,
				},
			],
		};
	},
	methods: {
		sort: function() {
			
		},
	},
	computed: {
		sortedTeams: function() {
			return this.users.sort(function (user1, user2) {
				if(user1.numSolved > user2.numSolved)
					return 1
				else if(user1.numSolved < user2.numSolved)
					return -1
				else
					return(user1.timeSpent - user2.timeSpent)
		},
	},
};
</script>

<style scoped>
h2 {
	text-align: center;
}
</style>
