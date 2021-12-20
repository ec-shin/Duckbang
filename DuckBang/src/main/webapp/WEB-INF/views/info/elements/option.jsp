<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/info/option.css">
<div>

	<h1 id="option_h1">옵션</h1>
	<div id="option_icon_area">
			<c:if test="${InfoOption.oo_builtin eq 'Y'}">
				<div class="option_icon_list">
					<div id="builtin"></div> 
					<p>비데</p>
				</div>
			</c:if>
			<c:if test="${InfoOption.oo_induction eq 'Y'}">
				<div class="option_icon_list">
					<div id="induction"></div> 
					<p>인덕션</p>
				</div>
			</c:if>
			<c:if test="${InfoOption.oo_washing_machine eq 'Y'}">
				<div class="option_icon_list">
					<div id="laundry"></div> 
					<p>세탁기</p>
				</div>
			</c:if>
			<c:if test="${InfoOption.oo_microwave eq 'Y'}">
				<div class="option_icon_list">
					<div id="microoven"></div> 
					<p>전자레인지</p>
				</div>
			</c:if>
			<c:if test="${InfoOption.oo_refrigerator eq 'Y'}">
				<div class="option_icon_list">
					<div id="refrigerator"></div> 
					<p>냉장고</p>
				</div>
			</c:if>
			<c:if test="${InfoOption.oo_aircon eq 'Y'}">
				<div class="option_icon_list">
					<div id="aircondition"></div> 
					<p>에어컨</p>
				</div>
			</c:if>
			<c:if test="${InfoOption.oo_tv eq 'Y'}">
				<div class="option_icon_list">
					<div id="tv"></div> 
					<p>TV</p>
				</div>
			</c:if>
			<c:if test="${InfoOption.oo_internet eq 'Y'}">
				<div class="option_icon_list">
					<div id="internet"></div> 
					<p>가스레인지</p>
				</div>
			</c:if>
			<c:if test="${InfoOption.oo_interphone eq 'Y'}">
				<div class="option_icon_list">
					<div id="interphone"></div> 
					<p>인터폰</p>
				</div>
			</c:if>
			<c:if test="${InfoOption.oo_shoe_rack eq 'Y'}">
				<div class="option_icon_list">
					<div id="shoes"></div> 
					<p>신발장</p>
				</div>
			</c:if>
			<c:if test="${InfoOption.oo_closet eq 'Y'}">
				<div class="option_icon_list">
					<div id="closet"></div> 
					<p>옷장</p>
				</div>
			</c:if>
			<c:if test="${InfoOption.oo_bed eq 'Y'}">
				<div class="option_icon_list">
					<div id="bed"></div> 
					<p>침대</p>	
				</div> 
			</c:if>
			<c:if test="${InfoOption.oo_doorlock eq 'Y'}">
				<div class="option_icon_list">
					<div id="doorlock"></div> 
					<p>전자도어락</p>
				</div>
			</c:if>																																					
	</div>
</div>