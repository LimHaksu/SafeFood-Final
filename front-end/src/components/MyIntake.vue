<template>
  <div>
    내섭취정보
    <b-container>
      <b-row>
        <b-col>
          <full-calendar
            :event-sources="events"
            @event-selected="eventSelected"
            @day-click="dayClick"
            :config="config"
            :events="events"
          />
        </b-col>
        <b-col>
          <br />
          <div>
            <b-container fluid>
              <b-table :items="items" :fields="fields">
                <template v-slot:cell(name)="row">
                  <a :href="'./food_info?foodCode='+row.item.code">{{row.item.name}}</a>
                </template>
                <template v-slot:cell(delete)="row">
                  <b-button
                    variant="danger"
                    @click="delete_food(row.item, row.index, $event.target)"
                  >안먹음</b-button>
                </template>
              </b-table>
            </b-container>
          </div>
        </b-col>
        <b-col>
          하루 섭취량
          <b-table :items="items_statistics" :fields="fields_statistics"></b-table>
        </b-col>
        <b-col>영양소별 음식 비율</b-col>
      </b-row>
    </b-container>
  </div>
</template>
<script>
/* eslint-disable no-console */
import axios from "axios";
import { FullCalendar } from "vue-full-calendar";
import "fullcalendar/dist/fullcalendar.css";
import interactionPlugin from "@fullcalendar/interaction";
import moment from "moment";
export default {
  data() {
    return {
      events: [
        // {
        //   title: "event1",
        //   start: "2019-11-25"
        // },
      ],
      config: {
        defaultView: "month",
        height: 500
      },
      plugins: [interactionPlugin],
      user_id: null,
      taken_foods: [],
      items: [],
      fields: [
        {
          key: "name",
          label: "먹은 음식",
          sortable: true,
          sortDirection: "asc",
          class: "text-center"
        },
        { key: "delete", label: "" }
      ],
      items_statistics: [],
      fields_statistics: [
        { key: "nuturition", label: "영양소" },
        { key: "amount", label: " 섭취량" }
      ],
      statistics: {
        supportpereat: null,
        calory: null,
        carbo: null,
        protein: null,
        fat: null,
        sugar: null,
        natrium: null,
        chole: null,
        fattyacid: null,
        transfat: null
      },
      selected_date: null,
      detail_flag: false
    };
  },
  mounted() {
    this.user_id = this.$store.getters.user.id;
  },
  methods: {
    init_statistics(statistics) {
      Object.keys(statistics).forEach(key => {
        statistics[key] = 0;
      });
    },
    refreshEvents() {
      this.$refs.calendar.$emit("render-event");
    },
    eventSelected(event) {
      console.log(event);
    },
    dayClick(info) {
      this.selected_date = info;
      this.items = [];
      this.items_statistics = [];
      let date_string = moment(info._d)
        .format("YYYYMMDD")
        .toString();
      // console.log(date_string);

      axios
        .get("http://localhost:8080/intake/" + this.user_id + "/" + date_string)
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
                  this.taken_foods.push(response.data);
                  // console.log(response.data);
                  this.items.push({
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
                  // total add - end
                  console.log("내부", carbo);
                });
            })
          ).then(() => {
            console.log("외부 ", carbo);
            if (this.items.length > 0) {
              this.detail_flag = true;
              this.items_statistics.push({
                nuturition: "제공량(g)",
                amount: parseFloat(supportpereat.toFixed(2))
              });
              this.items_statistics.push({
                nuturition: "칼로리(kcal)",
                amount: parseFloat(calory.toFixed(2))
              });
              this.items_statistics.push({
                nuturition: "탄수화물(g)",
                amount: parseFloat(carbo.toFixed(2))
              });
              this.items_statistics.push({
                nuturition: "단백질(g)",
                amount: parseFloat(protein.toFixed(2))
              });
              this.items_statistics.push({
                nuturition: "지방(g)",
                amount: parseFloat(fat.toFixed(2))
              });
              this.items_statistics.push({
                nuturition: "당류(g)",
                amount: parseFloat(sugar.toFixed(2))
              });
              this.items_statistics.push({
                nuturition: "나트륨(mg)",
                amount: parseFloat(natrium.toFixed(2))
              });
              this.items_statistics.push({
                nuturition: "콜레스테롤(mg)",
                amount: parseFloat(chole.toFixed(2))
              });
              this.items_statistics.push({
                nuturition: "지방산(g)",
                amount: parseFloat(fattyacid.toFixed(2))
              });
              this.items_statistics.push({
                nuturition: "트랜스지방(g)",
                amount: parseFloat(transfat.toFixed(2))
              });
              console.log(this.items_statistics);
            } else {
              this.detail_flag = false;
            }
          });
          // this.posts = response.data;
          // console.log(this.posts);
        })
        .catch(() => {
          this.errored = true;
        })
        .finally(() => {});
    },
    delete_food(item, index, button) {
      // this.infoModal.title = `Row index: ${index}`;
      // this.infoModal.content = JSON.stringify(item, null, 2);
      // this.$root.$emit("bv::show::modal", this.infoModal.id, button);
      console.log(button);
      axios
        .delete(
          "http://localhost:8080/intake/" +
            this.user_id +
            "/" +
            item.date +
            "/" +
            item.code
        )
        .then(response => {
          console.log(response);
          this.dayClick(this.selected_date);
        });
    }
  },
  components: {
    FullCalendar
  }
};
</script>
<style>
</style>