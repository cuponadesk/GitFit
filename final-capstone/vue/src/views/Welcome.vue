<template>
  <section>
  <div class="container welcome">
    <div class="row">
      <div class="col-12">
 

    <h1>Welcome</h1>
    <p > Push your body, you'll pull the rewards!</p>

    <!--insert windows terminal animation-->
    <p id="welcome-slogan">"Self-care is, fundamentally, about bringing balance back to a life that has grown imbalanced from too many commitments or responsibilities." -Dr. Robyn L. Gobin</p>
    <h1> Our Story</h1>
    <p id="welcome-slogan"> While there is nothing better than spending hours creating original code and watching it take shape over time, this is often paired with hours of sitting and minimal movement. <br> Founded by five passionate and talented software developers based in Cincinnati, OH.  We understand the need and importance of a balanced lifestyle through physical exercise.
    <br> Whether you are starting from day 1 or just wanting to tone up that pandemic poundage we will be as attentive to your needs as we are with our own code!<br>We specialize in a variety of physical fitness styles tailored to your needs, goals, and individual lifestyle. </p> <!--paragraph about fitness that is funny-->
    <div class="d-flex justify-content-space-between">
    <h2 class="welcome-header"> Why Git? </h2>
    <p class="content" id="welcome-slogan">GIT, an open source software for tracking and coordinating changes, often used by developers. No better name describes our mentality towards your fitness goals.<br> We will be
      will Add our unique and experienced perspective as we tracj your development. We are Commited to tackling all your physical fitness goals.<br> We will Push you to be the best version of yourself. </p> <!--paragraph about why you wanna join our gym-->

    <h2>Our Trainers</h2>
    <p id="welcome-slogan"> Jaclyn Spangler<br>
       John Baringhaus<br>
        Domenic Ceccoli <br>
        Zack Sempsrott <br>
        Jamal Stephenson
 </p> <!--insert images of the 5 of us as "trainers" and funny about section with different workout focus-->

    <h2>Success Stories</h2>
    <p id="welcome-slogan"></p> <!--insert quotes/images from ppl who love our gym-->
    </div>

    <footer>Join Us</footer> 
    <!--insert social media links, ability to sign up, physicall address, resources about fitness-->
    
      </div>
  </div>
  </div>
</section>
</template>

<script>
export default {
  name: "welcome"
};
</script>

<style>

p#welcome-slogan {
  color:black;
  size: 10rem;
  animation: none;
  font-family: 'Times New Roman', Times, serif;
  font-size: medium;
  /*font-style: italic;*/
}

h2 {
  text-shadow: 0.05px 0.05px #5e62d1;
}

.content {
  align-content: left;
}

/*h2.welcome-header {
  align-items: left;
}
*/


</style>