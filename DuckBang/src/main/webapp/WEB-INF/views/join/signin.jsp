<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/join/signin.css" type="text/css" />
</head>
<body>
	<div>
	    <!-- 상단 메뉴바 -->
	    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	</div>
	
	<div class="login_container">
		<form class="login_form" action="${pageContext.request.contextPath }/check_uid">
			<h1>회원정보 입력</h1>
			<h2>[ 덕방 ] 서비스 이용을 위해 아래 정보를 입력해주세요.</h2>
			<div class="login_form_id">
				<label class="login_form_label">
					<p class="login_form_text">아이디</p>
					<input class="login_form_input" autocomplete="off" type="text" id="u_id" name="user_id" placeholder="이메일 주소 입력" onkeyup="check()"/>
				</label>
			</div>
			<div class="login_form_pw">
				<label class="login_form_label">
					<p class="login_form_text">비밀번호</p>
					<input class="login_form_input" autocomplete="off" type="password" id="password1" name="user_pw_input" placeholder="8자리 이상 영문, 숫자, 특수문자 포함" onkeyup="check()" /> <br>
					<input class="login_form_input" autocomplete="off" type="password" id="password2" name="user_pw_check" placeholder="비밀번호 확인" onkeyup="check()"/>
				</label>
			</div>
			<button class="login_form_btn" id="btn">
				<span>확인</span>
			</button>
		</form>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/join/signin.js"></script>

	<div>
	    <!-- 하단 상세정보 -->
	    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>
	
</body>


</html>