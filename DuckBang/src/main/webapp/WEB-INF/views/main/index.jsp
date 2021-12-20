<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel = "stylesheet" href ="${pageContext.request.contextPath}/resources/assets/css/main/index.css">
<link rel = "stylesheet" href ="${pageContext.request.contextPath}/resources/assets/css/common/headerFix.css">

</head>
<body>

<div>
	<!-- 상단 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
</div>
<div>
	<div>
		<!-- 검색창 -->
		<jsp:include page="./elements/search.jsp"></jsp:include>
	</div>
	<div class = "index_base">
		<div>
		<div>
			<!-- 서초동 추천매물 -->
			<jsp:include page="./elements/temp.jsp"></jsp:include>
		</div>
		<div>
			<!-- 서초동 소개 -->
			<jsp:include page="./elements/explain.jsp"></jsp:include>
		</div>
		</div>
	</div>
</div>
<div>
	<!-- 하단 상세정보 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>
</body>
</html>