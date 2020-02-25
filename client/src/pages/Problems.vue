<template>
	<div>
        <router-link :to="{ name: 'ProblemViewer', params: { problem: this.problemName }}">{{problemName}}</router-link>
	</div>
</template>

<script>
	export default {
        data(){
            return{
                problemName: "Hello_World"
            }
        },
        name: 'Problems',
	};
</script>

<style scoped>
	h2 {
		text-align: center;
	}
	ul{
		text-align: left;
	}
</style>
