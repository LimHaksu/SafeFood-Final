<template>
  <div class="jumbotron">
    <h2>
      <strong>User Information</strong>
    </h2>

    <form id="user_info">
      <h1 style="text-align:left">회원정보수정</h1>
      <table id="table_signup">
        <tr>
          <td>
            아이디
            <font style="color: red">*</font>
          </td>
          <td>
            <input
              type="text"
              size="35"
              name="id"
              placeholder
              readonly="readonly"
              style="width: 400px; height: 30px"
              v-bind:value="user.id"
            />
          </td>
        </tr>
        <tr>
          <td>
            비밀번호
            <font style="color: red">*</font>
          </td>
          <td>
            <input
              type="password"
              size="35"
              name="password"
              id="userpw"
              placeholder="영문, 숫자 포함 6자리이상"
              style="width: 400px; height: 30px"
              v-model="user.password"
            />
          </td>
        </tr>
        <tr>
          <td>
            이름
            <font style="color: red">*</font>
          </td>
          <td>
            <input
              type="text"
              size="35"
              name="name"
              placeholder="User Name"
              style="width: 400px; height: 30px"
              v-bind:value="user.name"
            />
          </td>
        </tr>
        <tr>
          <td>
            주소
            <font style="color: red">*</font>
          </td>
          <td>
            <input
              type="text"
              size="35"
              name="address"
              placeholder="address"
              style="width: 400px; height: 30px"
              v-bind:value="user.address"
            />
          </td>
        </tr>
        <tr>
          <td>
            전화번호
            <font style="color: red">*</font>
          </td>
          <td>
            <input
              type="text"
              size="35"
              name="phone_number"
              placeholder="010-xxxx-xxxx"
              style="width: 400px; height: 30px"
              v-bind:value="user.phone_number"
            />
          </td>
        </tr>
        <tr>
          <td valign="top" style="margin-top:10px">
            알레르기
            <font style="color: red">*</font>
          </td>
          <td>
            <fieldset form="alergy" style="width:370px; text-align:left;">
              <input type="checkbox" v-model="allergy" value="대두" style="margin-bottom: 20px" />대두
              <input type="checkbox" v-model="allergy" value="땅콩" style="margin-bottom: 20px" />땅콩
              <input type="checkbox" v-model="allergy" value="우유" style="margin-bottom: 20px" />우유
              <input type="checkbox" v-model="allergy" value="게" style="margin-bottom: 20px" />게
              <br />
              <input type="checkbox" v-model="allergy" value="새우" style="margin-bottom: 20px" />새우
              <input type="checkbox" v-model="allergy" value="참치" style="margin-bottom: 20px" />참치
              <input type="checkbox" v-model="allergy" value="연어" style="margin-bottom: 20px" />연어
              <input type="checkbox" v-model="allergy" value="쑥" style="margin-bottom: 20px" />쑥
              <br />
              <input type="checkbox" v-model="allergy" value="소고기" style="margin-bottom: 20px" />소고기
              <input type="checkbox" v-model="allergy" value="닭고기" style="margin-bottom: 20px" />닭고기
              <input type="checkbox" v-model="allergy" value="돼지고기" style="margin-bottom: 20px" />돼지고기
              <br />
              <input type="checkbox" v-model="allergy" value="복숭아" />복숭아
              <input type="checkbox" v-model="allergy" value="민들레" />민들레
              <input type="checkbox" v-model="allergy" value="계란흰자" />계란흰자
            </fieldset>
          </td>
        </tr>
      </table>

      <input
        type="button"
        value="수정 ✓"
        @click="modify"
        style="font-weight:bold; float:left; width: 100px; height: 30px; color: white; background-color: #00bfff; border: 1 solid #00bfff; margin-left: 200px;"
      />
      <input
        type="button"
        value="탈퇴"
        @click="remove_user"
        style="font-weight:bold; float:left; width: 100px; height: 30px; color: white; background-color: #00bfff; border: 1 solid #00bfff; margin-left: 50px;"
      />
    </form>
  </div>
</template>
<script>
import axios from "axios";
/* eslint-disable no-console */
export default {
  data() {
    return {
      user: {},
      allergy: []
    };
  },
  mounted() {
    this.user = this.$store.getters.user;
    this.user.password = null;
    console.log(this.user);
    this.allergy = this.user.allergy.split(",");
  },
  watch: {
    allergy() {
      this.user.allergy = this.allergy.join(",");
    }
  },
  methods: {
    modify() {
      if (this.user.password == null) {
        alert("비밀번호를 입력해 주세요.");
        return;
      }
      console.log(this.user);
      axios
        .put("http://localhost:8080/user/", this.user)
        .then(response => {
          this.$store.commit("login", this.user);
          console.log(response);
        })
        .catch(() => {
          this.errored = true;
          console.log("에러");
        })
        .finally(() => {
          /* TODO: router 이용해서 화면 이동하는 것으로 바꾸자 */
          window.location.href = "./";
        });
    },
    remove_user() {
      axios
        .delete("http://localhost:8080/user/" + this.user.id)
        .then(response => {
          console.log(response);
          this.$store.commit("logout");
        })
        .catch(() => {
          console.log("탈퇴 에러");
        })
        .finally(() => {
          window.location.href = "./";
        });
    }
  }
};
</script>
<style>
</style>