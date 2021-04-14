@import url('https://fonts.googleapis.com/css?family=Source+Code+Pro');
<template>
  <div id="app">
    <div class="container">
      <div class="col-12">
        <img
          id="logo"
          src="images\Git Logo Final.PNG"
          alt="Logo"
          style="width: 100%"
        />
      </div>
    </div>
    <div id="nav mb-0">
      <nav
        class="navbar navbar-expand-lg navbar-dark bg-dark container-xs container-xl container-lg container-md container-sm"
      >
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
        <div class="collapse navbar-collapse my-0" id="navbarSupportedContent">
          <ul class="navbar-nav mx-auto">
            <li class="nav-item active">
              <router-link v-bind:to="{ name: 'welcome' }" class="nav-link"
                >Home <span class="sr-only">(current)</span></router-link
              >
            </li>
            <li class="nav-item active">
              <router-link v-bind:to="{ name: 'List' }" class="nav-link"
                >Exercises <span class="sr-only">(current)</span></router-link
              >
            </li>
            <li class="nav-item active">
              <router-link v-bind:to="{ name: 'trainerbio' }" class="nav-link"
                >Our Trainers
                <span class="sr-only">(current)</span></router-link
              >
            </li>
            <li class="nav-item active">
              <router-link
                v-bind:to="{ name: 'workout' }"
                class="nav-link"
                v-show="loggedIn"
                >Workouts <span class="sr-only">(current)</span></router-link
              >
            </li>
            <li class="nav-item active">
              <router-link
                v-bind:to="{ name: 'historyView' }"
                class="nav-link"
                v-show="loggedIn"
                >Workout History
                <span class="sr-only">(current)</span></router-link
              >
            </li>

            <li class="nav-item active" v-if="admin">
              <router-link v-bind:to="{ name: 'Exercise' }" class="nav-link"
                >Add Exercise
                <span class="sr-only">(current)</span></router-link
              >
            </li>
            <li class="nav-item active" v-if="admin">
              <router-link v-bind:to="{ name: 'all-users' }" class="nav-link"
                >See Users
                <span class="sr-only">(current)</span></router-link
              >
            </li>
            <li class="nav-item active" v-if="!loggedIn">
              <a class="nav-link" href="/login">Login</a>
            </li>
            <li class="nav-item active" v-if="loggedIn">
              <a class="nav-link" href="/logout">Logout</a>
            </li>
          </ul>
        </div>
      </nav>
    </div>
     <div class="section mt-0">
      <div class="container p-0 my-0">
        <div id="terminal">
          <h5>Terminal</h5>
          <p class="git-fit">
            git fit -
            <span class="git-fit" style="color: #C29b00"
              >be your best version</span
            >
          </p>
        </div>
      </div>
    </div>

    <router-view />

    <!-- footer with social media icons -->
      <div class="container mx-auto mt-4 pt-4" style="background-color: var(--light)">
        <div class="col-12 mx-auto">
          <div id="social">
            <ul>
              <li>
                <a target="_blank" href="https://www.facebook.com/">
                  <i class="fab fa-facebook-f"></i
                ></a>
              </li>

              <li>
                <a
                  target="_blank"
                  href="https://www.instagram.com/gittin.this.fitness/"
                >
                  <i class="fab fa-instagram"></i
                ></a>
              </li>

              <li>
                <a target="_blank" href="mailto:gitfittrainers@gmail.com"
                  ><i class="far fa-envelope"></i
                ></a>
              </li>

              <li>
                <a target="_blank" href="https://twitter.com/Git_Fitness">
                  <i class="fab fa-twitter"></i
                ></a>
              </li>
            </ul>
          </div>
          <p class="text-center">&copy;2021 GitFit</p>
        </div>
      </div>
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
      if (this.$store.state.user.authorities == null) {
        return false;
      }
      return this.$store.state.user.authorities[0].name == "ROLE_ADMIN";
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
  color: #5fecc8;
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
  width: 100%;
  height: 25%;
  background-color: black;
  height: 20vh;
  color: white;
  font: 1.3rem Inconsolata, monospace;
  margin: 0px;
  padding: 2rem 0 0 1rem;
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
#social {
  width: 100%;
  margin: 0px;
  text-align: center;
  padding-top: 2%;
  margin-bottom: 1.2%;
  display: inline-block;
  border-top: solid 1px white;
}
footer p {
  color: ghostwhite;
  padding-bottom: 0%;
  text-align: center;
}

#social ul {
  padding: 0;
}

#social li {
  list-style: none;
  margin: 3%;
  margin-bottom: 3%;
  font-size: 1.2em;
  transition: 0.5s;
  display: inline;
}

#social .fab,
#social .far {
  font-size: 1.2em;
}

#social li:hover {
  opacity: 0.5;
  cursor: pointer;
}
</style>