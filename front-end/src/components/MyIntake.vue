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
        <b-col>상세정보</b-col>
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
        {
          title: "event1",
          start: "2019-11-25"
        },
        {
          title: "event2",
          start: "2019-11-25",
          end: "2019-11-27"
        },
        {
          title: "event3",
          start: "2019-11-29"
        }
      ],
      config: {
        defaultView: "month",
        height: 500
      },
      plugins: [interactionPlugin],
      user_id: null
    };
  },
  mounted() {
    this.user_id = this.$store.getters.user.id;
  },
  methods: {
    refreshEvents() {
      this.$refs.calendar.$emit("render-event");
    },
    eventSelected(event) {
      console.log(event);
    },
    dayClick(info) {
      let date_type = moment(info._d).format("YYYY-MM-DD");
      console.log(date_type);
      axios
        .get("http://localhost:8080/intake/" + this.user_id + "/" + date_type)
        .then(response => {
          console.log(response);
          // this.posts = response.data;
          // console.log(this.posts);
        })
        .catch(() => {
          this.errored = true;
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