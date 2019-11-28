<template>
  <div>
    <h1>나와 {{friendId}}의 섭취정보</h1>
    <b-row>
      <b-col>
        <full-calendar @day-click="dayClick" :config="config" />
      </b-col>
      <b-col>
        내 섭취량
        <b-table :items="myNutrient" :fields="fields_statistics">
          <template v-slot:cell(nuturition)="row">
            <a>{{row.item.nuturition}}</a>
          </template>
          <template v-slot:cell(amount)="row">
            <a>{{row.item.amount}}</a>
          </template>
        </b-table>
      </b-col>
      <b-col>
        {{friendId}}의 섭취량
        <b-table :items="friendNutrient" :fields="fields_statistics">
          <template v-slot:cell(nuturition)="row">
            <a>{{row.item.nuturition}}</a>
          </template>
          <template v-slot:cell(amount)="row">
            <a>{{row.item.amount}}</a>
          </template>
        </b-table>
      </b-col>
    </b-row>
  </div>
</template>
<script>
/* eslint-disable no-console */
import axios from "axios";
import { FullCalendar } from "vue-full-calendar";
import "fullcalendar/dist/fullcalendar.css";
import interactionPlugin from "@fullcalendar/interaction";
import moment from "moment";

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
let paramValue = request.getParameter("friend");

export default {
  data() {
    return {
      config: {
        defaultView: "month",
        height: 500
      },
      plugins: [interactionPlugin],
      selected_date: "",
      myItems: [],
      myNutrient: [],
      friendItems: [],
      friendNutrient: [],
      fields_statistics: [
        { key: "nuturition", label: "영양소" },
        { key: "amount", label: " 섭취량" }
      ],
      myId: this.$store.getters.user.id,
      friendId: paramValue
    };
  },
  methods: {
    dayClick(info) {
      this.selected_date = info;
      this.myItems = [];
      this.myNutrient = [];
      this.friendItems = [];
      this.friendNutrient = [];
      let date_string = moment(info._d)
        .format("YYYYMMDD")
        .toString();

      axios
        .get("http://localhost:8080/intake/" + this.myId + "/" + date_string)
        .then(response => {
          let data = response.data;
          let supportpereat = 0;
          let calory = 0;
          let carbo = 0;
          let protein = 0;
          let fat = 0;
          let sugar = 0;
          let natrium = 0;
          let chole = 0;
          let fattyacid = 0;
          let transfat = 0;
          Promise.all(
            data.map(async info => {
              return axios
                .get("http://localhost:8080/food/" + info.code)
                .then(response => {
                  this.myItems.push({
                    name: response.data.name,
                    code: response.data.code,
                    date: date_string
                  });
                  // total add - start
                  calory += response.data.calory;
                  carbo += response.data.carbo;
                  chole += response.data.chole;
                  fat += response.data.fat;
                  fattyacid += response.data.fattyacid;
                  natrium += response.data.natrium;
                  protein += response.data.protein;
                  sugar += response.data.sugar;
                  supportpereat += response.data.supportpereat;
                  transfat += response.data.transfat;
                });
            })
          ).then(() => {
            if (this.myItems.length > 0) {
              this.detail_flag = true;
              this.myNutrient.push({
                key: "supportpereat",
                nuturition: "제공량(g)",
                amount: parseFloat(supportpereat.toFixed(2))
              });
              this.myNutrient.push({
                key: "calory",
                nuturition: "칼로리(kcal)",
                amount: parseFloat(calory.toFixed(2))
              });
              this.myNutrient.push({
                key: "carbo",
                nuturition: "탄수화물(g)",
                amount: parseFloat(carbo.toFixed(2))
              });
              this.myNutrient.push({
                key: "protein",
                nuturition: "단백질(g)",
                amount: parseFloat(protein.toFixed(2))
              });
              this.myNutrient.push({
                key: "fat",
                nuturition: "지방(g)",
                amount: parseFloat(fat.toFixed(2))
              });
              this.myNutrient.push({
                key: "sugar",
                nuturition: "당류(g)",
                amount: parseFloat(sugar.toFixed(2))
              });
              this.myNutrient.push({
                key: "natrium",
                nuturition: "나트륨(mg)",
                amount: parseFloat(natrium.toFixed(2))
              });
              this.myNutrient.push({
                key: "chole",
                nuturition: "콜레스테롤(mg)",
                amount: parseFloat(chole.toFixed(2))
              });
              this.myNutrient.push({
                key: "fattyacid",
                nuturition: "지방산(g)",
                amount: parseFloat(fattyacid.toFixed(2))
              });
              this.myNutrient.push({
                key: "transfat",
                nuturition: "트랜스지방(g)",
                amount: parseFloat(transfat.toFixed(2))
              });
              console.log(this.myNutrient);
            } else {
              this.detail_flag = false;
            }
          });
        })
        .catch(error => {
          console.log(error);
        });

      /* 여기부터 friend */
      axios
        .get(
          "http://localhost:8080/intake/" + this.friendId + "/" + date_string
        )
        .then(response => {
          let data = response.data;
          let supportpereat = 0;
          let calory = 0;
          let carbo = 0;
          let protein = 0;
          let fat = 0;
          let sugar = 0;
          let natrium = 0;
          let chole = 0;
          let fattyacid = 0;
          let transfat = 0;
          Promise.all(
            data.map(async info => {
              return axios
                .get("http://localhost:8080/food/" + info.code)
                .then(response => {
                  this.friendItems.push({
                    name: response.data.name,
                    code: response.data.code,
                    date: date_string
                  });
                  // total add - start
                  calory += response.data.calory;
                  carbo += response.data.carbo;
                  chole += response.data.chole;
                  fat += response.data.fat;
                  fattyacid += response.data.fattyacid;
                  natrium += response.data.natrium;
                  protein += response.data.protein;
                  sugar += response.data.sugar;
                  supportpereat += response.data.supportpereat;
                  transfat += response.data.transfat;
                });
            })
          ).then(() => {
            if (this.friendItems.length > 0) {
              this.detail_flag = true;
              this.friendNutrient.push({
                key: "supportpereat",
                nuturition: "제공량(g)",
                amount: parseFloat(supportpereat.toFixed(2))
              });
              this.friendNutrient.push({
                key: "calory",
                nuturition: "칼로리(kcal)",
                amount: parseFloat(calory.toFixed(2))
              });
              this.friendNutrient.push({
                key: "carbo",
                nuturition: "탄수화물(g)",
                amount: parseFloat(carbo.toFixed(2))
              });
              this.friendNutrient.push({
                key: "protein",
                nuturition: "단백질(g)",
                amount: parseFloat(protein.toFixed(2))
              });
              this.friendNutrient.push({
                key: "fat",
                nuturition: "지방(g)",
                amount: parseFloat(fat.toFixed(2))
              });
              this.friendNutrient.push({
                key: "sugar",
                nuturition: "당류(g)",
                amount: parseFloat(sugar.toFixed(2))
              });
              this.friendNutrient.push({
                key: "natrium",
                nuturition: "나트륨(mg)",
                amount: parseFloat(natrium.toFixed(2))
              });
              this.friendNutrient.push({
                key: "chole",
                nuturition: "콜레스테롤(mg)",
                amount: parseFloat(chole.toFixed(2))
              });
              this.friendNutrient.push({
                key: "fattyacid",
                nuturition: "지방산(g)",
                amount: parseFloat(fattyacid.toFixed(2))
              });
              this.friendNutrient.push({
                key: "transfat",
                nuturition: "트랜스지방(g)",
                amount: parseFloat(transfat.toFixed(2))
              });
            } else {
              this.detail_flag = false;
            }
          });
        })
        .catch(error => {
          console.log(error);
        });
    }
  },
  components: {
    FullCalendar
  }
};
</script>