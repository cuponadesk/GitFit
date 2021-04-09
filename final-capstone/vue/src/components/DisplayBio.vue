<template>
 <!-- <bio/> -->
<div>
  <div class="container">
  <div class="row">
    <div class="text">Jaclyn Spangler</div>
    <div id="jaclyn-image" class="image">
      <img src="images\jac-trainer.jpg" alt="Jaclyn Trainer">
    </div>
  </div>
  <div class="row">
    <div class="image">image</div>
    <div class="text">John Baringhaus</div>
  </div>
  <div class="row">
    <div class="text">Zack Sempsrott</div>
    <div class="image">image</div>
  </div>
  <div class="row">
    <div class="image">image</div>
    <div class="text">Jamal Stephenson</div>
  </div>
  <div class="row">
    <div class="text">Domenic Ceccoli</div>
    <div class="image">image</div>
  </div>
</div>
</div>
  
</template>

<script>
import bioService from "@/services/BioService";
export default {
    component: bioService
}
</script>

<style>
div#jaclyn-image {
  display: block;
  max-height: auto;
  max-width: 25px;
}
</style>




