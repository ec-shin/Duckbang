<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/info/security.css">
<div>

	<h1 id="security_h1">보안/안전시설</h1>
	
	<div id="security_icon_area">
		<c:if test="${InfoSecurity.s_videophone eq 'Y'}">
			<div class="security_icon_list">
				<div id="videophone"></div> 
				<p>인터폰</p> 
			</div> 
		</c:if>
		<c:if test="${InfoSecurity.s_joint_entrance eq 'Y'}">
			<div class="security_icon_list">
				<div id="joint_entrance"></div> 
				<p>공동현관</p> 
			</div> 
		</c:if>	
		<c:if test="${InfoSecurity.s_cctv eq 'Y'}">
			<div class="security_icon_list">
				<div id="cctv"></div> 
				<p>CCTV</p>
			</div>
		</c:if>				
		<c:if test="${InfoSecurity.s_cctv eq 'Y'}">
			<div class="security_icon_list">
				<div id="cardkey"></div> 
				<p>카드키</p>
			</div>
		</c:if>
		<c:if test="${InfoSecurity.s_windowguard eq 'Y'}">
			<div class="security_icon_list">
				<div id="windowguard"></div> 
				<p>방범창</p>
			</div>
		</c:if>	
	</div>
</div>