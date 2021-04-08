<template>
  <div class="container">
    <form>
      <span>
        Legs
        <label class="switch">
          <input type="checkbox" v-model="filterLegs" />
          <span class="slider round"></span>
        </label>
      </span>
      <span>
        Back
        <label class="switch">
          <input type="checkbox" v-model="filterBack"/>
          <span class="slider round"></span>
        </label>
      </span>
      <span>
        Chest
        <label class="switch">
          <input type="checkbox" v-model="filterChest" />
          <span class="slider round"></span>
        </label>
      </span>
      <span>
        Arms
        <label class="switch">
          <input type="checkbox" v-model="filterArms" />
          <span class="slider round"></span>
        </label>
      </span>
      <span>
        Cardio
        <label class="switch">
          <input type="checkbox" v-model="filterCardio" />
          <span class="slider round"></span>
        </label>
        
      </span>
      <span>
        Abs
        <label class="switch">
          <input type="checkbox" v-model="filterAbs" />
          <span class="slider round"></span>
        </label>
        
      </span>
      <span>
        Full Body
        <label class="switch">
          <input type="checkbox" v-model="filterFullBody" />
          <span class="slider round"></span>
        </label>
        
      </span>
      <div>
          <select v-model="maxLength">
              <option value ="3">Less than three minutes</option>
              <option value ="6">Less than six minutes</option>
              <option value ="10">Less than ten minutes</option>
              <option value ="99999">All lengths of time</option>
          </select>
      </div>
    </form>

    <table class="table">
      <thead>
        <tr>
          <th>Name</th>
          <th>Body Target</th>
          <th>Sets</th>
          <th>Reps</th>
          <th>Time</th>
          <th colspan="2">Link</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="e in this.exercises" v-bind:key="e.id" v-show="filterExerciseBodyPart(e.bodyTargetId) && filterExerciseTime(e.time)">
          <td>{{ e.name }}</td>
          <td>{{ e.bodyTargetId}}</td>
          <td>{{ e.sets }}</td>
          <td>{{ e.reps }}</td>
          <td>{{ e.time}}</td>
          <td>
            <router-link v-bind:to="{ name: 'edit', params: { id: e.id } }" tag="button">
              Edit
            </router-link>
          </td>
          <td>
            <button type="button" v-on:click="deleteExercise(e)">Delete</button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import exerciseService from "@/services/ExerciseService";
export default {
  data() {
    return {
      exercises: [],
      filterExercises : [ true, true, true, true, true, true, true ],
      filterArms: true,
      filterChest: true,
      filterBack: true,
      filterCardio: true,
      filterFullBody: true,
      filterLegs: true,
      filterAbs: true,
      maxLength: 99999,
    };
  },
 created() {
    this.getExercises();
     //end promise
  }, //end created
  methods: {
    getExercises(){ exerciseService.listExercises().then((response) => {
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
    });
  },
    // saveExercise() {
    //   exerciseService
    //     .addExercise(this.exercise)
    //     .then((response) => {
    //       if (response.status === 201) {
    //         this.$router.push("/");
    //       }
    //     })
    //     .catch((error) => {
    //       this.handleErrorResponse(error, "adding");
    //     });
    // },
    deleteExercise(exercise) {
      exerciseService
        .deleteExercise(exercise)
        .then((response) => {
          if (response.status === 204) {
            alert("Exercise successfully deleted.");
            this.getExercises();
          }
        })
        .catch((error) => {
          this.handleErrorResponse(error, "adding");
        });
      console.log("here");

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
    },
    filterExerciseBodyPart(e) {
        switch (e) {
            case 1:
              return this.filterLegs;
            case 2:
              return this.filterBack;
            case 3:
              return this.filterChest;
            case 4:
              return this.filterArms;
            case 5:
              return this.filterCardio;
            case 6:
                return this.filterFullBody;
            default:
              return false;
          }
    },
    filterExerciseTime(e) {
        console.log(e);
        console.log(this.maxLength);
        return e <= this.maxLength;
    }
  },
  computed: {
    getExercisesArray() {
      return this.exercises;
    },
    
  },
};
</script>

<style>
/* The switch - the box around the slider */
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

/* Hide default HTML checkbox */
.switch input {
  opacity: 0;
  width: 0;
  height: 0;
}

/* The slider */
.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: 0.4s;
  transition: 0.4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: 0.4s;
  transition: 0.4s;
}

input:checked + .slider {
  background-color: #2196f3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196f3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}

div {
  margin: 1rem;
}
</style>
