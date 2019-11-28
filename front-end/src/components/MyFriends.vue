<template>
  <div class="mt-5">
    내친구
    <br />
    <input type="text" v-model="id" />
    <b-button @click="addFriend">추가</b-button>
    <br />
    <ul v-for="f in friend" :key="f">
      <li>
        <a :href="'./friend_intake?friend=' + f">{{f}}</a>
      </li>
    </ul>
  </div>
</template>
<script>
/* eslint-disable no-console */
import axios from "axios";

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
      let info = {
        ownerId: this.$store.getters.user.id,
        friendId: this.id
      };

      axios
        .post("http://localhost:8080/friend", info)
        .then(() => {
          alert("추가 되었습니다.");
          this.getFriend();
        })
        .catch(() => {
          alert("DB 없는 사람이거나 이미 추가했거나 자기 자신입니다.");
        });
    },
    getFriend() {
      axios
        .get("http://localhost:8080/friend/" + this.$store.getters.user.id)
        .then(res => {
          this.friend = res.data;
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