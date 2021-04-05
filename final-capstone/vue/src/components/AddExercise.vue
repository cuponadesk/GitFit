<template>
  <form>
    <div class="add-workout-form">
    <label for="name">Name:</label>
    <input id="name" type="text" />
    </div>
    <div class="add-workout-form">
    <label for="description">Description</label>
    <textarea id="description" rows="10" cols="50" />
    </div>
    <div class="add-workout-form">
    <label for="weight">Suggested Weight:</label>
    <input id="weight" type="text" />
    </div>
    <div class="add-workout-form">
    <label for="sets">Sets:</label>
    <input id="sets" type="text" />
    </div>
    <div class="add-workout-form">
    <label for="reps">Reps:</label>
    <input id="reps" type="text" />
    </div>
    <div class="add-workout-form">
    <select id="tag">
      <option value="1">Legs</option>
      <option value="2">Back</option>
      <option value="3">Chest</option>
      <option value="4">Arms</option>
      <option value="5">Cardio</option>
      <option value="6">Full Body</option>
    </select>
    </div>
    <div class="actions">
      <button type="submit" v-on:click="saveExercise()">Save Exercise</button>
    </div>
  </form>
</template>

<script>
import exerciseService from "@/services/ExerciseService";

export default {
  name: "add-exercise",
  data() {
    return {
      exercise: {
        name: "",
        description: "",
        suggestedWeight: "",
        reps: "",
        sets: "",
        time: "",
        bodyTargetId: "",
      },
    };
  },
  methods: {
    saveExercise() {
      exerciseService
        .addExercise(this.exercise)
        .then((response) => { alert (response)})
        .catch((error) => { alert (error)});
    },

    handleErrorResponse(error, verb) {
      if (error.response) {
        this.errorMsg =
          "Error " +
          verb +
          " this exercise. Response received was '" +
          error.response.statusText +
          "'.";
      } else if (error.request) {
        this.errorMsg =
          "Error " + verb + " this exercise. Server could not be reached.";
      } else {
        this.errorMsg =
          "Error " + verb + " this exercise. Request could not be created.";
      }
    },
  },
};
</script>

<style>
</style>