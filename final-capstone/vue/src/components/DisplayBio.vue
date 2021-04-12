<template>
  <!-- <bio/> -->
  <body>
    <div class="container">
      <h3>Jaclyn "The Cardio Queen" Spangler</h3>
      <div class="bio">
        <img src="images\jac-trainer.jpg" alt="Jaclyn Trainer" />
        <p>
          Jaclyn, better known as the Cardio Queen,<br />
          knows you dont need to only hit the treadmill or <br />
          Stairmaster to get your cardio in. She has been <br />
          with the git fit fam for 6 years and loves pushing <br />
          people to be their best version.
        </p>
      </div>
      <h3>John "The Chest Crusader" Baringhaus</h3>
      <div class="bio">
        <img src="images\jac-trainer1.jpg" alt="John Trainer" />
        <p>
          John "The Chest Crusader" is a Certified Strength <br />and Condition
          Specialist (CSCS) with the National<br />
          Strength and Conditioning Association. He has an <br />extensive
          background from training professional <br />
          and amateur athletes to working professionals with <br />nominal
          experience in fitness. John approaches <br />fitness as a life long
          behavior modification where we <br />have continuous improvement. He
          defines his sessions<br />
          as simple, challenging, and efficient with an emphasis<br />
          on proper form and mobility. His favorite client is anyone <br />
          with a goal and a willingness to work towards it!
        </p>
      </div>
      <h3>Zack "The Arms Assassin" Sempsrott</h3>
      <div class="bio">
        <img src="images\jac-trainer2.jpg" alt="Zack Trainer" />
        <p>
          Zack believes in working out with an intense "no pain, <br />
          no gain" mindset. Though he stands behind the <br />importance of
          working the full body, he was given the <br />
          nickname "The Arms Assassin" when he started working his <br />biceps
          in the fourth grade. If you need a trainer who will <br />hold you
          accountable and push you to your limits, <br />
          Zack would be a great choice.
        </p>
      </div>
      <h3>Jamal "The Back Behemoth" Stephenson</h3>
      <div class="bio">
        <img src="images\jumping-girl.jfif" alt="Jamal" />
        <p>Jamal likes to work out a lot.</p>
      </div>
      <h3>Domenic "The Abs Ambassador" Ceccoli</h3>
      <div class="bio">
        <img src="images\IMG_1976.jpg" alt="Dom Trainer" />
        <p>Domenic has been a lifetime advocate of core strength, <br> and his ab workout routines have taken him all over the <br>world, earning him the nickname "The Abs Ambassador".<br> Domenic believes that core strength is the baseline of<br> physical fitness, and full body fitness stems from a solid core.</p>
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




