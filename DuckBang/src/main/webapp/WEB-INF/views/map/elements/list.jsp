<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/map/list.css">
<div id="list_body">
	<div id="list_area">
		<div id="list_count">
		
		</div>
		<div id="list_unit_box">
			<div class = "list_unit_btn">
			</div>
		</div>
	</div>
	
	<div id="list_room_infos">
		<div class="list_room_info">
			<div class="list_room_image_div">
				<img class="list_room_image" src="https://cdn.ggumim.co.kr/cache/star/600/20201222151726uFqauJF8wD.jpg"/>
			</div>
			<div class="room_info">
				<div class="list_room_reco_sort">
					<div class="list_room_recommend">추천여부</div>
					<div class="list_room_sort">방 종류</div>
				</div>
				<div class="list_room_type">월세, 전세(가격)</div>
				<div class="list_room_size">평수, 제곱m/ 층수</div>
				<div class="list_room_area">동네</div>
				<div class="list_room_one_line">사용자가 강조하는 한줄</div>
			</div>
		</div>
		
		<c:forEach begin="0" end="32" var="i">
			<div class="list_room_info">
				<div class="list_room_image_div">
					<img class="list_room_image" src="https://cdn.ggumim.co.kr/cache/star/600/20201222151726uFqauJF8wD.jpg"/>
				</div>
				<div class="room_info">
					<div class="list_room_reco_sort">
						<div class="list_room_recommend">추천</div>
						<div class="list_room_sort">원룸 오픈형 원룸</div>
					</div>
					<div class="list_room_type">전세 7500 ${i }</div>
					<div class="list_room_size">23m 4층</div>
					<div class="list_room_area">성북구 돈암동</div>
					<div class="list_room_one_line">풀옵션에 깔끔한 원룸</div>
				</div>
			</div>
		</c:forEach>
	</div>
		<div id="paging">

		</div>
</div>

<script src="${pageContext.request.contextPath }/resources/assets/js/map/list.js"></script>
