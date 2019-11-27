<template>
  <div>
    내친구
    <br />
    <input type="text" v-model="id" />
    <b-button @click="addFriend">추가</b-button>
    <br />
    <ul v-for="f in friend" :key="f">
      <li>
        <!-- TODO: # 대신에 이자식 섭취량 보러 가자 -->
        <a href="#">{{f}}</a>
      </li>
    </ul>
  </div>
</template>
<script>
/* eslint-disable no-console */
import axios from "axios";
/* eslint-disable no-console */
export default {
  data() {
    return {
      id: "",
      friend: []
    };
  },
  mounted() {
    this.getFriend();
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
          this.getFriend();
        })
        .catch(() => {});
    },
    getFriend() {
      axios
        .get("http://localhost:8080/friend/" + this.$store.getters.user.id)
        .then(res => {
          this.friend = res.data;
          console.log(this.friend);
        })
        .catch(() => {});
    }
  }
};
</script>
<style>
li {
  list-style: none;
}
</style>