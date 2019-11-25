<template>
  <div class="container">
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
              <div id="img_box"></div>
            </div>
            <div class="col-lg-8 col-xl-7 pv-30">
              <table class="table">
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
                  <a href="#" onclick="addIntakeFood(2)" class="btn btn-primary btn-sm">추가</a>
                  <a href="#" onclick="addIntakePrev(2)" class="btn btn-primary btn-sm">찜</a>
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
        <div
          class="chartjs-size-monitor"
          style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"
        >
          <div
            class="chartjs-size-monitor-expand"
            style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"
          >
            <div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
          </div>
          <div
            class="chartjs-size-monitor-shrink"
            style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"
          >
            <div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>
          </div>
        </div>
        <!-- <canvas
          id="doughnut-graph"
          height="277"
          width="362"
          class="chartjs-render-monitor"
          style="display: block; width: 362px; height: 277px;"
        ></canvas>-->
        <!-- <apexchart type="pie" width="380" :options="chartOptions" :series="series" /> -->
        <chart v-bind:chart-data="pchartdata" />
      </div>
      <div class="col-sm-6">
        <table class="table">
          <tbody>
            <tr>
              <td width="200">일일 제공량</td>
              <td id="serving_wt">{{food.supportpereat}}</td>
            </tr>
            <tr>
              <td width="200">칼로리</td>
              <td id="nutr_cont1">{{food.calory}}</td>
            </tr>
            <tr>
              <td width="200">탄수화물</td>
              <td id="nutr_cont2">{{food.carbo}}</td>
            </tr>
            <tr>
              <td width="200">단백질</td>
              <td id="nutr_cont3">{{food.protein}}</td>
            </tr>
            <tr>
              <td width="200">지방</td>
              <td id="nutr_cont4">{{food.fat}}</td>
            </tr>
            <tr>
              <td width="200">당류</td>
              <td id="nutr_cont5">{{food.sugar}}</td>
            </tr>
            <tr>
              <td width="200">나트륨</td>
              <td id="nutr_cont6">{{food.natrium}}</td>
            </tr>
            <tr>
              <td width="200">콜레스테롤</td>
              <td id="nutr_cont7">{{food.chole}}</td>
            </tr>
            <tr>
              <td width="200">포화 지방산</td>
              <td id="nutr_cont8">{{food.fattyacid}}</td>
            </tr>
            <tr>
              <td width="200">트렌스지방</td>
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
// import { Chart } from "vue-chartjs";
/* eslint-disable no-console */
import axios from "axios";
// import VueApexCharts from "vue-apexcharts";
import chart from "./chart.js";
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
      food: {},
      pchartdata: {
        labels: [
          "칼로리",
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
              "khaki",
              "lightpink",
              "violet",
              "greenyellow",
              "#42b983",
              "lightskyblue",
              "lightsalmon",
              "lavender",
              "#abcdef"
            ],
            data: [1, 2, 3, 4, 5, 6, 7, 8, 9.9]
          }
        ]
      }
      // nuturitions: [1, 2, 3, 4, 5, 6, 7, 8, 9],
      // series: this.nuturitions,
      // chartOptions: {
      //   labels: [
      //     "칼로리",
      //     "탄수화물",
      // "단백질",
      // "지방",
      // "당류",
      // "나트륨",
      // "콜레스테롤",
      // "포화 지방산",
      // "트렌스지방"
      //   ],
      //   responsive: [
      //     {
      //       breakpoint: 480,
      //       options: {
      //         chart: {
      //           width: 200
      //         },
      //         legend: {
      //           position: "bottom"
      //         }
      //       }
      //     }
      //   ]
      // }
    };
  },
  mounted() {
    axios
      .get("http://localhost:8080/food/" + paramValue)
      //.get('./emp.json')
      .then(response => {
        this.food = response.data.food;
        console.log(this.food);
        /*         this.pchartdata.datasets[0].data.push(this.food.supportpereat);
        this.pchartdata.datasets[0].data.push(this.food.calory);
        this.pchartdata.datasets[0].data.push(this.food.carbo);
        this.pchartdata.datasets[0].data.push(this.food.protein);
        this.pchartdata.datasets[0].data.push(this.food.fat);
        this.pchartdata.datasets[0].data.push(this.food.sugar);
        this.pchartdata.datasets[0].data.push(this.food.natrium);
        this.pchartdata.datasets[0].data.push(this.food.chole);
        this.pchartdata.datasets[0].data.push(this.food.fattyacid);
        this.pchartdata.datasets[0].data.push(this.food.transfat);
        console.log(this.pchartdata.datasets[0].data); */
      })
      .catch(() => {
        this.errored = true;
      })
      .finally(() => (this.loading = false));
    // this.renderChart({
    //   type: "doughnut",
    //   labels: [
    // "칼로리",
    // "탄수화물",
    // "단백질",
    // "지방",
    // "당류",
    // "나트륨",
    // "콜레스테롤",
    // "포화 지방산",
    // "트렌스지방"
    //   ],
    //   datasets: [
    //     {
    //       label: "# of Votes",
    //       data: [
    // nutr_cont1,
    // nutr_cont2,
    // nutr_cont3,
    // nutr_cont4,
    // nutr_cont5,
    // nutr_cont6,
    // nutr_cont7,
    // nutr_cont8,
    // nutr_cont9
    //       ],
    //       backgroundColor: [
    //         "rgba(255, 99, 132, 0.2)",
    //         "rgba(54, 162, 235, 0.2)",
    //         "rgba(255, 206, 86, 0.2)",
    //         "rgba(75, 192, 192, 0.2)",
    //         "rgba(153, 102, 255, 0.2)",
    //         "rgba(255, 159, 64, 0.2)",
    //         "rgba(255, 153, 255, 0.2)",
    //         "rgba(102, 0, 153, 0.2)",
    //         "rgba(51, 0, 0, 0.2)"
    //       ],
    //       borderColor: [
    //         "rgba(255, 99, 132, 1)",
    //         "rgba(54, 162, 235, 1)",
    //         "rgba(255, 206, 86, 1)",
    //         "rgba(75, 192, 192, 1)",
    //         "rgba(153, 102, 255, 1)",
    //         "rgba(255, 159, 64, 1)",
    //         "rgba(255, 153, 255, 1)",
    //         "rgba(102, 0, 153, 1)",
    //         "rgba(51, 0, 0, 1)"
    //       ],
    //       borderWidth: 1
    //     }
    //   ]
    // });
  }
};

// var myChart = new Chart(ctx, {
//   type: "doughnut",
//   data: {
//     labels: [
//       "칼로리",
//       "탄수화물",
//       "단백질",
//       "지방",
//       "당류",
//       "나트륨",
//       "콜레스테롤",
//       "포화 지방산",
//       "트렌스지방"
//     ],
//     datasets: [
//       {
//         label: "# of Votes",
//         data: [
//           nutr_cont1,
//           nutr_cont2,
//           nutr_cont3,
//           nutr_cont4,
//           nutr_cont5,
//           nutr_cont6,
//           nutr_cont7,
//           nutr_cont8,
//           nutr_cont9
//         ],
//         backgroundColor: [
//           "rgba(255, 99, 132, 0.2)",
//           "rgba(54, 162, 235, 0.2)",
//           "rgba(255, 206, 86, 0.2)",
//           "rgba(75, 192, 192, 0.2)",
//           "rgba(153, 102, 255, 0.2)",
//           "rgba(255, 159, 64, 0.2)",
//           "rgba(255, 153, 255, 0.2)",
//           "rgba(102, 0, 153, 0.2)",
//           "rgba(51, 0, 0, 0.2)"
//         ],
//         borderColor: [
//           "rgba(255, 99, 132, 1)",
//           "rgba(54, 162, 235, 1)",
//           "rgba(255, 206, 86, 1)",
//           "rgba(75, 192, 192, 1)",
//           "rgba(153, 102, 255, 1)",
//           "rgba(255, 159, 64, 1)",
//           "rgba(255, 153, 255, 1)",
//           "rgba(102, 0, 153, 1)",
//           "rgba(51, 0, 0, 1)"
//         ],
//         borderWidth: 1
//       }
//     ]
//   },
//   options: {
//     scales: {
//       yAxes: [
//         {
//           ticks: {
//             beginAtZero: true
//           }
//         }
//       ]
//     }
//   }
// });

// $(document).ready(function () {
// 	req_name = < %= '"' + name + '"' % >

// 		$.ajax({
// 			url: "search.do/name/" + req_name,
// 			success: function (data) {
// 				$.each(data.list, function (index, item) {
// 					var tmp_name = item.name;
// 					console.log(tmp_name);
// 					if (tmp_name == req_name) {
// 						var name = req_name;
// 						var img = item.img;
// 						var maker = item.maker
// 						var material = item.material;

// 						$("#img_box").append('<img src="' + img + '" width="250px">');
// 						$("#name").text(name);
// 						$("#maker").text(maker);
// 						$("#material").text(material);

// 						var serving_wt = item.supportpereat;
// 						nutr_cont1 = item.calory;
// 						nutr_cont2 = item.carbo;
// 						nutr_cont3 = item.protein;
// 						nutr_cont4 = item.fat;
// 						nutr_cont5 = item.sugar;
// 						nutr_cont6 = item.natrium;
// 						nutr_cont7 = item.chole;
// 						nutr_cont8 = item.fattyacid;
// 						nutr_cont9 = item.transfat

// 						$("#serving_wt").text(serving_wt);
// 						$("#nutr_cont1").text(nutr_cont1);
// 						$("#nutr_cont2").text(nutr_cont2);
// 						$("#nutr_cont3").text(nutr_cont3);
// 						$("#nutr_cont4").text(nutr_cont4);
// 						$("#nutr_cont5").text(nutr_cont5);
// 						$("#nutr_cont6").text(nutr_cont6);
// 						$("#nutr_cont7").text(nutr_cont7);
// 						$("#nutr_cont8").text(nutr_cont8);
// 						$("#nutr_cont9").text(nutr_cont9);

// 						var ctx = document.getElementById("doughnut-graph").getContext("2d")

// 					}
// 				})
// 			}

// 		})
// })
</script>
<style>
</style>