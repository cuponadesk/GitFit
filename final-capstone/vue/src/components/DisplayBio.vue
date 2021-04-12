<template>
  <!-- <bio/> -->
  <body>
    <div class="container">
      <h3>Jaclyn "The Cardio Queen" Spangler</h3>
      <div class="bio">
        <img src="images\jac-trainer.jpg" alt="Jaclyn Trainer" />
        <div class="about">
          <p>Jaclyn has been a trainer with us for 10 years.</p>
        </div>
      </div>
      <h3>John "The Chest Crusader" Baringhaus</h3>
      <div class="bio">
        <img src="images\jac-trainer1.jpg" alt="John Trainer">
        <div class="about">
          <p>John has been a professional bodybuilder since he was 12.</p>
        </div>
      </div>
      <h3>Zack "The Arms Assassin" Sempsrott</h3>
      <div class="bio">
          <img src="images\jac-trainer2.jpg" alt="Zack Trainer">
          <p>Zack has been working on his biceps since the 4th grade.</p>
      </div>
      <h3>Jamal "The Back Behemoth" Stephenson</h3>
      <div class="bio">
          <img src="images\jumping-girl.jfif" alt="Jamal">
          <p>Jamal likes to work out a lot.</p>
      </div>
      <h3>Domenic "The Abs Ambassador" Ceccoli</h3>
      <div class="bio">
        <div class="image">image</div>
      </div>
    </div>
  </body>
</template>

<script>
import bioService from "@/services/BioService";
export default {
  component: bioService,
};
</script>

<style>

img {
  height: 50%;
  width: 40%;
}

body {
  margin: 20px;
  padding: 0;
  font-family: sans-serif;
}

.bio {
  padding: 20px;
  margin-bottom: 20px;
  border: solid 1px #555;
  display: flex; 
}

.bio img {
  width: 150px;
  border-radius: 999px;
  margin: 0 10px;
 
}

.bio:nth-child(2) img {
  display: flex;
  order: 2;
}

h3 {
  align-items: center;
  justify-content: center;
  display: flex;
}


</style>




