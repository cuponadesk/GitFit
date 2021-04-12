<template>
<div class="container">
<div class= "col-12">



<table class="table table-striped">
            <thead>
              <tr>
                <th class="text-left col-1">Name</th>
                <th class="text-center">Sets</th>
                <th class="text-center">Reps</th>
                <th class="text-center">Time</th>
              </tr>
            </thead>
            <tbody>
              <tr
               v-for="exercise in displayAllExercises" v-bind:key="exercise.id">
                <td class="text-left">{{ exercise.name }}</td>
                <td class="text-center">{{ exercise.sets }}</td>
                <td class="text-center">{{ exercise.reps }}</td>
                <td class="text-center">{{ exercise.time }}</td>
              </tr>
            </tbody>
          </table>
</div>
</div>


    <!-- <div class="workout-title">{{ workout.title }}</div>
    <div class="workout-trainer">{{ workout.trainer }}</div>
    <button class="mark-complete" v-on:click.prevent="markComplete" v-if="!workout.complete">
      Mark Complete
    </button>
    <button class="mark-incomplete" v-on:click.prevent="markIncomplete" v-if="workout.complete">
      Mark Incomplete
    </button> -->

  

</template>

<script>

export default {
  name: "generated-workout-list",
  methods: {
    // viewWorkoutDetails(id){
    //   this.$router.push(`/myworkout/${this.id}`);
    // },

    markComplete() {
      this.$store.commit("WORKOUT_STATUS", this.workout);
    }
  },
  computed: {
    displayAllExercises(){
      return this.$store.state.workout;
    }
  }
};
</script>

<style>

</style>