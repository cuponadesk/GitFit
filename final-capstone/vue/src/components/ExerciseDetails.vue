<template>
  <div class="exercise-details">
    <h1>{{ exercise.name }}</h1>
    <p>{{ exercise.description }}</p>
    <label for="sets">Sets:</label>
    <br />
    <input id="sets" type="text" v-model="exercise.sets" />
    <br />
    <label for="reps">Reps:</label>
    <br />
    <input id="reps" type="text" v-model="exercise.reps" /><br />
    <label for="time">Amount of Time &#40;min&#41;:</label>
    <br />
    <input id="time" type="text" v-model="exercise.time" /><br />
    <label for="weight">Suggested Weight &#40;lbs&#41;:</label>
    <br />
    <input id="weight" type="text" v-model="exercise.suggestedWeight" /><br />
    <div class="exercise-gif">
      <label for="gif">Proper Form</label><br />
      <input id="gif" type="image" v-model="exercise.exerciseGif" /><br />
    </div>
    <button type="button" v-on:click="saveToStore">
      Save Exercise Details
    </button>
  </div>
</template>

<script>
export default {
  name: "exercise-details",

  data() {
    return {
      exercise: {},
    };
  },
  created() {
    let exercises = this.$store.state.workout;
    this.exercise = exercises.find(
      (exercise) => exercise.id == this.$route.params.id
    );
  },
  methods: {
    saveToStore() {
      this.$store.commit("UPDATE_EXERCISE_IN_WORKOUT", this.exercise);
      this.$router.push("/myworkout");
    },
  },
};
</script>

<style>
/* .exercise-gif {
  display: inline-block;
}
*/
</style>
