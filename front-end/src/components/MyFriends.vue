<template>
  <div>
    내친구
    <input type="text" v-model="id" />
    <b-button @click="addFriend">추가</b-button>
  </div>
</template>
<script>
import axios from "axios";

export default {
  data() {
    return {
      id: ""
    };
  },
  methods: {
    addFriend() {
      console.log(this.id + "추가");
      console.log(this.$store.getters.user.id + "세션 아이디");

      let info = {
        ownerId: this.$store.getters.user.id,
        friendId: this.id
      };

      axios
        .post("http://localhost:8080/friend", info)
        .then(() => {
          console.log("으악");
        })
        .catch(error => {
          console.log(error);
        });
    }
  }
};
</script>
<style>
</style>