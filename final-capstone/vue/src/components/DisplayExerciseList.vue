<template>
  <table>
    <thead>
      <tr>
        <th>Name</th>
        <th>Description</th>
        <th># Reviews</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="e in this.exercises" v-bind:key="e.id">
        <td>{{e.name}}</td>
        <td>{{e.body_target}}</td>
        <td>{{e.sets}}</td>
        <td>{{e.reps}}</td>
        <td><router-link 
           v-bind:to="{ name: 'edit' ,params: {id: e.id}}">
           Edit
        </router-link></td>
      </tr>
    </tbody>
  </table>
</template>

<script>
import exerciseService from "@/services/ExerciseService";
export default {
  data() {
    return {
      exercises: [],
    };
  },
  created() {
    exerciseService.listExercises().then((response) => {
      this.exercises = response.data;
      this.exercises.forEach((e) => {
        switch (e.body_target_id) {
          case 1:
            e.body_target = "Legs";
            break;
          case 2:
            e.body_target = "Back";
            break;
          case 3:
            e.body_target = "Chest";
            break;
          case 4:
            e.body_target = "Arms";
            break;
          case 5:
            e.body_target = "Cardio";
            break;
          case 6:
            e.body_target = "Full Body";
            break;
          default:
            e.body_target = "Other";
        }
      });
      //end for
    }); //end promise
  }, //end created
  methods: {
    saveExercise() {
      exerciseService
        .addExercise(this.exercise)
        .then((response) => {
          if (response.status === 201) {
            this.$router.push("/");
          }
        })
        .catch((error) => {
          this.handleErrorResponse(error, "adding");
        });
    },
  },
  computed: {
    getExercisesArray() {
      return this.exercises;
    },
  },
};
</script>

<style></style>
