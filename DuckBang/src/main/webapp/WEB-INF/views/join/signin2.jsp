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
		
		<h1>가입완료</h1>
		
		<div id="content_area">
			<div id="gif_area">
				<img src="https://www.dabangapp.com/static/media/join.a3289f37.gif">
			</div>
			<div id="txt_area">
				<p>${id }님 </p>
				<p>환영합니다!</p>
			</div>
		</div>
		
		
		
		<button onclick="location.href='./login'" class="login_form_btn" id="welcome_btn">
			<span>확인</span>
		</button>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/join/signin.js"></script>

	<div>
	    <!-- 하단 상세정보 -->
	    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>
	
</body>
</html>