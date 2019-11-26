<template>
  <div>
    내섭취정보
    <!-- <calendar :first-day="1" :all-events="events"></calendar> -->
    <div class="calendar">
      <h2>
        <a href="#" v-on:click="onClickPrev(currentMonth)">◀</a>
        {{currentYear}}년 {{currentMonth}}월
        <a
          href="#"
          v-on:click="onClickNext(currentMonth)"
        >▶</a>
      </h2>
      <table class="table table-hover">
        <thead>
          <tr>
            <td v-for="(weekName, index) in weekNames" v-bind:key="index">{{weekName}}</td>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(row,index) in currentCalendarMatrix" :key="index">
            <td v-for="(day, index2) in row" :key="index2">{{day}}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>
<script>
// import { Calendar } from "vue-bootstrap-calendar";
// export default {
//   data() {
//     return {
//       events: []
//     };
//   },
//   components: {
//     Calendar
//   },
//   mounted() {
//     let me = this;
//     setTimeout(function() {
//       me.events = [
//         // you can make ajax call here
//         {
//           id: 1,
//           title: "Event 1",
//           color: "panel-danger",
//           date: new Date()
//         }
//       ];
//     }, 1000);
//   }
// };
// export default {
//     name: 'Calendar',
//     data () {
//         return {
//             weekNames: ["월요일", "화요일", "수요일","목요일", "금요일", "토요일", "일요일"],
//             rootYear: 1904,
//             rootDayOfWeekIndex: 4,
//             currentYear: new Date().getFullYear(),
//             currentMonth: new Date().getMonth()+1,
//             currentDay: new Date().getDate(),
//             currentMonthStartWeekIndex: null,
//             currentCalendarMatrix: [],
//             endOfDay: null,
//             memoDatas: [],
//         }
//             },
//             mounted(){
//                 this.init();
//                 },
//                 methods: {
//                     init:function(){
//                         this.currentMonthStartWeekIndex = this.getStartWeek(
//                             this.currentYear,
//                             this.currentMonth);
//                             this.endOfDay = this.getEndOfDay(
//                                 this.currentYear,
//                                 this.currentMonth
//                                 );
//                                 this.initCalendar();
//                                 },
//                                 initCalendar:function(){
//                                     this.currentCalendarMatrix = [];
//                                     let day=1;
//                                     for(let i=0; i<6; i++){
//                                         let calendarRow = [];
//                                         for(let j=0; j<7; j++){
//                                             if(i==0 && j == year){
//                                                 for(let i=0; i<12; i++){
//                                                     sumOfDay += this.getEndOfDay(year, month+i);
//                                                     }
//                                                     year++;
//                                                     } else if(targetYear == year){ if(targetMonth > month){ sumOfDay += this.getEndOfDay(year, month); month++; } else if(targetMonth == month){ return (sumOfDay)%7; } } } }; onClickPrev: function(month){ month--; if(month<=0){ this.currentMonth = 12; this.currentYear -= 1; } else{ this.currentMonth -= 1; } this.init(); }; onClickNext: function(month){ month++; if(month>12){ this.currentMonth = 1; this.currentYear += 1; } else{ this.currentMonth += 1; } this.init(); } } }
</script>
<style>
</style>