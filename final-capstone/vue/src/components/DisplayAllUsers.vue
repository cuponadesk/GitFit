<template>
  <div class="container">
<div class= "col-12">



<table class="table table-striped">
            <thead>
              <tr>
                <th class="text-left col-1">Username</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="user in users" v-bind:key="user"> 
                <td class="text-left">
                  <router-link
               
               v-bind:to="{name: 'user-details', params: { id: user }}">
                  {{ user}}  </router-link></td>
                <td class="text-center">{{ user }}</td>
                
              </tr>
            </tbody>
          </table>
</div>
</div>
</template>

<script>
import workoutService from "@/services/WorkoutService.js";
export default {
    name: "display-all-users",
    data() {
      return {
        users: []
      }
    },
    created() {
      workoutService.getAllUsers()
      .then(response => {
        this.users = response.data;
      })
      .catch(error => {
        console.log(error);
      })
    }

}
</script>

<style>

</style>