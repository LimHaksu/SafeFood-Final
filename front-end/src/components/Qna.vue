<template>
<body>
  <b-container class="mt-5">
    <!-- 여기에 게시판 작성 -->
    <b-table
      id="board-table"
      :items="items"
      :fields="fields"
      :per-page="perPage"
      :current-page="currentPage"
    >
      <template v-slot:cell(title)="row">
        <a :href="'./qna_post?no='+row.item.no">{{row.item.title}}</a>
      </template>
    </b-table>
    <hr />
    <b-row>
      <b-col>
        <b-pagination
          v-model="currentPage"
          :total-rows="rows"
          :per-page="perPage"
          aria-controls="board-table"
        ></b-pagination>
      </b-col>
      <b-col align="right">
        <b-button v-if="authenticated" href="./qna_write" variant="outline-primary">글쓰기</b-button>
      </b-col>
    </b-row>
  </b-container>
</body>
</template>

<script>
/* eslint-disable no-console */
import axios from "axios";
// import Vue from "vue";
// Vue.prototype.EventBus = new Vue();
export default {
  data() {
    return {
      posts: [],
      errored: false,
      authenticated: false,
      perPage: 10,
      items: [],
      fields: [
        { key: "no", label: "번호" },
        { key: "title", label: "제목" },
        { key: "writer", label: "작성자" }
      ],
      currentPage: 1
    };
  },
  mounted() {
    if (this.$store.getters.user != null) {
      this.authenticated = true;
    } else {
      this.authenticated = false;
    }
    axios
      .get("http://localhost:8080/board")
      .then(response => {
        this.posts = response.data;
        this.posts.forEach(post => {
          this.items.push({
            no: post.no,
            title: post.title,
            writer: post.writer
          });
        });
        console.log(this.posts);
      })
      .catch(() => {
        this.errored = true;
      });
  },
  computed: {
    rows() {
      return this.items.length;
    }
  }
  // methods: {
  //   getPost(title) {
  //     this.EventBus.$emit("paramValue", title);
  //     location.href = "./qna_post";
  //   }
  // }
};
</script>
<style>
@import "../css/table.css";
</style>