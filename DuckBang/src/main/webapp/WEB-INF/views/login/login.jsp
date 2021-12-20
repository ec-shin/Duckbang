<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/assets/css/login/login.css" type="text/css" />
</head>
<body>
	<div>
	    <!-- 상단 메뉴바 -->
	    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	</div>
	
	<div class="login_container">
		<form class="login_form">
			<h1>로그인</h1>
			<h2>덕방 서비스 이용을 위해 로그인해주세요.</h2>
			<div class="login_form_id">
				<label class="login_form_label">
					<p class="login_form_text">아이디</p>
					<input class="login_form_input" autocomplete="off" type="text" name="email" placeholder="이메일 주소 입력" />
				</label>
			</div>
			<div class="login_form_pw">
				<label class="login_form_label">
					<p class="login_form_text">비밀번호</p>
					<input class="login_form_input" autocomplete="off" type="password" name="password" placeholder="비밀번호 입력" />
				</label>
			</div>
			<div class="login_form_idSaved">
				<label class="login_form_idSaved_label">
					<input type="checkbox" name="isSaved" class="login_form_idSaved_input"/>
					<p class="login_form_idSaved_text">아이디 저장</p>
				</label>
				<div class="login_form_membership">
					<p onclick="membership();" class="login_form_membership_text">회원가입</p>
				</div>
			</div>
			<button class="login_form_btn">
				<span>로그인</span>
			</button>
			
		</form>
		<div class="api_login">
			<div id="kakao"><img src="${pageContext.request.contextPath}/resources/assets/icon/login/kakao.PNG"></div>
			<div id="naver"><img src="${pageContext.request.contextPath}/resources/assets/icon/login/naver.PNG"></div>		
		</div>
	</div>
		
	<div>
	    <!-- 하단 상세정보 -->
	    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>
	
	<script>
		function membership(){
			location.href="./signin";
		}
		const login_form = document.getElementsByClassName('login_form')[0];
		const login_btn = document.getElementsByClassName('login_form_btn')[0];
		const login_email = document.getElementsByClassName('login_form_input')[0];
		const login_password = document.getElementsByClassName('login_form_input')[1];
		
		const kakao_btn = document.getElementById("kakao");
		const naver_btn = document.getElementById("naver");
		
		const setCookie = function (name, value, expiredDay) { 
			const expired = new Date(); 
			expired.setTime(expired.getTime() + expiredDay * 24 * 60 * 60 * 1000); 
			document.cookie = name + '=' + encodeURIComponent(value) + ';expires=' + expired.toUTCString() + ';path=/'; 
		
		};	
	
		var user_id;
		var email_list = [];
		var pass_list = [];
	
		<c:forEach items="${user}" var="user"> 
			email_list.push("${user.u_id}"); 
			pass_list.push("${user.u_password}");
		</c:forEach>
			
		var login;
		
		function check(){
			for(var i=0; i< email_list.length; i++){
				if(login_email.value == email_list[i] && login_password.value == pass_list[i]){
					login = true;
					user_id = login_email.value;
					break;
				}else{
					login = false;
				}
			}
			
			if(login == true){
				alert("성공");
				login_form.setAttribute("method","POST");
				login_form.setAttribute("action","./main");

				setCookie("user_id", user_id, 1);
			}else{
				login_form.setAttribute("method","POST");
				alert("아이디와 비밀번호를 확인해주세요!");
			}
		}

		login_btn.addEventListener("click", check);
		
		function kakao(){
			location.href = "https://kauth.kakao.com/oauth/authorize?client_id=ac0200598e60ecc8c5327db6df20969c&redirect_uri=http://localhost:8080/room/kakaoLogin&response_type=code";
		}
		
		kakao_btn.addEventListener("click", kakao);
		
		function naver(){
			location.href = "${url}"
		}
		
		naver_btn.addEventListener("click", naver);
		
	</script>
	
</body>
</html>










