<template>
  <div>
    <article>
      <div
        class="text-center"
        style="float: center; color: white; background-color: gray; padding: 20px;"
      >
        <h3>WHAT WE PROVIDE</h3>
        <hr />
        <p>건강한 삶을 위한 먹거리 프로젝트</p>
      </div>
      <nav class="navbar navbar-expand-sm navbar-dark bg-dark" style="padding: 20px;">
        <table align="center">
          <tr>
            <td>
              <b-select name="country_id" v-model="condition">
                <option value="name">상품명</option>
                <option value="maker">제조사</option>
                <option value="material">영양정보</option>
              </b-select>
            </td>
            <td>
              <b-input type="text" v-model="contents" />
            </td>
            <td>
              <b-button @click="clickSearchButton" variant="light">검색</b-button>
            </td>
          </tr>
        </table>
      </nav>
    </article>
    <b-container v-if="rows>0">
      <b-table
        id="search-table"
        thead-class="hidden_header"
        :items="foodList"
        :fields="fields"
        :per-page="perPage"
        :current-page="currentPage"
      >
        <template v-slot:cell(img)="row">
          <img width="150px" :src="require(`@/assets/${row.item.img}`)" />
        </template>
        <template v-slot:cell(name)="row" align-middle>
          <div class="align-middle">
            <h2>
              <a :href="'./food_info?foodCode='+row.item.code">{{row.item.name}}</a>
            </h2>
          </div>
        </template>
        <template v-slot:cell(add)="row" v-if="authenticated">
          <b-button variant="primary" @click="clickAddition(row.item.code)">먹기</b-button>
        </template>
      </b-table>
      <b-row>
        <b-col>
          <b-pagination
            align="center"
            v-model="currentPage"
            :total-rows="rows"
            :per-page="perPage"
            aria-controls="board-table"
          ></b-pagination>
        </b-col>
      </b-row>
    </b-container>
  </div>
</template>

<script>
/* eslint-disable no-console */
import axios from "axios";
import moment from "moment";

export default {
  data() {
    return {
      authenticated: false,
      condition: "name",
      contents: "",
      foodList: [],
      fields: [
        { key: "img", label: "" },
        {
          key: "name",
          label: "상품명",
          tdClass: "align-middle"
        },
        { key: "maker", label: "제조사", tdClass: "align-middle" },
        { key: "calory", label: "칼로리(kcal)", tdClass: "align-middle" },
        { key: "add", label: "", tdClass: "align-middle" }
      ],
      perPage: 5,
      currentPage: 1
    };
  },
  mounted() {
    if (this.$store.getters.user != null) {
      this.authenticated = true;
    } else {
      this.authenticated = false;
    }
  },
  methods: {
    clickSearchButton() {
      if (this.contents == "") {
        this.contents = "*";
      }

      axios
        .get(
          "http://" +
            this.$store.getters.myurl +
            "/foodlist/" +
            this.condition +
            "/" +
            this.contents
        )
        .then(response => {
          this.foodList = [];
          for (let i = 0; i < response.data.list.length; ++i) {
            this.foodList.push(response.data.list[i]);
          }
        })
        .catch(() => {
          alert("foodList 못가져옴");
        });
    },
    clickAddition(foodCode) {
      let sessionInfo = this.$store.getters.user.id;

      if (sessionInfo == null) {
        return;
      }

      let info = {
        code: foodCode,
        date: moment(new Date(Date.now()))
          .format("YYYYMMDD")
          .toString(),
        id: sessionInfo
      };

      console.log(info);

      axios
        .post("http://" + this.$store.getters.myurl + "/intake", info)
        .then(() => {
          alert("먹었습니다.");
        })
        .catch(() => {
          alert("이미 먹은 음식입니다.");
        });
    }
  },
  computed: {
    rows() {
      return this.foodList.length;
    }
  }
};
</script>
<style>
.nameClass {
  max-width: 400px;
  vertical-align: middle;
}
</style>
