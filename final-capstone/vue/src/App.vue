@import url('https://fonts.googleapis.com/css?family=Source+Code+Pro');
<template>
  <div id="app">
    <div id="nav">
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark container-xl">
        <a class="navbar-brand" href="#">GIT Fit</a>
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
              <span class="git-fit" style="color: #F9F871"
                >be your best version</span
              >
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
      if (this.$store.state.token != "") {
        console.log(
          this.$store.state.user.authorities[0].name === "ROLE_ADMIN"
        );
        return this.$store.state.user.authorities[0].name === "ROLE_ADMIN";
      }
      return false;
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
  background-color: #5e62d1;
}

td {
  color: white;
}

div#terminal {
  display: flex;
  flex-direction: column;
  width: 100%;
  height: 25%;
  background-color: black;
  height: 20vh;
  color: white;
  font: 1.3rem Inconsolata, monospace;
}
</style>
