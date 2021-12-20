<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href ="${pageContext.request.contextPath}/resources/assets/css/info/index.css">
</head>
<body>
<div>
	<div>
		<!-- 상단 메뉴바 -->
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	</div>
		<div class="index_base">
			<div>
			<div>
				<jsp:include page="./elements/header.jsp"></jsp:include>
			</div>
			
			<div>
				<!-- 표(세부정보) -->
				<jsp:include page="./elements/info.jsp"></jsp:include>
			</div>
			<!-- 한나 -->
			<div>
				<!-- 이미지 -->
				<jsp:include page="./elements/gallary.jsp"></jsp:include>
			</div>
		</div>
		<div id="menubar_area">
			<!-- 센터고정메뉴바 -->
			<jsp:include page="./elements/menubar.jsp"></jsp:include>	
		</div>
		<div id="content_area">
			<!-- 덕중 -->
			<div id="price_area">
				<!-- 가격정보 -->
				<jsp:include page="./elements/price.jsp"></jsp:include>
			</div>
			<!-- 천혁 -->
			<div id="option_area">
				<!-- 옵션 + 보안/안전시설 -->
				<jsp:include page="./elements/option.jsp"></jsp:include>
			</div>
			<div id="security_area">
				<!-- 위치 및 주변시설 -->
				<jsp:include page="./elements/security.jsp"></jsp:include>
			</div>
			<div id="other_room">
				<!-- 이 중개사무소의 다른방 -->
				<jsp:include page="./elements/other.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<div>
		<!-- 하단 메뉴바 -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>
</div>

</body>
</html>