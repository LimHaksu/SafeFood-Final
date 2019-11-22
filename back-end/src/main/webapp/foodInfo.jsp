<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<%
		String name = request.getParameter("foodName");
		System.out.println(name);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- JS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">
</head>
<header>
		<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
			<button type="button" class="btn btn-secondary" data-toggle="modal" id="btn_signup" data-target="#signin" data-whatever="@mdo">Sign up</button>
			<button type="button" class="btn btn-secondary" data-toggle="modal" id="btn_login" data-target="#login" data-whatever="@mdo">Login</button>
			<button type="button" class="btn btn-secondary" id="btn_logout" onClick="location.href='logout.do'">Logout</button>
			<button type="button" class="btn btn-secondary" id="btn_user_info" onClick="location.href='userInfo.jsp'">회원정보</button>
		</nav>
		<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="LoginLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="LoginLabel">로그인</h4>
					</div>
					<form method="post" action="login.do" id="layout_login">
						<div class="modal-body">
							<div class="form-group">
								<label for="userid" class="control-label">아이디: </label>
								<input type="text" class="form-control" id="userid" name="id">
							</div>
							<div class="form-group">
								<label for="password" class="control-label">비밀번호:</label>
								<input type="password" class="form-control" id="userpw" name="password">
							</div>

						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-light" id="userLogin">로그인</button>
							<button type="button" class="btn btn-dark" id="userPwFind">비밀번호 찾기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		
		<nav class="navbar navbar-expand-sm navbar-white bg-white">
			<div class="collapse navbar-collapse" id="info">
				<ul class="navbar-nav">
				<li class="nav-item"><a href="main.do" class="nav-link">메인</a></li><!-- 
					<li class="nav-item"><a href="#" class="nav-link">공지사항</a></li>
					<li class="nav-item" id="btn_product_info" ><a href="#" class="nav-link">상품정보</a></li>
					<li class="nav-item"><a href="#" class="nav-link">베스트 섭취 정보</a></li>
					<li class="nav-item"><a href="#" class="nav-link">내 섭취 정보</a></li>
					<li class="nav-item"><a href="#" class="nav-link">예상 섭취 정보</a></li>
					<li class="nav-item"><a href="#" class="nav-link">검색</a></li> -->
				</ul>
			</div>
		</nav>
	</header>
	<article>
	<section class="main-container">
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
                       <div id="img_box">
                    </div>
                  </div>
                  <div class="col-lg-8 col-xl-7 pv-30">
                  <table class="table">
	                <tbody>
	                  <tr><td width="100">제품명</td><td id="name"></td></tr>
	                  <tr><td width="100">제조사</td><td id="maker"></td></tr>
	                  <tr><td width="100">원재료</td><td id="material"></td></tr>
	                  <tr><td width="100">알레르기 성분</td><td>대두,땅콩,우유,돼지고기</td></tr>
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
            <hr>
            <h1 class="page-title text-center" >영양 정보</h1>
           <div class="row">
                <div class="col-sm-6"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
                  <canvas id="doughnut-graph" height="277" width="362" class="chartjs-render-monitor" style="display: block; width: 362px; height: 277px;"></canvas>
                </div>
                <div class="col-sm-6">
                  <table class="table">
	                <tbody>
	                  <tr><td width="200">일일 제공량</td><td id="serving_wt"></td></tr>
	                  <tr><td width="200">칼로리</td><td id="nutr_cont1"></td></tr>
	                  <tr><td width="200">탄수화물</td><td id="nutr_cont2"></td></tr>
	                  <tr><td width="200">단백질</td><td id="nutr_cont3"></td></tr>
	                  <tr><td width="200">지방</td><td id="nutr_cont4"></td></tr>
	                  <tr><td width="200">당류</td><td id="nutr_cont5"></td></tr>
	                  <tr><td width="200">나트륨</td><td id="nutr_cont6"></td></tr>
	                  <tr><td width="200">콜레스테롤</td><td id="nutr_cont7"></td></tr>
	                  <tr><td width="200">포화 지방산</td><td id="nutr_cont8"></td></tr>
	                  <tr><td width="200">트렌스지방</td><td id="nutr_cont9"></td></tr>
	                </tbody>
	              </table>
                </div>
              </div>
            <!-- main end -->
			</div>

      </section>
	</article>
<body>

</body>
<script src="js/Chart.js"></script>
<script>
	
	$(document).ready(function(){
		req_name = <%='"'+ name + '"'%> 
		
		$.ajax({
			url : "search.do/name/"+req_name,
			success : function(data) {
				$.each(data.list , function(index, item){
					var tmp_name = item.name;
					console.log(tmp_name);
					if(tmp_name == req_name){
						var name = req_name;
						var img = item.img;
						var maker = item.maker
						var material = item.material;
					
						$("#img_box").append('<img src="' + img + '" width="250px">');
						$("#name").text(name);
						$("#maker").text(maker);
						$("#material").text(material);
						
						
						
						var serving_wt = item.supportpereat;
						 nutr_cont1 = item.calory;
						 nutr_cont2 = item.carbo;
						 nutr_cont3 = item.protein;
						 nutr_cont4 = item.fat;
						 nutr_cont5 = item.sugar;
						 nutr_cont6 = item.natrium;
						 nutr_cont7 = item.chole;
						 nutr_cont8 = item.fattyacid;
						 nutr_cont9 = item.transfat

						$("#serving_wt").text(serving_wt);
						$("#nutr_cont1").text(nutr_cont1);
						$("#nutr_cont2").text(nutr_cont2);
						$("#nutr_cont3").text(nutr_cont3);
						$("#nutr_cont4").text(nutr_cont4);
						$("#nutr_cont5").text(nutr_cont5);
						$("#nutr_cont6").text(nutr_cont6);
						$("#nutr_cont7").text(nutr_cont7);
						$("#nutr_cont8").text(nutr_cont8);
						$("#nutr_cont9").text(nutr_cont9);
						
						var ctx = document.getElementById("doughnut-graph").getContext("2d")
						var myChart = new Chart(ctx,{
						    type: 'doughnut',
						    data: {
						        labels: ["칼로리","탄수화물","단백질","지방","당류","나트륨","콜레스테롤","포화 지방산","트렌스지방"],
						        datasets: [{
						            label: '# of Votes',
						            data: [nutr_cont1, nutr_cont2, nutr_cont3, nutr_cont4, nutr_cont5, nutr_cont6, nutr_cont7, nutr_cont8, nutr_cont9],
						            backgroundColor: [
						                'rgba(255, 99, 132, 0.2)',
						                'rgba(54, 162, 235, 0.2)',
						                'rgba(255, 206, 86, 0.2)',
						                'rgba(75, 192, 192, 0.2)',
						                'rgba(153, 102, 255, 0.2)',
						                'rgba(255, 159, 64, 0.2)',
						                'rgba(255, 153, 255, 0.2)',
						                'rgba(102, 0, 153, 0.2)',
						                'rgba(51, 0, 0, 0.2)'
						            ],
						            borderColor: [
						                'rgba(255, 99, 132, 1)',
						                'rgba(54, 162, 235, 1)',
						                'rgba(255, 206, 86, 1)',
						                'rgba(75, 192, 192, 1)',
						                'rgba(153, 102, 255, 1)',
						                'rgba(255, 159, 64, 1)',
						                'rgba(255, 153, 255, 1)',
						                'rgba(102, 0, 153, 1)',
						                'rgba(51, 0, 0, 1)'
						            ],
						            borderWidth: 1
						        }]
						    },
						    options: {
						        scales: {
						            yAxes: [{
						                ticks: {
						                    beginAtZero:true
						                }
						            }]
						        }
						    }
						});
					}
				})
			}
				
		})
	})
	
	if(${user eq null}){
		$("#btn_user_info").css("visibility", "hidden");
		$("#btn_signup").css("visibility", "visible");
		$("#btn_logout").css("visibility", "hidden");
		$("#btn_login").css("visibility", "visible");
	}else{
		$("#btn_user_info").css("visibility", "visible");
		$("#btn_signup").css("visibility", "hidden");
		$("#btn_logout").css("visibility", "visible");
		$("#btn_login").css("visibility", "hidden");		
	}	
</script>


</html>