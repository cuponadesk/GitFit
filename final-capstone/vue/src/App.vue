<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link> &nbsp;|&nbsp;
      <a :href="$router.resolve({name: 'Exercise'}).href">Add Exercise</a>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'List' }" v-if="$store.state.token != ''">List</router-link>

    </div>
    <router-view />
  </div>
</template>
