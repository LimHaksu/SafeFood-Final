<template>
  <!-- <Header /> -->
  <!-- <board /> -->
  <BoardWrite />
  <!-- 
    <img alt="Vue logo" src="./assets/logo.png" />
  <HelloWorld msg="Welcome to Your Vue.js App" />-->
</template>

<script>
// import Header from "./components/Header.vue";
// import Board from "./components/Board.vue";
import BoardWrite from "./components/BoardWrite.vue";

export default {
  name: "app",
  components: {
    // Header
    // Board
    BoardWrite
  }
};
</script>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
