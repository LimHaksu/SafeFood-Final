<template>
  <div>
    <nav style="padding: 20px;">
      <div>
        <div class="container" id="post">
          <!-- 여기에 게시판 작성 -->
          <table class="table table-hover">
            <thead>
              <tr>
                <th>제목</th>
                <th>작성자</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>
                  <input type="text" style="width:400px" v-model="post.title" />
                </td>
                <td>
                  <input type="text" v-model="post.writer" readonly />
                </td>
              </tr>
            </tbody>
          </table>
          <hr />
          <textarea style="width:700px; height:500px;" v-model="post.contents"></textarea>
          <br />
          <b-button @click="wirte" variant="outline-primary">등록</b-button>
        </div>
      </div>
    </nav>
    <div id="main_page"></div>
  </div>
</template>

<script>
/* eslint-disable no-console */
import axios from "axios";
export default {
  data() {
    return {
      post: {
        writer: null
      },
      errored: false
    };
  },
  mounted() {
    this.post.writer = this.$store.getters.user.id;
  },
  methods: {
    /* eslint-disable no-console */

    write: function() {
      console.log(this.post);
      axios
        .post("http://localhost:8080/board/", this.post)
        .then(response => {
          response;
          console.log(this.post);
        })
        .catch(error => {
          console.log(error);
          this.errored = true;
        })
        .finally(() => {
          /* TODO: router 이용해서 화면 이동하는 것으로 바꾸자 */
          window.location.href = "./qna";
        });
    }
  }
};
</script>