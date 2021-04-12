<template>
<div class="exercise-detail">
<h1> {{exercise.name}}</h1>


</div>
  
</template>

<script>
export default {
    name: "exercise-detail",
    props: ['id'],
    data(){
        return {
            exercise: {}

        }
    },
    created(){
        let exercises= this.$store.state.workout;
        this.exercise = exercises.filter(exercise => exercise.id == this.id)
    }

}
</script>

<style>

</style>