<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/assets/css/map/index.css'/>">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body style="overflow: hidden;">
<div id="mapMainBody">
	<div>
		<!-- 상단 메뉴바 -->
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	</div>
	<div id="mapMainContainer">
		<jsp:include page="./elements/map.jsp"></jsp:include>
	</div>
</div>
</body>
</html>