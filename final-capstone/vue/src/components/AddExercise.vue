<template>
  <div>
    <h1>{{ Title }}</h1>

    <form>
      <div class="add-workout-form">
        <label for="name">Name:</label>
        <input id="name" type="text" v-model="exercise.name" />
      </div>
      <div class="add-workout-form">
        <label for="description">Description:</label>
        <textarea
          id="description"
          rows="10"
          cols="50"
          v-model="exercise.description"
        />
      </div>
      <div class="add-workout-form">
        <label for="weight">Suggested Weight &#40;lbs&#41;:</label>
        <input id="weight" type="text" v-model="exercise.suggestedWeight" />
      </div>
      <div class="add-workout-form">
        <label for="sets">Sets:</label>
        <input id="sets" type="text" v-model="exercise.sets" />
      </div>
      <div class="add-workout-form">
        <label for="reps">Reps:</label>
        <input id="reps" type="text" v-model="exercise.reps" />
      </div>
      <div class="add-workout-form">
        <label for="time">Amount of Time &#40;min&#41;:</label>
        <input id="time" type="text" v-model="exercise.time" />
      </div>
      <div class="add-workout-form">
        <select id="bodyTargetId" v-model="exercise.bodyTargetId">
          <option value="1">Legs</option>
          <option value="2">Back</option>
          <option value="3">Chest</option>
          <option value="4">Arms</option>
          <option value="5">Cardio</option>
          <option value="6">Full Body</option>
        </select>
      </div>
      <div class="actions">
        <button type="submit" v-on:click.prevent="saveExercise()">
          Save Exercise
        </button>
     
      <button type="submit" v-on:click.prevent="deleteExercise()">
          Delete Exercise
        </button>
      </div>
    </form>
  </div>
</template>

<script>
import ExerciseService from "@/services/ExerciseService.js";

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
        id: 0,
      },
    };
  },
  mounted() {
    this.exercise.id = this.$route.params.id;
    ExerciseService.listExercises().then((response) => {
      response.data.filter((e) => {
        if (e.id === this.$route.params.id) {
          this.exercise = e;
        }
      });
    });
    if(this.$route.path == "/exercise/add") {
      console.log("here");
      this.exercise.name = "";
      this.exercise.description = "";
      this.exercise.suggestedWeight = "";
      this.exercise.reps = "";
      this.exercise.sets = "";
      this.exercise.time = "";
      this.exercise.bodyTargetId = "";
      this.exercise.id = 0;
    }
  },
  created() {
    this.exercise.id = this.$route.params.id;
    ExerciseService.listExercises().then((response) => {
      response.data.filter((e) => {
        if (e.id === this.$route.params.id) {
          this.exercise = e;
        }
      });
    });
    if(this.$route.path == "/exercise/add") {
      console.log("here");
      this.exercise.name = "";
      this.exercise.description = "";
      this.exercise.suggestedWeight = "";
      this.exercise.reps = "";
      this.exercise.sets = "";
      this.exercise.time = "";
      this.exercise.bodyTargetId = "";
      this.exercise.id = 0;
    }
  },
  methods: {
    saveExercise() {
      if (this.exercise.id === 0) {
        //add Exercise
        ExerciseService.addExercise(this.exercise)
          .then((response) => {
            if (response.status === 201) {
              this.$router.push("/exercises");
            }
          })
          .catch((error) => {
            this.handleErrorResponse(error, "adding");
          });
        //Edit Exercise(update)
      } else {
        ExerciseService.editExercise(this.exercise)
          .then((response) => {
            if (response.status === 200) {
              this.$router.push(`/exercises`);
            }
          })
          .catch((error) => {
            console.log(error);
            this.handleErrorResponse(error, "editing");
          });
      }
    },
    //delete an exercise
    deleteExercise() {
      if (
        confirm(
          "Are you sure you want to delete this exercise? Your body may regret this."
        )
      ) {
        ExerciseService
          .deleteExercise(this.exercise.id)
          .then(response => {
            if (response.status === 200) {
              alert("Exercise successfully deleted (Remember to stay healthy)");
              this.$router.push('/exercises');
            }
          })//if error occurs deleting exercise on server or request
          .catch(error => {
            if (error.response) {
              this.errorMsg =
                "Error deleting your exercise . Response received was '" +
                error.response.statusText +
                "'.";
            } else if (error.request) {
              this.errorMsg =
                "Error deleting exercise. Server could not be reached.";
            } else {
              this.errorMsg =
                "Error deleting exercise. Request could not be created.";
            }
          });
      }
    },

    handleErrorResponse(error, verb) {
      if (error.response) {
        this.errorMsg =
          "Error " +
          verb +
          " exercise. Response received was '" +
          error.response.statusText +
          "'.";
      } else if (error.request) {
        this.errorMsg =
          "Error " + verb + " exercise. Server could not be reached.";
      } else {
        this.errorMsg =
          "Error " + verb + " exercise. Request could not be created.";
      }
    },
  },
  computed: {
    Title() {
      return (this.$route.path == "/exercise/add" ? "Add an exercise" : "Edit an exercise");
    }
  }
};
</script>

<style></style>
