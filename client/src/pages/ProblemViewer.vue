<template>
	<div>
        <h1>{{problem.name}}</h1>
        <p>{{problem.backgrondInformation}}</p>
        <p>{{problem.description}}</p>
        <h1>Input Description</h1>
        <p>{{problem.inputDescription}}</p>
        <h1>Output Description</h1>
        <p>{{problem.outputDescription}}</p>
        <h1>Example Input</h1>
        <p>{{problem.exampleInput}}</p>
        <h1>Example Output</h1>
        <p>{{problem.exampleOutput}}</p>
        <h1>Test Input</h1>
        <p>{{problem.testInput}}</p>
        <h1>Test Input</h1>
        <p>{{problem.testOutput}}</p>
	</div>
</template>

<script>
    const problems = [
        {
            path: "Hello_World",
            problem: {
                name: "Hello World",
                backgrondInformation: "Steve N. is learning to code in order to get started he needs to know how to print text on the screen" ,
                description: "Write a program to print “Hello World” on the screen.",
                inputDescription: "This problem has no input",
                outputDescription: "Output should be \"Hello World\" ",
                exampleInput: "N/A",
                exampleOutput: "Hello World",
                testInput: "N/A",
                testOutput: "Hello World",
            }
        },
        {
            path: "Travelling_Sales_Person",
            problem: {name: "Travelling Sales Person", description: "The aim of this task is to check if everything works fine. Write a program to print “Hello World” on the screen."}
        }
    ]
	export default {
        //props: ["problemPath"],
        data(){
            return{
                currProblem: this.$route.params.problem,
                problem: {}
            }
        },
        created(){
            const foundProblem = problems.filter(problem => {return problem.path === this.currProblem});
            this.problem = foundProblem[0].problem;
        },
        name: 'ProblemViewer',
        
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
