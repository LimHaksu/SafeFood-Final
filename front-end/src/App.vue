<template>
  <div id="app">
    <div id="header">
      <Header />
    </div>
    <router-view></router-view>
    <div id="footer">
      <!-- footer가 들어갈 자리 -->
      <Footer />
    </div>
  </div>
  <!-- 
    <img alt="Vue logo" src="./assets/logo.png" />
  <HelloWorld msg="Welcome to Your Vue.js App" />-->
</template>

<script>
import Header from "./components/Header.vue";
// import Board from "./components/Board.vue";
// import BoardWrite from "./components/BoardWrite.vue";
import Footer from "./components/Footer.vue";

export default {
  name: "app",
  components: {
    Header,
    // Board
    // BoardWrite,
    Footer
  }
};
</script>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  /* color: #2c3e50; */
  color: white;
  background-color: #525864;
}
</style>
