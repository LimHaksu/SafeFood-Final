<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ page
	import="java.util.*, java.lang.*, com.ssafy.dao.*, com.ssafy.service.* , com.ssafy.util.*, com.ssafy.vo.*"%> --%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
	<!-- JS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>

<body>
	<header>
		<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
			<button type="button" class="btn btn-secondary" data-toggle="modal" id="btn_signup" data-target="#signin"
				data-whatever="@mdo">Sign up</button>
			<button type="button" class="btn btn-secondary" data-toggle="modal" id="btn_login" data-target="#login"
				data-whatever="@mdo">Login</button>
			<button type="button" class="btn btn-secondary" id="btn_logout"
				onClick="location.href='logout.do'">Logout</button>
			<button type="button" class="btn btn-secondary" id="btn_user_info"
				onClick="location.href='userInfo.jsp'">회원정보</button>
		</nav>
		<form action="insert.do" method="post">
			<div class="modal fade" id="signin" tabindex="-1" role="dialog" aria-labelledby="singInlLabel"
				aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="singInlLabel">회원가입</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>

						<div class="modal-body">
							<div class="form-group">
								<label for="id" class="control-label">아이디:</label>
								<input type="text" name="id" class="form-control" id="userid" value="${user.id}">
							</div>
							<div class="form-group">
								<label for="password" class="control-label">비밀번호:</label>
								<input type="password" class="form-control" id="userpw" name="password"
									placeholder="숫자 영어 포함 6글자 이상" value="${user.password}">
							</div>
							<div class="form-group">
								<label for="name" class="control-label">이름:</label>
								<input type="text" name="name" class="form-control" id="name" placeholder="User Name"
									value="${user.name}">
							</div>
							<div class="form-group">
								<label for="address" class="control-label">주소:</label>
								<input type="text" name="address" class="form-control" id="address"
									placeholder="address" value="${user.address}">
							</div>
							<div class="form-group">
								<label for="phone" class="control-label">전화번호:</label>
								<input type="text" name="phone" class="form-control" id="phone"
									placeholder="010-xxxx-xxxx" value="${user.phone}">
							</div>
							<div class="form-group">
								<label for="allergic" class="control-label">알레르기:</label>
								<input type="checkbox" name="allergy" value="대두">
								대두
								<input type="checkbox" name="allergy" value="땅콩">
								땅콩
								<input type="checkbox" name="allergy" value="우유">
								우유
								<input type="checkbox" name="allergy" value="게">
								게
								<input type="checkbox" name="allergy" value="새우">
								새우
								<input type="checkbox" name="allergy" value="참치">
								참치
								<input type="checkbox" name="allergy" value="연어">
								연어
								<input type="checkbox" name="allergy" value="쑥">
								쑥
								<input type="checkbox" name="allergy" value="소고기">
								소고기
								<input type="checkbox" name="allergy" value="닭고기">
								닭고기
								<input type="checkbox" name="allergy" value="돼지고기">
								돼지고기
								<input type="checkbox" name="allergy" value="복숭아">
								복숭아
								<input type="checkbox" name="allergy" value="민들레">
								민들레
								<input type="checkbox" name="allergy" value="계란흰자">
								계란흰자
							</div>
						</div>
						<input type="hidden" name="checkboxStr" id="checkbox_str">
						<div class="modal-footer">
							<input type="submit" value="등록" class="btn btn-primary" id="btn_signup">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</form>

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
					<li class="nav-item"><a href="#" class="nav-link">공지사항</a></li>
					<li class="nav-item" id="btn_product_info"><a href="#" class="nav-link">상품정보</a></li>
					<li class="nav-item"><a href="#" class="nav-link">베스트 섭취 정보</a></li>
					<li class="nav-item"><a href="#" class="nav-link">내 섭취 정보</a></li>
					<li class="nav-item"><a href="#" class="nav-link">예상 섭취 정보</a></li>
					<li class="nav-item"><a href="#" class="nav-link">검색</a></li>
					<li class="nav-item"><a href="#" class="nav-link">Q&A</a></li>
				</ul>
			</div>
		</nav>
	</header>
	<article>
		<div class="text-center" style="float: center; color: white; background-color: gray; padding: 20px;">
			<h3>WHAT WE PROVIDE</h3>
			<hr>
			<p>건강한 삶을 위한 먹거리 프로젝트</p>
		</div>
		<nav class="navbar navbar-expand-sm navbar-dark bg-dark" style="padding: 20px;">
			<div>
				<select name="country_id" id="condition" tabindex="1">
					<option>상품명</option>
					<option>제조사</option>
					<option>영양정보</option>
				</select>
				<input id="contents" type="text">
				<input type="submit" id="b_search">
			</div>
		</nav>
	</article>
	<div id="main_page"></div>

	<footer>
		<div class="jumbotron mt-5 mb-0">
			<h3 class="text-secondary">Find us</h3>
			<hr>
			<p>주소: 서울시 강남구 테헤란로 멀티스퀘어</p>
			<p>번호: 1588-0012</p>
			<p>e-mail: multicampus@ssafy.com</p>
		</div>

	</footer>
</body>

<script>
	if ("${msg}" != "") {
		alert("${msg}");
	}
	$('#exampleModal').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget) // Button that triggered the modal
		var recipient = button.data('whatever') // Extract info from data-* attributes
		// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		var modal = $(this)
		modal.find('.modal-title').text('New message to ' + recipient)
		modal.find('.modal-body input').val(recipient)
	})

	$(document)
		.ready(
			function () {
				$("#main_body").remove();
				$("#main_page").append('<div id="main_body"> </div>');
				$
					.ajax({
						url: "main.do",
						success: function (data) {
							$
								.each(
									data.list,
									function (index, item) {
										var img_src;
										var name;
										var marterial;

										var tmp;
										console.log(tmp);
										name = item.name
										marterial = item.material
										img_src = item.img
										$("#main_body")
											.append(
												'<table class="product_info" border="0" cellspacing="0" cellpadding="0"> <tbody> <tr><td align="left" valign="top"><img width="200px" src=' +
												img_src +
												'></img></td><td class="product_contents" width="*" align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tbody><tr><td width="*" valign="top"><div class="ss_book_list"><ul><li><h1 class="product_name">' +
												name +
												'</h1><hr></li><li id="materials">' +
												marterial +
												'</li><li><button id="btn_add">추가</button><button id=btn_zzim>찜</button></li></ul></div></td></tr></tbody></table></td></tr></tbody></table>'
												);
									})
						}
					})
			})

	$("#b_search")
		.on(
			"click",
			function () {
				var condition = $("#condition").val();
				var contents = $("#contents").val();
				var tmp;
				if (condition == "상품명") {
					tmp = "name";
				} else if (condition == "제조사") {
					tmp = "maker";
				} else {
					tmp = "material"
				}

				if (contents == "") {
					contents = "*";
				}

				$("#main_body").remove();
				$("#main_page").append('<div id="main_body"> </div>');
				$
					.ajax({

						url: "search.do/" + tmp + "/" + contents,
						success: function (data) {
							$
								.each(
									data.list,
									function (index, item) {
										var img_src;
										var name;
										var marterial;

										name = item.name
										marterial = item.material
										img_src = item.img
										$("#main_body")
											.append(
												'<table class="product_info" border="0" cellspacing="0" cellpadding="0"> <tbody> <tr><td align="left" valign="top"><img width="200px" src=' +
												img_src +
												'></img></td><td class="product_contents" width="*" align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tbody><tr><td width="*" valign="top"><div class="ss_book_list"><ul><li><h1 class="product_name">' +
												name +
												'</h1><hr></li><li id="materials">' +
												marterial +
												'</li><li><button id="btn_add">추가</button><button id=btn_zzim>찜</button></li></ul></div></td></tr></tbody></table></td></tr></tbody></table>'
												);
									})
						}
					})
			})

	$("#btn_product_info")
		.on(
			"click",
			function () {
				$("#main_body").remove();
				$("#main_page")
					.append(
						'<div id="main_body" style="display:grid; grid-template-columns: repeat(2, 1fr);" > </div>');
				$
					.ajax({
						url: "foodlist.do",
						success: function (data) {
							console.log(data);
							$.each(
								data.list,
								function (index, item) {
									var img_src;
									var name;
									var marterial;

									name = item.name;
									marterial = item.material;
									img_src = item.img;
									$("#main_body")
										.append(
											'<table class="product_info" border="0"  cellspacing="0" cellpadding="0"> <tbody> <tr><td align="left" valign="top"><img class="product_img" width="200px" src=' +
											img_src +
											'></img></td><td class="product_contents" width="*" align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tbody><tr><td width="*" valign="top"><div class="ss_book_list"><ul><li><h1 class="product_name">' +
											name +
											'</h1><hr></li><li id="materials">' +
											marterial +
											'</li><li><button id="btn_add">추가</button><button id=btn_zzim>찜</button></li></ul></div></td></tr></tbody></table></td></tr></tbody></table>'
											);
								})
						}
					})
			})

	$(document).on("click", ".product_name", function (event) {
		location.href = "foodInfo.jsp?foodName=" + $(this).text();
	});

	$('input:checkbox[name="allergy"]').each(function () {
		if ("${user.allergy}".includes(this.value)) {
			this.checked = true;
		}
	});

	if ($ {
			user eq null
		}) {
		$("#btn_user_info").css("visibility", "hidden");
		$("#btn_signup").css("visibility", "visible");
		$("#btn_logout").css("visibility", "hidden");
		$("#btn_login").css("visibility", "visible");
	} else {
		$("#btn_user_info").css("visibility", "visible");
		$("#btn_signup").css("visibility", "hidden");
		$("#btn_logout").css("visibility", "visible");
		$("#btn_login").css("visibility", "hidden");
	}

	$("#btn_signup").on("submit", function (event) {
		event.preventDefault();
		var boxes = document.getElementsByClassName('checkbox');
		var checked = [];
		for (var i = 0; boxes[i]; ++i) {
			if (boxes[i].checked) {
				checked.push(boxes[i].name);
			}
		}

		var checkedStr = checked.join(',');

		document.getElementById('checkbox_str').value = checkedStr;
		form.submit();

		return false;
	});
</script>

</html>