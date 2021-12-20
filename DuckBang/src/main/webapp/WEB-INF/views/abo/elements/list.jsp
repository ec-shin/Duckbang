<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/abo/list.css" type="text/css" />
<ul class="list_ul1">
	<!-- 
		DB에서 가져올때 
		<li>
			<p class="list_p1">컬럼명</p>
			<div class="list_div1">값</div>
		</li>
	-->

	<li>
		<p class="list_p1">중개사무소명</p>
		<div class="list_div1">${AboInfo.r_business_name}</div>
	</li>
	<li>
		<p class="list_p1">대표자명</p>
		<div class="list_div1">${AboInfo.r_name}</div>
	</li>
	<li>
		<p class="list_p1">전화번호</p>
		<div class="list_div1">${AboInfo.r_business_phone}</div>
	</li>
	<li>
		<p class="list_p1">사업자등록번호</p>
		<div class="list_div1">113-18-20724</div>
	</li>
	<li>
		<p class="list_p1">중개등록번호</p>
		<div class="list_div1">${AboInfo.r_business_license}</div>
	</li>
	<li>
		<p class="list_p1">다방가입일</p>
		<div class="list_div1">2020년 06월 09일</div>
	</li>
	<li>
		<p class="list_p1">거래완료된 방</p>
		<div class="list_div1">37개의 방</div>
	</li>
	<li style="width:66.6%;">
		<p class="list_p1">주소</p>
		<div class="list_div1" style="flex-grow: 1;">${AboInfo.r_address}</div>
	</li>

</ul>