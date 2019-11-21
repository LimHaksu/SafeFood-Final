<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="./css/table.css" />

    <!-- JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">


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
        <!--         <form action="insert.do" method="post">
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
        </div> -->

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
                <div class="container" id="post">
                    <!-- 여기에 게시판 작성 -->
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>{{post.no}}</td>
                                <td>{{post.title}}</td>
                                <td>{{post.writer}}</td>
                            </tr>
                        </tbody>
                    </table>
                    <span style="color:#ffffff">
                        <h5>내용</h5>
                    </span>
                    <div id="contents" v-show="!contents_modifyflag">
                        <!--여기에 본문-->
                        {{post.contents}}
                        <br><a class="btn btn-default pull-right" @click="contents_modify">수정</a>
                    </div>
                    <div id="contents" v-show="contents_modifyflag">
                        <textarea style="width:700px; height:300px;" v-model="post.contents"></textarea>
                        <br><a class="btn btn-default pull-right" @click="writePost">등록</a>
                    </div>
                    <a class="btn btn-default pull-right" @click="deletePost">삭제</a>
                    <hr />
                    <span style="color:#ffffff">
                        <h5>답변</h5>
                    </span>
                    <div id="contents" v-show="post.comments!=null && !comments_modifyflag">
                        {{post.comments}}
                        <br><a class="btn btn-default pull-right" @click="comments_modify">수정</a>
                    </div>
                    <div id="comments" v-show="post.comments==null || comments_modifyflag">
                        <textarea style="width:700px; height:300px;" v-model="temp_comments"></textarea>
                        <br><a class="btn btn-default pull-right" @click="writeComment">등록</a>
                    </div>
                    <a class="btn btn-default pull-right" @click="deleteComment">삭제</a>
                </div>
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
<script src="https://unpkg.com/vue"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script src="./Vue.js"></script>
<!-- url의 파라미터 가져오기 시작 -->
<script type="text/javascript">
    var Request = function () {
        this.getParameter = function (name) {
            var rtnval = '';
            var nowAddress = unescape(location.href);
            var parameters = (nowAddress.slice(nowAddress.indexOf('?') + 1,
                nowAddress.length)).split('&');
            for (var i = 0; i < parameters.length; i++) {
                var varName = parameters[i].split('=')[0];
                if (varName.toUpperCase() == name.toUpperCase()) {
                    rtnval = parameters[i].split('=')[1];
                    break;
                }
            }
            return rtnval;
        }
    }
    var request = new Request();
</script>
<script type="text/javascript">
    var paramValue = request.getParameter('no');
    console.log(paramValue);
</script>
<!-- url의 파라미터 가져오기 끝-->
<script type="text/javascript">
    let vue = new Vue({
        el: "#post",
        data() {
            return {
                post: {},
                loading: true,
                errored: false,
                temp_comments: "",
                contents_modifyflag: false,
                comments_modifyflag: false
            };
        },
        methods: {
            show_detail: function (employeeid) {
                alert(employeeid + "상세보기");
                App.empid = employeeid;
                App.currentview = "detailhrm";
                App.showlist(4);
            },
            writePost: function () {
                if (this.post.contents == "") {
                    alert("내용이 없습니다");
                    return;
                }
                axios
                    .put("http://localhost:8080/board/", this.post)
                    //.get('./emp.json')
                    .then(response => {
                        console.log(response);
                        console.log(this.post);
                    })
                    .catch(error => {
                        console.log(error);
                        this.errored = true;
                    })
                    .finally(() => {
                        this.loading = false;
                        this.contents_modifyflag = false;
                    });
            },
            writeComment: function () {
                if (this.temp_comments == "" || this.temp_comments == null) {
                    alert("내용이 없습니다");
                    return;
                }
                this.post.comments = this.temp_comments;
                axios
                    .put("http://localhost:8080/board/", this.post)
                    //.get('./emp.json')
                    .then(response => {
                        console.log(response);
                        console.log(this.post);
                    })
                    .catch(error => {
                        console.log(error);
                        this.errored = true;
                    })
                    .finally(() => {
                        this.loading = false;
                        this.comments_modifyflag = false;
                        this.temp_comments = null;
                    });
            },
            contents_modify: function () {
                console.log("수정");
                this.contents_modifyflag = true;
            },
            comments_modify: function () {
                this.comments_modifyflag = true;
                this.temp_comments = this.post.comments;
            },
            deletePost() {
                axios
                    .delete("http://localhost:8080/board/" + this.post.no)
                    .then(respone => {
                        console.log("삭제됐당");
                        window.location.href = 'http://localhost:8080/qna.jsp';
                    })
                    .catch(error => {
                        console.log(error);
                        this.errored = true;
                    })
            },
            deleteComment() {
                this.post.comments = null;
                axios
                    .put("http://localhost:8080/board/", this.post)
                    .then(respone => {
                        console.log("코멘트는 삭제될까..?");
                    })
                    .catch(error => {
                        console.log(error);
                        this.errored = true;
                    })
            }
        },
        filters: {},
        mounted() {
            axios
                .get("http://localhost:8080/board/" + paramValue)
                //.get('./emp.json')
                .then(response => {
                    this.post = response.data;
                    console.log(this.post);
                })
                .catch(error => {
                    console.log(error);
                    this.errored = true;
                })
                .finally(() => (this.loading = false));
        }
    });
</script>

</html>