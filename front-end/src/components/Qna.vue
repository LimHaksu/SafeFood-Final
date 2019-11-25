<template>
<body>
  <div class="container">
    <!-- 여기에 게시판 작성 -->
    <table class="table table-hover">
      <thead>
        <tr>
          <th>번호</th>
          <th style="width:400px">제목</th>
          <th>작성자</th>
        </tr>
      </thead>
      <tbody id="listtemplate">
        <tr v-for="post in posts" v-bind:key="post.no">
          <td>{{post.no}}</td>
          <td>
            <!-- TODO: 페이지 이동을 router를 이용하게 하자 -->
            <a :href="'./qna_post?no='+post.no">{{post.title}}</a>
            <!-- <a @click="getPost(post.title)">{{post.title}}</a> -->
          </td>
          <td>{{post.writer}}</td>
        </tr>
      </tbody>
    </table>
    <hr />
    <a class="btn btn-default pull-right" href="./qna_write">글쓰기</a>
  </div>
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
      errored: false
    };
  },
  mounted() {
    axios
      .get("http://localhost:8080/board")
      .then(response => {
        this.posts = response.data;
        console.log(this.posts);
      })
      .catch(() => {
        this.errored = true;
      });
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