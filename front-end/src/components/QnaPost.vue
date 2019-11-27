<template>
  <div class="container" id="post">
    <!-- 여기에 게시판 작성 -->
    <table class="table table-hover">
      <thead>
        <tr>
          <th>번호</th>
          <th>제목</th>
          <th>작성자</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>{{post.no}}</td>
          <td>{{post.title}}</td>
          <td>{{post.writer}}</td>
        </tr>
      </tbody>
    </table>
    <span style="color:black">
      <h5>내용</h5>
    </span>
    <div id="contents" v-show="!contents_modifyflag">
      <!--여기에 본문-->
      {{post.contents}}
      <br />
      <b-button v-if="post.writer==user_id" @click="contents_modify" variant="outline-primary">수정</b-button>
      <b-button v-if="post.writer==user_id" @click="deletePost" variant="danger">삭제</b-button>
    </div>
    <div id="contents" v-show="contents_modifyflag">
      <textarea style="width:700px; height:300px;" v-model="post.contents"></textarea>
      <br />
      <b-button @click="writePost" variant="primary">등록</b-button>
    </div>
    <hr />
    <span style="color:black">
      <h5>답변</h5>
    </span>
    <table class="table table-hover">
      <template v-for="r in reply_list">
        <tr v-bind:key="r.writer">
          <th>작성자</th>
        </tr>
        <tr v-bind:key="r.writer">
          <td>{{r.writer}}</td>
        </tr>
        <tr v-bind:key="r.writer">
          <br />
          <div id="contents" v-show="!comments_modifyflag || r.writer!=user_id">
            {{r.comments}}
            <div v-if="r.writer==user_id">
              <b-button @click="comments_modify(r.comments)" variant="outline-primary">수정</b-button>
              <b-button @click="deleteComment" variant="danger">삭제</b-button>
            </div>
          </div>
          <div id="contents" v-show="comments_modifyflag" v-if="r.writer==user_id">
            <textarea style="width:700px; height:300px;" v-model="reply.comments"></textarea>
            <br />
            <b-button @click="updateComment" variant="primary">등록</b-button>
          </div>
        </tr>
      </template>
      <div v-if="authenticated && !find_my_comments" id="comments">
        <textarea style="width:700px; height:300px;" v-model="reply.comments"></textarea>
        <br />
        <b-button @click="writeComment" variant="primary">등록</b-button>
      </div>
    </table>
  </div>
</template>
<script>
import axios from "axios";
// import Vue from "vue";
// Vue.prototype.EventBus = new Vue();
/* eslint-disable no-console */
var Request = function() {
  this.getParameter = function(name) {
    var rtnval = "";
    var nowAddress = unescape(location.href);
    var parameters = nowAddress
      .slice(nowAddress.indexOf("?") + 1, nowAddress.length)
      .split("&");
    for (var i = 0; i < parameters.length; i++) {
      var varName = parameters[i].split("=")[0];
      if (varName.toUpperCase() == name.toUpperCase()) {
        rtnval = parameters[i].split("=")[1];
        break;
      }
    }
    return rtnval;
  };
};
var request = new Request();
let paramValue = request.getParameter("no");
export default {
  //el: "#post",
  data() {
    return {
      post: {},
      reply_list: [],
      reply: {},
      find_my_comments: false,
      loading: true,
      errored: false,
      temp_comments: "",
      contents_modifyflag: false,
      comments_modifyflag: false,
      authenticated: false,
      user_id: ""
    };
  },
  methods: {
    writePost: function() {
      if (this.post.contents == "") {
        alert("내용이 없습니다");
        return;
      }
      axios
        .put("http://localhost:8080/board/", this.post)
        //.get('./emp.json')
        .then(response => {
          console.log(response);
          console.log(this.post);
        })
        .catch(() => {
          this.errored = true;
        })
        .finally(() => {
          this.loading = false;
          this.contents_modifyflag = false;
        });
    },
    writeComment: function() {
      if (this.reply.comments == "") {
        alert("내용이 없습니다");
        return;
      }
      this.reply.no = this.post.no;
      console.log(this.$store.getters.user);
      this.reply.writer = this.$store.getters.user.id;
      axios
        .post("http://localhost:8080/reply/", this.reply)
        //.get('./emp.json')
        .then(response => {
          console.log(response);
          console.log(this.reply);
        })
        .catch(() => {
          this.errored = true;
        })
        .finally(() => {
          this.loading = false;
          // location.href = location.href;
          this.$router.go(this.$router.currentRoute);
        });
    },
    updateComment: function() {
      if (this.reply.comments == "") {
        alert("내용이 없습니다");
        return;
      }
      this.post.comments = this.temp_comments;
      this.reply.no = this.post.no;
      this.reply.writer = this.$store.getters.user.id;
      console.log("코멘트 ", this.reply.comments);
      axios
        .put("http://localhost:8080/reply/", this.reply)
        .then(response => {
          console.log(response);
          console.log(this.reply);
        })
        .catch(() => {
          this.errored = true;
        })
        .finally(() => {
          this.loading = false;
          // location.href = location.href;
          this.$router.go(this.$router.currentRoute);
        });
    },
    contents_modify: function() {
      console.log("수정");
      this.contents_modifyflag = true;
    },
    comments_modify: function(comments) {
      this.comments_modifyflag = true;
      this.reply.comments = comments;
    },
    deletePost() {
      axios
        .delete("http://localhost:8080/board/" + this.post.no)
        .then(response => {
          response;
          console.log("삭제됐당");
          window.location.href = "./qna";
        })
        .catch(() => {
          this.errored = true;
        });
    },
    deleteComment() {
      this.reply.no = this.post.no;
      this.reply.writer = this.$store.getters.user.id;
      this.reply.comments = "";
      console.log("체크", this.reply);
      axios
        .delete(
          "http://localhost:8080/reply/" +
            this.reply.no +
            "/" +
            this.reply.writer
        )
        .then(() => {
          console.log("코멘트는 삭제될까..?");

          this.$router.go(this.$router.currentRoute);
        })
        .catch(() => {
          this.errored = true;
        });
    }
  },
  filters: {},
  mounted() {
    if (this.$store.getters.user != null) {
      this.authenticated = true;
      this.user_id = this.$store.getters.user.id;
    } else {
      this.authenticated = false;
    }

    axios
      .get("http://localhost:8080/board/" + paramValue)
      //.get('./emp.json')
      .then(response => {
        this.post = response.data.post;
        this.reply_list = response.data.reply_list;
        this.reply_list.forEach(reply => {
          // console.log(reply.writer);
          if (reply.writer == this.$store.getters.user.id) {
            this.find_my_comments = true;
            return;
          }
        });
        // console.log(this.post);
        // console.log(this.reply_list);
      })
      .catch(() => {
        this.errored = true;
      })
      .finally(() => (this.loading = false));
  }
};
</script>
<style>
@import "../css/table.css";
</style>