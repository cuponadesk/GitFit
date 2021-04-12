<template>
  <!-- <bio/> -->
  <body>
    <div class="container">
      <h3>Jaclyn Spangler</h3>
      <div class="bio">
        <img src="images\jac-trainer.jpg" alt="Jaclyn Trainer" />
        <p>
          Jaclyn, better known as the Cardio Queen,
          knows there is more to cardio than just hitting the treadmill or Stairmaster. Jaclyn's workouts are fun, intense, and target multiple major muscle groups to strengthen them while working on cardio. She has been 
          with the Git Fit family for 6 years and loves pushing
          people to be their best version. 
        </p>
      </div>
      <h3>John Baringhaus</h3>
      <div class="bio">
        <img src="images\jac-trainer1.jpg" alt="John Trainer" />
        <p>
          John "The Chest Crusader" is a Certified Strength and Condition
          Specialist (CSCS) with the National
          Strength and Conditioning Association. He has an extensive
          background from training professional 
          and amateur athletes to working professionals with nominal
          experience in fitness. John approaches fitness as a life long
          behavior modification where we have continuous improvement. He
          defines his sessions
          as simple, challenging, and efficient with an emphasis
          on proper form and mobility. His favorite client is anyone
          with a goal and a willingness to work towards it!
        </p>
      </div>
      <h3>Zack Sempsrott</h3>
      <div class="bio">
        <img src="images\jac-trainer2.jpg" alt="Zack Trainer" />
        <p>
          Zack believes in working out with an intense "no pain,
          no gain" mindset. Though he stands behind the importance of
          working the full body, he was given the
          nickname "The Arms Assassin" when he started working his biceps
          in the fourth grade. If you need a trainer who will hold you
          accountable and push you to your limits,
          Zack would be a great choice.
        </p>
      </div>
      <h3>Jamal Stephenson</h3>
      <div class="bio">
        <img src="images\jumping-girl.jfif" alt="Jamal" />
        <p>Long before he was a Division 1 college basketball player at Morehead State, Jamal embodied a full-circle healthy lifestyle consisting of diet and exercise. </p>
      </div>
      <h3>Domenic Ceccoli</h3>
      <div class="bio">
        <img src="images\IMG_1976.jpg" alt="Dom Trainer" />
        <p>Domenic has been a lifetime advocate of core strength, and his ab workout routines have taken him all over the world, earning him the nickname "The Abs Ambassador". Domenic believes that core strength is the baseline of physical fitness, and full body fitness stems from a solid core.</p>
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

.bio:nth-child(2n) img {
  /*display: flex;*/
  order: 2;
}

h3 {
  align-items: center;
  justify-content: center;
  display: flex;
}
</style>




