<template>
  <div class="container px-0">
    <div class="col-12 px-0">
      <table class="table table-striped">
        <thead>
          <tr>
            <th class="text-left col-1">Name</th>
            <th class="text-center">Sets</th>
            <th class="text-center">Reps</th>
            <th class="text-center">Time</th>
            <th>Completed</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="exercise in displayAllExercises" v-bind:key="exercise.id">
            <td class="text-left">
              <router-link
                v-bind:to="{
                  name: 'exerciseDetails',
                  params: { id: exercise.id },
                }"
              >
                {{ exercise.name }}
              </router-link>
            </td>
            <td class="text-center">{{ exercise.sets }}</td>
            <td class="text-center">{{ exercise.reps }}</td>
            <td class="text-center">{{ exercise.time }}</td>
            <td class="text-center">
              <input
                type="checkbox"
                class="text-center"
                v-on:change="addExerciseToSave(exercise)"
              />
            </td>
          </tr>
          <tr>
            <td colspan="5">
              <h3 class="mt-3">
                Total workout time: {{ totalWorkoutTime }} minutes
              </h3>
            </td>
          </tr>
        </tbody>
      </table>
      <button type="button" v-on:click="saveCompletedWorkout()">
        Save Workout
      </button>
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
import workoutService from "@/services/WorkoutService";

export default {
  name: "generated-workout-list",
  data() {
    return {
      completedExercises: [],
    };
  },
  created() {
    console.log("created");
  },
  methods: {
    start() {
      this.$confetti.start({
        particles: [
          {
            type: "image",
            url: "https://image.flaticon.com/icons/png/512/38/38464.png",
          },
          {
            type: "image",
            url:
              "https://cdn0.iconfinder.com/data/icons/hotel-and-travel-4-1/52/195-512.png",
          },
          //   {
          // type: 'image',
          // url: 'https://www.flaticon.com/svg/vstatic/svg/2983/2983413.svg?token=exp=1618434830~hmac=d7fcc22e84624e6d81288f7663f38532',
          //   },
        ],
      });
    },

    stop() {
      this.$confetti.stop();
    },

    love() {
      this.$confetti.update({
        particles: [
          {
            type: "image",
            src: "/images/dumbell.png",
          },
          {
            type: "heart",
          },
          {
            type: "circle",
          },
        ],
        defaultColors: ["red", "pink", "purple", "#5e62d1", "#ba0000"],
      });
    },
    markComplete() {
      this.$store.commit("WORKOUT_STATUS", this.workout);
    },
    addExerciseToSave(exercise) {
      let inArrayAlready = this.completedExercises.findIndex(
        (e) => e.id == exercise.id
      );
      console.log(inArrayAlready);
      if (inArrayAlready == -1) {
        this.completedExercises.push(exercise);
      } else {
        this.completedExercises.splice(inArrayAlready, 1);
      }
    },
    saveCompletedWorkout() {
      this.start();
      workoutService
        .saveCompletedWorkoutToDatabase(this.completedExercises)
        .then((response) => {
          if (response.status == 201) {
            alert("Your workout was saved successfully. Keep killin' it!");
            this.start;
            this.$router.push("/");
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
  computed: {
    displayAllExercises() {
      let tempWorkouts = this.$store.state.workout;
      for (let i = 0; i < tempWorkouts.length; i++) {
        tempWorkouts.completed = false;
      }
      this.$store.commit("SET_WORKOUT", tempWorkouts);
      console.log(tempWorkouts);
      return this.$store.state.workout;
    },
    totalWorkoutTime() {
      let totalExercises = this.$store.state.workout;
      let totalTime = 0;
      for (let i = 0; i < totalExercises.length; i++) {
        totalTime += totalExercises[i].time;
      }
      return totalTime;
    },
  },
};
</script>

<style>
/* .container {
  background-color: lightcoral;
} */
</style>
