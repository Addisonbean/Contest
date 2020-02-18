<template>
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
          <td v-for = "value in user.problems" v-bind:key="value"> <!--TODO: Change value to a unique key-->
            {{ value }}
          </td>
          <td>{{ user.total }}</td>
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
                    id: 0,
                    userName: 'Lipscomb Gold',
                    problems: [
                        45,//Problem1[TimeTaken,Solved?]
                        0,//Problem2
                    ],
                    total: 45,
                },
                {
                    id: 1,
                    userName: 'Lipscomb Black',
                    problems: [
                        20,//Problem1[TimeTaken,Solved?]
                        35,//Problem2
                    ],
                    total: 55,
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
			let users2 = this.users.slice();
            return users2.sort(function (user1, user2) {
                if(user1.numSolved > user2.numSolved)
                    return 1
                else if(user1.numSolved < user2.numSolved)
                    return -1
                else
                    return(user1.timeSpent - user2.timeSpent)
            });
        },
    },
};
</script>

<style scoped>
h2 {
    text-align: center;
}
</style>
