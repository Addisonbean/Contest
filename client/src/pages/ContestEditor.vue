<template>
	<contest-form :contestId="contestId" />
</template>
<script>
import ContestForm from '../components/ContestForm.vue';

export default {
	name: 'contest-editor',
	components: { ContestForm },
	data() {
		return {
			contest: null,
		};
	},
	computed: {
		contestId: function() {
			return this.$route.params.id;
		},
	},
};
</script>

<style scoped>
</style>
