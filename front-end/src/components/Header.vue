<template>
  <header>
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
      <b-button v-b-modal.modal-1>Sign up</b-button>
      <b-button v-b-modal.modal-login>Login</b-button>
      <button
        type="button"
        class="btn btn-secondary"
        id="btn_logout"
        onClick="location.href='logout.do'"
      >Logout</button>
      <button
        type="button"
        class="btn btn-secondary"
        id="btn_user_info"
        onClick="location.href='userInfo.jsp'"
      >회원정보</button>
    </nav>
    <form action="insert.do" method="post">
      <b-modal b-modal id="modal-1" hide-footer>
        <h4 class="modal-title" id="singInlLabel">회원가입</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <!-- </div> -->

        <div class="modal-body">
          <div class="form-group">
            <label for="id" class="control-label">아이디:</label>
            <input type="text" name="id" class="form-control" v-model="signUpModel.id" />
          </div>
          <div class="form-group">
            <label for="password" class="control-label">비밀번호:</label>
            <input
              type="password"
              class="form-control"
              v-model="signUpModel.password"
              placeholder="숫자 영어 포함 6글자 이상"
            />
          </div>
          <div class="form-group">
            <label for="name" class="control-label">이름:</label>
            <input
              type="text"
              class="form-control"
              placeholder="User Name"
              v-model="signUpModel.name"
            />
          </div>
          <div class="form-group">
            <label for="address" class="control-label">주소:</label>
            <input
              type="text"
              class="form-control"
              placeholder="address"
              v-model="signUpModel.address"
            />
          </div>
          <div class="form-group">
            <label for="phone" class="control-label">전화번호:</label>
            <input
              type="text"
              class="form-control"
              placeholder="010-xxxx-xxxx"
              v-model="signUpModel.phone_number"
            />
          </div>
          <div class="form-group">
            <label for="allergic" class="control-label">알레르기:</label>
            <input type="checkbox" name="allergy" value="대두" />
            대두
            <input type="checkbox" name="allergy" value="땅콩" />
            땅콩
            <input type="checkbox" name="allergy" value="우유" />
            우유
            <input type="checkbox" name="allergy" value="게" />
            게
            <input type="checkbox" name="allergy" value="새우" />
            새우
            <input type="checkbox" name="allergy" value="참치" />
            참치
            <input type="checkbox" name="allergy" value="연어" />
            연어
            <input type="checkbox" name="allergy" value="쑥" />
            쑥
            <input type="checkbox" name="allergy" value="소고기" />
            소고기
            <input type="checkbox" name="allergy" value="닭고기" />
            닭고기
            <input type="checkbox" name="allergy" value="돼지고기" />
            돼지고기
            <input type="checkbox" name="allergy" value="복숭아" />
            복숭아
            <input type="checkbox" name="allergy" value="민들레" />
            민들레
            <input type="checkbox" name="allergy" value="계란흰자" />
            계란흰자
          </div>
        </div>
        <input type="hidden" name="checkboxStr" id="checkbox_str" />
        <div class="modal-footer">
          <input type="button" value="등록" class="btn btn-primary" @click="signUp" />
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </b-modal>
    </form>

    <b-modal b-modal id="modal-login" hide-footer>
      <h4 class="modal-title" id="LoginLabel">로그인</h4>
      <form method="post" action="login.do" id="layout_login">
        <div class="modal-body">
          <div class="form-group">
            <label for="userid" class="control-label">아이디:</label>
            <input type="text" class="form-control" v-model="model.id" />
          </div>
          <div class="form-group">
            <label for="password" class="control-label">비밀번호:</label>
            <input type="password" class="form-control" v-model="model.password" />
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-light" id="userLogin" @click="login">로그인</button>
          <button type="button" class="btn btn-dark" id="userPwFind">비밀번호 찾기</button>
        </div>
      </form>
    </b-modal>

    <nav class="navbar navbar-expand-sm navbar-white bg-white">
      <div class="collapse navbar-collapse" id="info">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a href="#" class="nav-link">공지사항</a>
          </li>
          <li class="nav-item" id="btn_product_info">
            <a href="#" class="nav-link">상품정보</a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">베스트 섭취 정보</a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">내 섭취 정보</a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">예상 섭취 정보</a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">검색</a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">Q&A</a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
</template>



<script>
import axios from "axios";

export default {
  data() {
    return {
      model: {
        id: "",
        password: ""
      },
      signUpModel: {
        id: "",
        password: "",
        name: "",
        address: "",
        phone_number: "",
        allergy: ""
      }
    };
  },
  methods: {
    signUp() {
      // 체크박스 하나로 묶었다..
      let boxes = document.getElementsByClassName("checkbox");
      let checked = [];
      for (let i = 0; boxes[i]; ++i) {
        if (boxes[i].checked) {
          checked.push(boxes[i].name);
        }
      }
      let checkedStr = checked.join(",");

      this.signUpModel.allergy = checkedStr;

      axios
        .post("http://localhost:8080/user", this.signUpModel)
        .then(response => {
          /* eslint-disable no-console */
          console.log("가입됐는데 확인해볼래?");
          console.log(response);
        })
        .catch(() => {
          console.log("가입 안됨");
        });
    },
    login() {
      axios
        .post("http://localhost:8080/login", this.model)
        //.get('./emp.json')
        .then(response => {
          /* eslint-disable no-console */
          //   console.log(response);
          this.$session.flash.set("user", response.data);
          console.log(this.$session.flash.get("user"));
        })
        .catch(() => {
          alert("아이디 혹은 비밀번호가 틀렸어");
        });
    }
  }
};
</script>
<style>
</style>