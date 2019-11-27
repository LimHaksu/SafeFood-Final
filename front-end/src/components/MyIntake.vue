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
            @view-render="viewRender"
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
import { FullCalendar } from "vue-full-calendar";
import "fullcalendar/dist/fullcalendar.css";
import interactionPlugin from "@fullcalendar/interaction";
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
      plugins: [interactionPlugin]
    };
  },
  methods: {
    refreshEvents() {
      this.$refs.calendar.$emit("render-event");
    },
    eventSelected(event) {
      console.log(event);
    },
    dayClick(info) {
      let year = info._d.getFullYear();
      let month = info._d.getMonth();
      let date = info._d.getDate();
      console.log(info);
      console.log(year, month, date);
    }
  },
  components: {
    FullCalendar
  }
};
</script>
<style>
</style>