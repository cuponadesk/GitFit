<template>
 <!-- <bio/> -->
<body>
  <div class="container">
  <div class="row">
    <div class="text">Jaclyn Spangler</div>
    <div class="image">
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
</body>
  
</template>

<script>
import bioService from "@/services/BioService";
export default {
    component: bioService
}
</script>

<style>
body {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-rows: 1fr 1fr 1fr;
  grid-template-areas: "header header header"
  "body body body"
  "footer footer footer" ;
  grid-gap: 10px;
  align-items: center;
  justify-items: center; 
}


img {
  height: 50%;
  width: 40%;
}
</style>




