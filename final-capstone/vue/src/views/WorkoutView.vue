<template>
<div>
    <display-workout-list />
    <generated-workout />
</div>
</template>

<script>
import DisplayWorkoutList from "@/components/DisplayWorkoutList.vue"; 
import GeneratedWorkout from "@/components/GeneratedWorkoutList.vue";

export default {
  components: {
    DisplayWorkoutList,
    GeneratedWorkout
  }
};
</script>

<style>
body {
  font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
    "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji",
    "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
    color: white;
}
</style>