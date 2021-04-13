<template>
  <div>
    <table class="table table-striped">
      <thead>
        <tr>
          <th class="text-left col-1">Name</th>
          <th class="text-center">Target</th>
          <th class="text-center">Sets</th>
          <th class="text-center">Reps</th>
          <th class="text-center">Time</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="exercise in getExercisesInWorkout" v-bind:key="exercise.id">
          <td class="text-left">{{ exercise.name }}</td>
          <td class="text-center">
            {{ bodyTargetIdToWord(exercise.bodyTargetId) }}
          </td>
          <td class="text-center">{{ exercise.sets }}</td>
          <td class="text-center">{{ exercise.reps }}</td>
          <td class="text-center">{{ exercise.time }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  name: "view-saved-work-details",
  computed: {
    getExercisesInWorkout() {
      let exercises = [];
      for (let i = 0; i < this.$store.state.savedUserWorkout; i++) {
        if (this.$store.state.workout[i].workoutId == this.$route.params.id) {
          exercises.push(this.$store.state.savedUserWorkout[i]);
        }
      }
      console.log(this.$store.state.savedUserWorkout);

      return exercises;
    },
  },
};
</script>

<style></style>
