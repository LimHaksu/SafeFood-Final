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
        <div>
          <select name="country_id" tabindex="1" v-model="condition">
            <option value="name">상품명</option>
            <option value="maker">제조사</option>
            <option value="material">영양정보</option>
          </select>
          <input type="text" v-model="contents" />
          <input type="button" value="검색" @click="clickSearchButton" />
        </div>
      </nav>
    </article>

    <table border="0" cellspacing="0" cellpadding="0">
      <tr v-for="food in foodList" v-bind:key="food.name">
        <td align="left" valign="top">
          <img width="200px" :src="require(`@/assets/${food.img}`)" />
        </td>
        <td class="product_contents" width="*" align="left" valign="top">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="*" valign="top">
                <div class="ss_book_list">
                  <ul>
                    <li>
                      <h1>{{food.name}}</h1>
                      <hr />
                    </li>
                    <li>{{food.material}}</li>
                    <li>
                      <button id="btn_add">추가</button>
                      <button id="btn_zzim">찜</button>
                    </li>
                  </ul>
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      condition: "",
      contents: "",
      foodList: []
    };
  },
  methods: {
    clickSearchButton() {
      /* eslint-disable no-console */
      console.log("클릭!");

      if (this.contents == "") {
        this.contents = "*";
      }

      axios
        .get(
          "http://localhost:8080/foodlist/" +
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
    }
  }
};
</script>
