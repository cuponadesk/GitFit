<template>
<div class="exercise-details">
<h1>{{exercise.name}}</h1>
<p>{{ exercise.description}}</p>


</div>
  
</template>

<script>
export default {
    name: "exercise-details",

    data(){
        return {
            exercise: {}

        }
    },
    created(){
        let exercises= this.$store.state.workout;
        this.exercise = exercises.find(exercise => exercise.id == this.$route.params.id)
    }

}
</script>

<style>

</style>