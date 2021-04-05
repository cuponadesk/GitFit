<template>
<div>
<h1> Add an Exercise</h1>

  <form v-on:prevent= "saveExercise">
    <div class="add-workout-form">
    <label for="name">Name:</label>
    <input id="name" type="text" v-model="exercise.name" />
    </div>
    <div class="add-workout-form">
    <label for="description">Description:</label>
    <textarea id="description" rows="10" cols="50" v-model="exercise.description" />
    </div>
    <div class="add-workout-form">
    <label for="weight">Suggested Weight &#40;lbs&#41;:</label>
    <input id="weight" type="text" v-model="exercise.suggestedWeight"/>
    </div>
    <div class="add-workout-form">
    <label for="sets">Sets:</label>
    <input id="sets" type="text" v-model="exercise.sets" />
    </div>
    <div class="add-workout-form">
    <label for="reps">Reps:</label>
    <input id="reps" type="text" v-model="exercise.reps"/>
    </div>
     <div class="add-workout-form">
    <label for="time">Amount of Time &#40;min&#41;:</label>
    <input id="time" type="text" v-model="exercise.time" />
    </div>
    <div class="add-workout-form">
    <select id="bodyTargetId" v-model="exercise.bodyTargetId">
      <option value="1">Legs</option>
      <option value="2">Back</option>
      <option value="3"> 3</option>
      <option value="4">Arms</option>
      <option value="5">Cardio</option>
      <option value="6">Full Body</option>
    </select>
    </div>
    <div class="actions">
      <button type="submit" v-on:click="saveExercise()">Save Exercise</button>
    </div>
  </form>
</div>
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
        .then((response) => { 
          if(response.status === 201){
            this.$router.push('/');
          }
        })
        .catch((error) => { 
          this.handleErrorResponse(error, "adding");
        });
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