<template>
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
        <select name="country_id" id="condition" tabindex="1">
          <option>상품명</option>
          <option>제조사</option>
          <option>영양정보</option>
        </select>
        <input id="contents" type="text" />
        <input type="submit" id="b_search" />
      </div>
    </nav>
  </article>
</template>
<script>
export default {};
// $(document).ready(function() {
//   $("#main_body").remove();
//   $("#main_page").append('<div id="main_body"> </div>');
//   $.ajax({
//     url: "main.do",
//     success: function(data) {
//       $.each(data.list, function(index, item) {
//         var img_src;
//         var name;
//         var marterial;

//         var tmp;
//         console.log(tmp);
//         name = item.name;
//         marterial = item.material;
//         img_src = item.img;
//         $("#main_body").append(
//           '<table class="product_info" border="0" cellspacing="0" cellpadding="0"> <tbody> <tr><td align="left" valign="top"><img width="200px" src=' +
//             img_src +
//             '></img></td><td class="product_contents" width="*" align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tbody><tr><td width="*" valign="top"><div class="ss_book_list"><ul><li><h1 class="product_name">' +
//             name +
//             '</h1><hr></li><li id="materials">' +
//             marterial +
//             '</li><li><button id="btn_add">추가</button><button id=btn_zzim>찜</button></li></ul></div></td></tr></tbody></table></td></tr></tbody></table>'
//         );
//       });
//     }
//   });
// });

// $("#b_search").on("click", function() {
//   var condition = $("#condition").val();
//   var contents = $("#contents").val();
//   var tmp;
//   if (condition == "상품명") {
//     tmp = "name";
//   } else if (condition == "제조사") {
//     tmp = "maker";
//   } else {
//     tmp = "material";
//   }

//   if (contents == "") {
//     contents = "*";
//   }

//   $("#main_body").remove();
//   $("#main_page").append('<div id="main_body"> </div>');
//   $.ajax({
//     url: "search.do/" + tmp + "/" + contents,
//     success: function(data) {
//       $.each(data.list, function(index, item) {
//         var img_src;
//         var name;
//         var marterial;

//         name = item.name;
//         marterial = item.material;
//         img_src = item.img;
//         $("#main_body").append(
//           '<table class="product_info" border="0" cellspacing="0" cellpadding="0"> <tbody> <tr><td align="left" valign="top"><img width="200px" src=' +
//             img_src +
//             '></img></td><td class="product_contents" width="*" align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tbody><tr><td width="*" valign="top"><div class="ss_book_list"><ul><li><h1 class="product_name">' +
//             name +
//             '</h1><hr></li><li id="materials">' +
//             marterial +
//             '</li><li><button id="btn_add">추가</button><button id=btn_zzim>찜</button></li></ul></div></td></tr></tbody></table></td></tr></tbody></table>'
//         );
//       });
//     }
//   });
// });

// $("#btn_product_info").on("click", function() {
//   $("#main_body").remove();
//   $("#main_page").append(
//     '<div id="main_body" style="display:grid; grid-template-columns: repeat(2, 1fr);" > </div>'
//   );
//   $.ajax({
//     url: "foodlist.do",
//     success: function(data) {
//       console.log(data);
//       $.each(data.list, function(index, item) {
//         var img_src;
//         var name;
//         var marterial;

//         name = item.name;
//         marterial = item.material;
//         img_src = item.img;
//         $("#main_body").append(
//           '<table class="product_info" border="0"  cellspacing="0" cellpadding="0"> <tbody> <tr><td align="left" valign="top"><img class="product_img" width="200px" src=' +
//             img_src +
//             '></img></td><td class="product_contents" width="*" align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tbody><tr><td width="*" valign="top"><div class="ss_book_list"><ul><li><h1 class="product_name">' +
//             name +
//             '</h1><hr></li><li id="materials">' +
//             marterial +
//             '</li><li><button id="btn_add">추가</button><button id=btn_zzim>찜</button></li></ul></div></td></tr></tbody></table></td></tr></tbody></table>'
//         );
//       });
//     }
//   });
// });

// $(document).on("click", ".product_name", function(event) {
//   location.href = "foodInfo.jsp?foodName=" + $(this).text();
// });

// $('input:checkbox[name="allergy"]').each(function() {
//   if ("${user.allergy}".includes(this.value)) {
//     this.checked = true;
//   }
// });
</script>
<style>
</style>