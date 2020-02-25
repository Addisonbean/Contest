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
          <th scope="col">Name</th>
          <th scope="col">Problem1</th>
          <th scope="col">Problem2</th>
          <th scope="col">Total</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for = "user in sortedTeams" v-bind:key="user.id">
          <th scope="row">{{ user.userName }}</th>
          <td v-for = "value in user.problems" v-bind:key="value.name">
            {{ value.minutes }} <span class=spacer></span> {{ value.tries }}
          </td>
          <td>{{ totalMinutes(user) }}</td>
        </tr>
      </tbody>
    </table>
    </div>
  </div>
</template>

<script>
export default {
    name: 'Scoreboard',
    data() {
        return {
            users: [
                {
                    id: 0,
                    userName: 'Lipscomb Gold',
                    problems: [
						{
							name: "Problem1",
							minutes: 45,
							tries: 1,
							solved: true,
						},
						{
							name: "Problem2",
							minutes: 0,
							tries: 1,
							solved: false,
						},
                    ],
                },
                {
                    id: 1,
                    userName: 'Lipscomb Black',
                    problems: [
						{
							minutes: 20,
							tries: 1,
							solved: true,
						},
						{
							minutes: 35,
							tries: 2,
							solved: true,
						},
                    ],
                },
            ],
        };
    },
    methods: {
		totalMinutes: function(user) {
			let total = 0;
			console.log(user)
			for (let problem of user.problems){
				if(problem.solved){
					if(problem.tries > 1) {
						total += (problem.tries-1)*20 + problem.minutes;
					}
					else{
						total += problem.minutes;
					}
				}
				console.log(problem);
			}
			return total;
		},
		totalSolved: function(user) {
			let total = 0;
			for (let problem of user.problems){
				if(problem.solved){
					total++;
				}
			}
			return total;
		},
    },
    computed: {
        sortedTeams: function() {
            let users2 = this.users.slice();
            return users2.sort((user1, user2) => {
                if(this.totalSolved(user1) > this.totalSolved(user2))
                    return -1
                else if(this.totalSolved(user1) < this.totalSolved(user2))
                    return 1
                else
                    return(this.totalMinutes(user1) - this.totalMinutes(user2))
            });
        },
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
