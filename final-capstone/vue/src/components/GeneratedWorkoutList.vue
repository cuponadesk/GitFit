<template>
<div class= "generated-workout">
<h2> Name of Exercise</h2>
<h2> Description</h2>
<h2> Exercise Gifs</h2>
<h2> Edit: (sets, reps, desired weight, time)</h2>
<p>hello</p>

    <!-- <div class="workout-title">{{ workout.title }}</div>
    <div class="workout-trainer">{{ workout.trainer }}</div>
    <button class="mark-complete" v-on:click.prevent="markComplete" v-if="!workout.complete">
      Mark Complete
    </button>
    <button class="mark-incomplete" v-on:click.prevent="markIncomplete" v-if="workout.complete">
      Mark Incomplete
    </button> -->
  </div>
  

</template>

<script>
import GeneratedWorkout from '@/views/WorkoutView.vue'

export default {
  name: "generated-workout-list",
  props: ["workout"],
  components: GeneratedWorkout,
  methods: {

    markComplete() {
      this.$store.commit("WORKOUT_STATUS", this.workout);
    }
  }
};
</script>

<style>

</style>