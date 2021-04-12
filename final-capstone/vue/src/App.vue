@import url('https://fonts.googleapis.com/css?family=Source+Code+Pro');
<template>
  <div id="app">
    <img id="logo" src="images\Git Logo Final.PNG" alt="Logo">
  
    <div id="nav">
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark container-xl">
        <!-- <a class="navbar-brand" href="#">GIT Fit</a> -->
        
        <button
          class="navbar-toggler"
          type="button"
          data-toggle="collapse"
          data-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <router-link v-bind:to="{ name: 'welcome' }" class="nav-link"
                >Home <span class="sr-only">(current)</span></router-link
              >
            </li>
            <li class="nav-item">
              <router-link v-bind:to="{ name: 'List' }" class="nav-link"
                >Exercises <span class="sr-only">(current)</span></router-link
              >
            </li>
            <li class="nav-item">
              <router-link v-bind:to="{ name: 'workout' }" class="nav-link"
                >Workouts <span class="sr-only">(current)</span></router-link
              >
            </li>
              <li class="nav-item">
              <router-link v-bind:to="{ name: 'trainerbio' }" class="nav-link"
                >Our Trainers <span class="sr-only">(current)</span></router-link
              >
            </li>

            <li class="nav-item" v-if="admin">
              <router-link v-bind:to="{ name: 'Exercise' }" class="nav-link"
                >Add Exercise
                <span class="sr-only">(current)</span></router-link
              >
            </li>

           
            <li class="nav-item" v-if="!loggedIn">
              <a class="nav-link" href="/login">Login</a>
            </li>
            <li class="nav-item" v-if="loggedIn">
              <a class="nav-link" href="/logout">Logout</a>
            </li>

            <!-- <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                id="navbarDropdown"
                role="button"
                data-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false"
              >
                Dropdown
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Something else here</a>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" href="#">Disabled</a>
            </li> -->
          </ul>
          <!-- <form class="form-inline my-2 my-lg-0">
            <input
              class="form-control mr-sm-2"
              type="text"
              placeholder="Username"
              aria-label="Username"
            />
            <input
              class="form-control mr-sm-2"
              type="text"
              placeholder="Password"
              aria-label="Password"
            />
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
              Login
            </button>

          </form> -->
        </div>
      </nav>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div id="terminal">
            <h5>Terminal</h5>
            <p class="git-fit">
              git fit -
              <span class="git-fit" style="color: #C29b00"
                >be your best version</span>
            </p>
          </div>
        </div>
      </div>
      
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <router-view />
        </div>
      </div>
    </div>

    <!-- footer with social media icons -->
    <footer>
        <div id="social">
            <ul>
                <li><a target="_blank"  href="https://www.facebook.com/"> <i class="fab fa-facebook-f"></i></a></li>
                
                <li><a target="_blank" href="https://www.instagram.com/gittin.this.fitness/"> <i class="fab fa-instagram"></i></a></li>
                
                <li><a target="_blank" href="mailto:gitfittrainers@gmail.com"><i class="far fa-envelope"></i></a></li>
                    
                <li><a target="_blank"  href="https://twitter.com/Git_Fitness"> <i class="fab fa-twitter"></i></a></li>
            </ul>
        </div>
        <p>&copy;2021 GitFit</p>
    </footer>

  </div>
</template>
<script>
import authService from "./services/AuthService";

export default {
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: "",
      },
      invalidCredentials: false,
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then((response) => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/home");
          }
        })
        .catch((error) => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    },
  },
  computed: {
    loggedIn() {
      console.log(this.$store.state.token);
      return this.$store.state.token != "";
    },
    admin() {
      // console.log(this.$store.state.user.authorities.includes( 'ROLE_ADMIN'));
      // return this.$store.state.user.authorities.includes("ROLE_ADMIN");
      return true;
    },
  },
};
</script>
<style>
#terminal p {
  border-right: solid 3px rgba(0, 255, 0, 0.75);

  white-space: nowrap;
  overflow: hidden;
  font-family: "Source Code Pro", monospace;
  font-size: 2rem;
  color: #184d01;
}

/* Animation */
#terminal p {
  animation: animated-text 4s steps(29, end) 1s 1 normal both,
    animated-cursor 600ms steps(29, end) infinite;
}

/* text animation */
@keyframes animated-text {
  from {
    width: 0;
  }
  to {
    width: 100%;
  }
}

/* cursor animations */
@keyframes animated-cursor {
  from {
    border-right-color: rgba(0, 255, 0, 0.75);
  }
  to {
    border-right-color: transparent;
  }
}

body {
  background-color: white;
}

td {
  color: black;
}

div#terminal {
  display: flex;
  flex-direction: column;
  width: 50%;
  height: 25%;
  background-color: #f8f9fa;
  height: 20vh;
  color: black;
  font: 1.3rem Inconsolata, monospace;
}

img#logo {
  /*align-items: center;
  justify-content: center;
  padding-left: 500px;*/
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50%;
}


/* css for footer with social media icons */
#social{
    width:100%;
    margin: 0px;
    text-align: center;
    padding-top: 2%;
    margin-bottom: 1.2%;
    display: inline-block; 
    border-top: solid 1px white;
}
footer p{
    color: ghostwhite;
    padding-bottom: 0%;
    text-align: center;  
}

#social ul{
  padding: 0;
}

#social li{
    list-style: none;
    margin: 3%;
    margin-bottom: 3% ;
    font-size: 1.2em;
    transition: .5s;
    display: inline;
}

#social .fab, #social .far{
    font-size: 1.2em;
}

#social li:hover{
    opacity: .5;
    cursor: pointer;
}



</style>
