<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    // 인코딩
   request.setCharacterEncoding("UTF-8");
%>
<%
		String userId = request.getParameter("id");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS -->
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
<body>
<header>
		<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
			<button type="button" class="btn btn-secondary" data-toggle="modal" id="btn_signup"
				data-target="#signin" data-whatever="@mdo">Sign in</button>
			<button type="button" class="btn btn-secondary" data-toggle="modal" id="btn_login"
				data-target="#login" data-whatever="@mdo">Login</button>
			<button type="button" class="btn btn-secondary" id="btn_logout"
				onClick="location.href='logout.do'">Logout</button>
			<button type="button" class="btn btn-secondary" id="btn_user_info"
				onClick="location.href='userInfo.jsp'">회원정보</button>
		</nav>
		<nav class="navbar navbar-expand-sm navbar-white bg-white">
			<div class="collapse navbar-collapse" id="info">
				<ul class="navbar-nav">
					<li class="nav-item"><a href="main.do" class="nav-link">메인</a></li>
					<!-- <li class="nav-item" id="btn_product_info" ><a href="#" class="nav-link">상품정보</a></li>
					<li class="nav-item"><a href="#" class="nav-link">베스트 섭취
							정보</a></li>
					<li class="nav-item"><a href="#" class="nav-link">내 섭취 정보</a></li>
					<li class="nav-item"><a href="#" class="nav-link">예상 섭취 정보</a></li>
					<li class="nav-item"><a href="#" class="nav-link">검색</a></li> -->
				</ul>
			</div>
		</nav>
	</header>
	<div class="jumbotron">
		<h2>
			<strong>User Information</strong>
		</h2>
		
		<form action="update.do" id="user_info" method="post">
		<h1 style="text-align:left">&nbsp;&nbsp;&nbsp;&nbsp;회원정보수정</h1>
		<table id="table_signup">
			<tr>
				<td>아이디 <font style="color: red">*</font></td>
				<td><input type="text" size="35" name="id" placeholder="" readonly="readonly"
					style="width: 400px; height: 30px" value="${user.id}"></td>
			</tr>
			<tr>
				<td>비밀번호 <font style="color: red">*</font></td>
				<td><input type="password" size="35" name="password" id="userpw"
					placeholder="영문, 숫자 포함 6자리이상" style="width: 400px; height: 30px" value=""></td>
			</tr>
			<tr>
				<td>이름 <font style="color: red">*</font></td>
				<td><input type="text" size="35" name="name"
					placeholder="User Name" style="width: 400px; height: 30px" value="${user.name}"></td>
			</tr>
			<tr>
				<td>주소 <font style="color: red">*</font></td>
				<td><input type="text" size="35" name="address"
					placeholder="address" style="width: 400px; height: 30px" value="${user.address}"></td>
			</tr>
			<tr>
				<td>전화번호 <font style="color: red">*</font></td>
				<td><input type="text" size="35" name="phone_number"
					placeholder="010-xxxx-xxxx" style="width: 400px; height: 30px" value="${user.phone}"></td>
			</tr>
			<tr>
				<td valign="top" style="margin-top:10px">알레르기<font style="color: red">*</font></td>
				<td>
					<fieldset form="alergy" style="width:370px; text-align:left;">
						<input type='checkbox' name='allergy' value='대두' style="margin-bottom: 20px"/>대두&nbsp;&nbsp; 
						<input type='checkbox' name='allergy' value='땅콩' style="margin-bottom: 20px" />땅콩&nbsp;&nbsp; 
						 <input type='checkbox' name='allergy' value='우유'  style="margin-bottom: 20px"/>우유&nbsp;&nbsp; 
						 <input type='checkbox' name='allergy' value='게' style="margin-bottom: 20px" />게<br>
						 <input type='checkbox' name='allergy' value='새우' style="margin-bottom: 20px" />새우&nbsp;&nbsp; 
						 <input type='checkbox' name='allergy' value='참치' style="margin-bottom: 20px" />참치&nbsp;&nbsp; 
						 <input type='checkbox' name='allergy' value='연어' style="margin-bottom: 20px" />연어&nbsp;&nbsp; 
						 <input type='checkbox' name='allergy' value='쑥' style="margin-bottom: 20px" />쑥<br>
						 <input type='checkbox' name='allergy' value='소고기'  style="margin-bottom: 20px"/>소고기&nbsp;&nbsp; 
						 <input type='checkbox' name='allergy' value='닭고기' style="margin-bottom: 20px" />닭고기&nbsp;&nbsp; 
						 <input type='checkbox' name='allergy' value='돼지고기' style="margin-bottom: 20px" />돼지고기<br>
						 <input type='checkbox' name='allergy' value='복숭아' />복숭아&nbsp;&nbsp; 
						 <input type='checkbox' name='allergy' value='민들레' />민들레&nbsp;&nbsp; 
						 <input type='checkbox' name='allergy' value='계란흰자' />계란흰자
					</fieldset>
				</td>
			</tr>
		</table>

		<input type="submit" value="수정 &nbsp;✓"
			style="font-weight:bold; float:left; width: 100px; height: 30px; color: white; background-color: #00bfff; border: 1 solid #00bfff; margin-left: 200px;">
		<input type="button" id="delete_button" value="탈퇴" style="font-weight:bold; float:left; width: 100px; height: 30px; color: white; background-color: #00bfff; border: 1 solid #00bfff; margin-left: 50px;">
	</form>
		
		
		
		
<%-- 		<hr class="my-4">
		<div class="form-group form-group-sm">
			<label class="col-sm-2 control-label" for="userInfoForId">아이디</label>
			<div class="col-sm-10">
				<p class="lead" id="userInfoForId">${user.id}</p>
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-2 control-label" for="userInfoForName">이름</label>
			<div class="col-sm-10">
				<p class="lead" id="userInfoForName">${user.name}</p>
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-2 control-label" for="userInfoForAddress">주소</label>
			<div class="col-sm-10">
				<p class="lead">${user.address}</p>
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-2 control-label" for="userInfoForNum">전화번호</label>
			<div class="col-sm-10">
				<p class="lead">${user.phone}</p>
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-2 control-label" for="userInfoForAller">알레르기</label>
			<div class="col-sm-10">
				<p class="lead">
					<%
       			 	String[] allergic = request.getParameterValues("allergic");
        			if(allergic != null){
            			for(int i=0; i<allergic.length; i++){        
    					%>
						<%=allergic[i] %>
						<%                        
            			}
        			}
    				%>
				</p>
			</div>
		</div>


		<p class="lead">
			<a class="btn btn-primary" role="button" href="#">수정</a> <a
				class="btn btn-danger" role="button" href="#">삭제</a>
		</p> --%>
	</div>
</body>
<script>
	$('input:checkbox[name="allergy"]').each(function() {
		if ("${user.allergy}".includes(this.value)) {
			this.checked = true;
		}
	});

	$(document).ready(function(){
		$('#delete_button').click(function () {

			  // The rest of this code assumes you are not using a library.
			  // It can be made less wordy if you use one.
			  const form = document.createElement('form');
			  form.method = 'post';
			  form.action = 'delete.do';
			  var params = {"userid":"${user.id}"};
			  for (const key in params) {
			    if (params.hasOwnProperty(key)) {
			      const hiddenField = document.createElement('input');
			      hiddenField.type = 'hidden';
			      hiddenField.name = key;
			      hiddenField.value = params[key];

			      form.appendChild(hiddenField);
			    }
			  }

			  document.body.appendChild(form);
			  form.submit();
			});
	});
	$("#user_info").on("submit", function(){
		let userpw = $("#userpw").val();
		if(!userpw){
			alert("비밀번호를 입력해주세요.");
			$("#userpw").focus();
			return false;
		}
	});	
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