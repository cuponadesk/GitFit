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
        <tr v-for="exercise in getExercisesInWorkout" v-bind:key="exercise.id">
          <td class="text-left">{{ exercise.exerciseName }}</td>
          <td class="text-center">{{ exercise.setsCompleted }}</td>
          <td class="text-center">{{ exercise.repsCompleted }}</td>
          <td class="text-center">{{ exercise.timeCompleted }}</td>
        </tr>
      </tbody>
    </table>
  </div>
  </div>
</template>

<script>
import workoutService from "@/services/WorkoutService.js";
export default {
  name: "display-user-details",
  created() {
    workoutService
      .getWorkoutFromUser(this.$route.params.username)
      .then((response) => {
        this.$store.commit("SAVE_USER_WORKOUTS", response.data);
      })
      .catch((error) => {
        alert(
          "Sorry we're unable to locate your workout history. Please log your workouts to access this page"
        );
        console.log(error);
      });
  },
  computed: {},
};
</script>

<style></style>
