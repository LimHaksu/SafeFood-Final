<template v-slot:modal-footer="{ ok, cancel, hide }">
  <header>
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
      <b-button id="nav_btn" v-b-modal.modal-1 v-if="!authenticated">Sign up</b-button>
      <b-button id="nav_btn" v-b-modal.modal-login v-if="!authenticated">Login</b-button>
      <b-button id="nav_btn" @click="logout" v-if="authenticated">Logout</b-button>
      <b-button id="nav_btn" href="./user_info" v-if="authenticated">회원정보</b-button>
    </nav>
    <b-modal id="modal-1" ref="ref-modal-signup" title="회원가입">
      <form action="insert.do" method="post">
        <!-- </div> -->
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
          <input type="checkbox" name="allergy" value="대두" v-model="checked" />
          대두
          <input type="checkbox" name="allergy" value="땅콩" v-model="checked" />
          땅콩
          <input type="checkbox" name="allergy" value="우유" v-model="checked" />
          우유
          <input type="checkbox" name="allergy" value="게" v-model="checked" />
          게
          <input type="checkbox" name="allergy" value="새우" v-model="checked" />
          새우
          <input type="checkbox" name="allergy" value="참치" v-model="checked" />
          참치
          <input type="checkbox" name="allergy" value="연어" v-model="checked" />
          연어
          <input type="checkbox" name="allergy" value="쑥" v-model="checked" />
          쑥
          <input type="checkbox" name="allergy" value="소고기" v-model="checked" />
          소고기
          <input type="checkbox" name="allergy" value="닭고기" v-model="checked" />
          닭고기
          <input type="checkbox" name="allergy" value="돼지고기" v-model="checked" />
          돼지고기
          <input type="checkbox" name="allergy" value="복숭아" v-model="checked" />
          복숭아
          <input type="checkbox" name="allergy" value="민들레" v-model="checked" />
          민들레
          <input type="checkbox" name="allergy" value="계란흰자" v-model="checked" />
          계란흰자
        </div>
        <input type="hidden" name="checkboxStr" id="checkbox_str" />
        <!-- <div class="modal-footer">
          <input type="button" value="등록" class="btn btn-primary" @click="signUp" />
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>-->
      </form>
      <template v-slot:modal-footer="{ok,cancel}">
        <b-button variant="danger" @click="cancel()">Close</b-button>
        <b-button variant="success" @click="signUp">등록</b-button>
      </template>
    </b-modal>

    <b-modal id="modal-login" ref="ref-modal-login" title="로그인">
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
        <!-- <div class="modal-footer">
          <button type="button" class="btn btn-light" id="userLogin" @click="login">로그인</button>
          <button type="button" class="btn btn-dark" id="userPwFind">비밀번호 찾기</button>
        </div>-->
        <!-- Emulate built in modal footer ok and cancel button actions -->
        <!-- Button with custom close trigger value -->
      </form>
      <template v-slot:modal-footer="{ok,cancel}">
        <b-button variant="danger" @click="cancel()">Cancel</b-button>
        <b-button variant="outline-secondary" id="userPwFind">비밀번호 찾기</b-button>
        <b-button variant="success" id="userLogin" @click="login">로그인</b-button>
      </template>
    </b-modal>

    <b-nav tabs>
      <b-nav-item v-bind:active="tab === 1" href="./">메인</b-nav-item>
      <b-nav-item v-bind:active="tab === 2" href="./my_intake" v-if="authenticated">내 섭취 정보</b-nav-item>
      <b-nav-item v-bind:active="tab === 3" href="./my_friends" v-if="authenticated">내 친구</b-nav-item>
      <b-nav-item v-bind:active="tab === 4" href="./qna">Q&A</b-nav-item>
    </b-nav>
  </header>
</template>

<script>
import axios from "axios";
/* eslint-disable no-console */

export default {
  data() {
    return {
      tab: 1,
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
      },
      checked: [],
      authenticated: false
    };
  },
  mounted() {
    if (this.$store.getters.user != null) {
      this.authenticated = true;
    } else {
      this.authenticated = false;
    }
    let tab_label = location.href.split("http://localhost:8081/")[1];
    console.log(tab_label);
    if (tab_label == "") {
      this.tab = 1;
    } else if (tab_label == "my_intake") {
      this.tab = 2;
    } else if (tab_label == "my_friends") {
      this.tab = 3;
    } else if (tab_label == "qna") {
      this.tab = 4;
    }
  },
  methods: {
    /* eslint-disable no-console */

    signUp() {
      let checkedStr = this.checked.join(",");
      console.log("체크 ", checkedStr);
      this.signUpModel.allergy = checkedStr;
      console.log(this.signUpModel);
      axios
        .post("http://localhost:8080/user", this.signUpModel)
        .then(response => {
          console.log("가입됐는데 확인해볼래?");
          console.log(response);
          this.$refs["ref-modal-signup"].hide();
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
          console.log(response.data);
          this.$store.commit("login", response.data);
          this.authenticated = true;
          //this.$refs["ref-modal-login"].hide();
          location.href = "./";
        })
        .catch(() => {
          alert("아이디 혹은 비밀번호가 틀렸어");
        });
    },
    logout() {
      this.$store.commit("logout");
      this.authenticated = false;
      location.href = "./";
    }
  }
};
</script>
<style>
#nav_btn {
  margin-right: 0.3em;
}
</style>