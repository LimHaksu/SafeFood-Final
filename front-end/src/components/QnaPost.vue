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
    <span style="color:#ffffff">
      <h5>내용</h5>
    </span>
    <div id="contents" v-show="!contents_modifyflag">
      <!--여기에 본문-->
      {{post.contents}}
      <br />
      <a class="btn btn-default pull-right" @click="contents_modify">수정</a>
    </div>
    <div id="contents" v-show="contents_modifyflag">
      <textarea style="width:700px; height:300px;" v-model="post.contents"></textarea>
      <br />
      <a class="btn btn-default pull-right" @click="writePost">등록</a>
    </div>
    <a class="btn btn-default pull-right" @click="deletePost">삭제</a>
    <hr />
    <span style="color:#ffffff">
      <h5>답변</h5>
    </span>
    <div id="contents" v-show="post.comments!=null && !comments_modifyflag">
      {{post.comments}}
      <br />
      <a class="btn btn-default pull-right" @click="comments_modify">수정</a>
    </div>
    <div id="comments" v-show="post.comments==null || comments_modifyflag">
      <textarea style="width:700px; height:300px;" v-model="temp_comments"></textarea>
      <br />
      <a class="btn btn-default pull-right" @click="writeComment">등록</a>
    </div>
    <a class="btn btn-default pull-right" @click="deleteComment">삭제</a>
  </div>
</template>
<script>
/* eslint-disable no-console */
import axios from "axios";
// import Vue from "vue";
// Vue.prototype.EventBus = new Vue();
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
      loading: true,
      errored: false,
      temp_comments: "",
      contents_modifyflag: false,
      comments_modifyflag: false
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
      if (this.temp_comments == "" || this.temp_comments == null) {
        alert("내용이 없습니다");
        return;
      }
      this.post.comments = this.temp_comments;
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
          this.comments_modifyflag = false;
          this.temp_comments = null;
        });
    },
    contents_modify: function() {
      console.log("수정");
      this.contents_modifyflag = true;
    },
    comments_modify: function() {
      this.comments_modifyflag = true;
      this.temp_comments = this.post.comments;
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
      this.post.comments = null;
      axios
        .put("http://localhost:8080/board/", this.post)
        .then(response => {
          response;
          console.log("코멘트는 삭제될까..?");
        })
        .catch(() => {
          this.errored = true;
        });
    }
  },
  filters: {},
  mounted() {
    axios
      .get("http://localhost:8080/board/" + paramValue)
      //.get('./emp.json')
      .then(response => {
        this.post = response.data;
        console.log(this.post);
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