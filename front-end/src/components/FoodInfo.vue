<template>
  <div class="container" v-bind:style="{ backgroundColor : activeColor}">
    <div class="row">
      <!-- main start -->
      <!-- ================ -->
      <div class="main col-12">
        <!-- page-title start -->
        <!-- ================ -->
        <h1 class="page-title text-center">제품 정보</h1>
        <!-- page-title end -->
        <div class="image-box style-3-b">
          <div class="row">
            <div class="col-md-6 col-lg-4 col-xl-3">
              <!-- <div id="img_box"> -->
              <img width="200px" :src="require(`@/assets/${food.img}`)" />
              <!-- </div>-->
            </div>
            <div class="col-lg-8 col-xl-7 pv-30">
              <table class="table" style="background-color:transparent">
                <tbody>
                  <tr>
                    <td width="100">제품명</td>
                    <td id="name">{{food.name}}</td>
                  </tr>
                  <tr>
                    <td width="100">제조사</td>
                    <td id="maker">{{food.maker}}</td>
                  </tr>
                  <tr>
                    <td width="100">원재료</td>
                    <td id="material">{{food.material}}</td>
                  </tr>
                  <tr>
                    <td width="100">알레르기 성분</td>
                    <td>{{food.allergy}}</td>
                  </tr>
                </tbody>
              </table>
              <div class="product elements-list">
                <div class="btn-group">
                  <a v-show="authenticated" class="btn btn-primary btn-sm" @click="clickAddition">추가</a>
                  <a href="#" v-show="authenticated" class="btn btn-primary btn-sm">찜</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <hr />
    <h1 class="page-title text-center">영양 정보</h1>
    <div class="row">
      <div class="col-sm-6">
        <chart v-bind:chart-data="pchartdata" v-bind:options="poptions" />
      </div>
      <div class="col-sm-6">
        <table class="table" style="background-color:transparent">
          <tbody>
            <tr>
              <td width="200">1회 제공량(g)</td>
              <td id="serving_wt">{{food.supportpereat}}</td>
            </tr>
            <tr>
              <td width="200">칼로리(kcal)</td>
              <td id="nutr_cont1">{{food.calory}}</td>
            </tr>
            <tr>
              <td width="200">탄수화물(g)</td>
              <td id="nutr_cont2">{{food.carbo}}</td>
            </tr>
            <tr>
              <td width="200">단백질(g)</td>
              <td id="nutr_cont3">{{food.protein}}</td>
            </tr>
            <tr>
              <td width="200">지방(g)</td>
              <td id="nutr_cont4">{{food.fat}}</td>
            </tr>
            <tr>
              <td width="200">당류(g)</td>
              <td id="nutr_cont5">{{food.sugar}}</td>
            </tr>
            <tr>
              <td width="200">나트륨(mg)</td>
              <td id="nutr_cont6">{{food.natrium}}</td>
            </tr>
            <tr>
              <td width="200">콜레스테롤(mg)</td>
              <td id="nutr_cont7">{{food.chole}}</td>
            </tr>
            <tr>
              <td width="200">포화 지방산(g)</td>
              <td id="nutr_cont8">{{food.fattyacid}}</td>
            </tr>
            <tr>
              <td width="200">트렌스지방(g)</td>
              <td id="nutr_cont9">{{food.transfat}}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    <!-- main end -->
  </div>
</template>

<script>
/* eslint-disable no-console */
import axios from "axios";
import chart from "./chart.js";
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
let paramValue = request.getParameter("foodCode");

export default {
  components: {
    chart
  },
  data() {
    return {
      authenticated: false,
      food: {},
      allergy_sample: [
        "대두",
        "땅콩",
        "우유",
        "게",
        "새우",
        "참치",
        "연어",
        "쑥",
        "소고기",
        "닭고기",
        "돼지고기",
        "복숭아",
        "민들레",
        "계란흰자"
      ],
      allergy_list: [],
      pchartdata: {
        labels: [
          "탄수화물",
          "단백질",
          "지방",
          "당류",
          "나트륨",
          "콜레스테롤",
          "포화 지방산",
          "트렌스지방"
        ],
        datasets: [
          {
            label: "Data One",
            backgroundColor: [
              "lightpink",
              "violet",
              "greenyellow",
              "#42b983",
              "lightskyblue",
              "lightsalmon",
              "lavender",
              "#abcdef"
            ],
            data: []
          }
        ]
      },
      poptions: {
        responsive: true,
        maintainAspectRatio: false
      },
      allergy_find: false,
      activeColor: `rgba(0,0,0,0)`
    };
  },
  mounted() {
    if (this.$store.getters.user != null) {
      this.authenticated = true;
    } else {
      this.authenticated = false;
    }
    console.log(paramValue);
    axios
      .get("http://" + this.$store.getters.myurl + "/food/" + paramValue)
      .then(response => {
        this.food = response.data;
        console.log(this.food);
        this.allergy_sample.forEach(a => {
          if (this.food.material.includes(a)) {
            this.allergy_list.push(a);
          }
        });
        console.log(this.allergy_list);
        if (this.authenticated) {
          let my_allergies = this.$store.getters.user.allergy.split(",");
          my_allergies.forEach(a => {
            this.allergy_list.forEach(b => {
              if (a == b) {
                this.allergy_find = true;
              }
            });
            if (this.allergy_find) {
              this.activeColor = `rgba(255,0,0,0.2)`;
              return;
            }
          });
        }
        console.log(this.allergy_find);
        this.food.allergy = this.allergy_list.join(",");
        this.pchartdata.datasets[0].data.push(this.food.carbo);
        this.pchartdata.datasets[0].data.push(this.food.protein);
        this.pchartdata.datasets[0].data.push(this.food.fat);
        this.pchartdata.datasets[0].data.push(this.food.sugar);
        this.pchartdata.datasets[0].data.push(this.food.natrium / 1000);
        this.pchartdata.datasets[0].data.push(this.food.chole / 1000);
        this.pchartdata.datasets[0].data.push(this.food.fattyacid);
        this.pchartdata.datasets[0].data.push(this.food.transfat);
      })
      .catch(() => {
        this.errored = true;
      })
      .finally(() => (this.loading = false));
  },
  methods: {
    clickAddition() {
      let sessionInfo = this.$store.getters.user.id;

      if (sessionInfo == null) {
        return;
      }

      let info = {
        code: paramValue,
        date: moment(new Date(Date.now()))
          .format("YYYYMMDD")
          .toString(),
        id: sessionInfo
      };

      axios
        .post("http://" + this.$store.getters.myurl + "/intake", info)
        .then(() => {
          alert("추가 되었습니다.");
        })
        .catch(() => {
          alert("이미 추가된 음식입니다.");
        });
    }
  }
};
</script>
<style>
</style>