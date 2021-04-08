<template>
   <section>
    <div class="container text-center">
      <div class="row justify-content-center">
        <div class="col-12">
          <form>
             <table class="table" style="border: none; color: white;">
               <tr  style="border: none;"> 
                 <td style="border: none;">Legs</td>
                 <td style="border: none;">Back</td>
                 <td style="border: none;">Chest</td>
                 <td style="border: none;">Arms</td>
                 <td style="border: none;">Cardio</td>
                 <td style="border: none;">Abs</td>
                 <td style="border: none;">Full Body</td>
                 </tr>
                 <tr style="border: none;">
                 <td style="border: none;"><label class="switch">
                <input type="checkbox" v-model="filterLegs" />
                <span class="slider round"></span>
              </label></td>
                 <td style="border: none;">              <label class="switch">
                <input type="checkbox" v-model="filterBack" />
                <span class="slider round"></span>
              </label></td>
                 <td style="border: none;">              <label class="switch">
                <input type="checkbox" v-model="filterChest" />
                <span class="slider round"></span>
              </label></td>
                 <td style="border: none;">              <label class="switch">
                <input type="checkbox" v-model="filterArms" />
                <span class="slider round"></span>
              </label></td>
                 <td style="border: none;">            <label class="switch">
                <input type="checkbox" v-model="filterCardio" />
                <span class="slider round"></span>
              </label></td>
                 <td style="border: none;">              <label class="switch">
                <input type="checkbox" v-model="filterAbs" />
                <span class="slider round"></span>
              </label></td>
                 <td style="border: none;">              <label class="switch">
                <input type="checkbox" v-model="filterFullBody" />
                <span class="slider round"></span>
              </label></td>
                 </tr>
                 <tr style="border: none;"><td colspan="7" style="border:none"><select v-model="maxLength" class="custom-select">
                <option value="3">Less than three minutes</option>
                <option value="6">Less than six minutes</option>
                <option value="10">Less than ten minutes</option>
                <option value="99999">All lengths of time</option>
              </select></td></tr>
                 </table>
            
            <div>
              
            </div>

          </form>

          <table class="table table-striped">
            <thead>
              <tr>
                <th class="text-left col-1">Workout Name</th>
                <th class="text-center">Trainer Name</th>
                <th class="text-center">Target</th>
                <th class="text-center">Time</th>
                <th class="text-center">Intensity Level</th>
                <th class="text-center" v-if="admin"></th>
                <th class="text-center" v-if="admin"></th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="e in this.exercises"
                v-bind:key="e.id"
                v-show="
                  filterExerciseBodyPart(e.bodyTargetId) &&
                  filterExerciseTime(e.time)
                "
              >
                <td class="text-left">{{ e.name }}</td>
                <td class="text-center">{{ bodyTargetIdToWord(e.bodyTargetId) }}</td>
                <td class="text-center">{{ e.sets }}</td>
                <td class="text-center">{{ e.reps }}</td>
                <td class="text-center">{{ e.time }}</td>
                <td v-if="admin" class="text-center">
                  <router-link
                    v-bind:to="{ name: 'edit', params: { id: e.id } }"
                  >
                    <img src="png\pencil-4x.png" />
                  </router-link>
                  <!-- <button type="button" v-on:click="deleteExercise(e)">Delete</button> -->
                </td>
                <td v-if="admin" class="text-center">
                  <img src="png\trash-4x.png" v-on:click="deleteExercise(e)" />
                  <!-- <button type="button" v-on:click="deleteExercise(e)">Delete</button> -->
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {

}
</script>

<style>

</style>