<template>
  <section>
    <div class="container welcome">
      <div class="row">
        <div class="col-8">
          <!-- <img src="images/steps.jpeg" /> -->
          <h1>Push your body-- <br>
             You'll pull the rewards!</h1>
         
        </div>
        <div class="col-3"><img src="images/steps.jpeg" width="100%" height="100%" /></div>
      </div>
      <div class="row">
        <div class="col-6">
          <h2>Our Story</h2>
          <p id="welcome-slogan">
            While there is nothing better than spending hours creating original
            code and watching it take shape over time, this is often paired with
            hours of sitting and minimal movement. <br />
            Founded by five passionate and talented software developers based in
            Cincinnati, OH. We understand the need and importance of a balanced
            lifestyle through physical exercise. <br />
            Whether you are starting from day 1 or just wanting to tone up that
            pandemic poundage we will be as attentive to your needs as we are
            with our own code!<br />We specialize in a variety of physical
            fitness styles tailored to your needs, goals, and individual
            lifestyle.
          </p>
        </div>
        <div class="col-5">
          <h2 class="welcome-header">Why Git?</h2>
          <p class="content" id="welcome-slogan">
            GIT, an open source software for tracking and coordinating changes,
            often used by developers. No better name describes our mentality
            towards your fitness goals.<br />
            We will be will Add our unique and experienced perspective as we
            tracj your development. We are Commited to tackling all your
            physical fitness goals.<br />
            We will Push you to be the best version of yourself.
          </p>
        </div>
      </div>
      
      <div class="trainer-photos">
        <div class="photo">
        <img id="zack" src="images/Image from iOS.jpg" width="100%" height="100%" /> 
        </div>
        <div class="photo">
        <img id="dom" src="images/IMG_1966.jpg" width="100%" height="100%" />
         </div>
        <div class="photo">
        <img id="john" src="images/john-2.jpg" width="100%" height="100%" />
         </div>
        <div class="photo">
        <img id="jac" src="images/jac-trainer.jpg" width="100%" height="100%" />
         </div>
        <div class="photo">
        <img id="jamal" src="images/GOPRO168[1].JPG" width="100%" height="100%" />
        </div>
        </div>
    </div>
  </section>

  <!-- <h1>Our Story</h1>
          <p id="welcome-slogan">
            While there is nothing better than spending hours creating original
            code and watching it take shape over time, this is often paired with
            hours of sitting and minimal movement. <br />
            Founded by five passionate and talented software developers based in
            Cincinnati, OH. We understand the need and importance of a balanced
            lifestyle through physical exercise. <br />
            Whether you are starting from day 1 or just wanting to tone up that
            pandemic poundage we will be as attentive to your needs as we are
            with our own code!<br />We specialize in a variety of physical
            fitness styles tailored to your needs, goals, and individual
            lifestyle.
          </p>

          <div class="d-flex justify-content-space-between">
            <h2 class="welcome-header">Why Git?</h2>
            <p class="content" id="welcome-slogan">
              GIT, an open source software for tracking and coordinating
              changes, often used by developers. No better name describes our
              mentality towards your fitness goals.<br />
              We will be will Add our unique and experienced perspective as we
              tracj your development. We are Commited to tackling all your
              physical fitness goals.<br />
              We will Push you to be the best version of yourself.
            </p>

            <h2>Our Trainers</h2>
            <p id="welcome-slogan">
              Jaclyn Spangler<br />
              John Baringhaus<br />
              Domenic Ceccoli <br />
              Zack Sempsrott <br />
              Jamal Stephenson
            </p>
     
            <h2>Success Stories</h2>

          </div>
        </div>
      </div>
    </div>
  </section> -->
</template>

<script>
export default {
  name: "welcome",
};
</script>

<style scoped>
p#welcome-slogan {
  color: black;
  size: 10rem;
  animation: none;
  font-family: "Times New Roman", Times, serif;
  font-size: medium;
  /*font-style: italic;*/
}

h2 {
  text-shadow: 0.05px 0.05px #5e62d1;
}

.content {
  align-content: left;
}
.col-6, .col-5 {
  background-color: #f8f9fa;
  border-radius: 25px;
  border: 2px solid #5e62d1;
  padding: 20px;
}
.trainer-photos{
  display: flex;
}
.photo {
  flex: 100%;
  padding: 2px;
  
}

/* .col-3 img{
  height: 500px;
  width: 500px;
} */

/*h2.welcome-header {
  align-items: left;
}
*/
</style>
