<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/info/gallary.css"/>
<div class="gallary_main_body">
	<div class="gallary_forSale_number">
		매물 번호
		${InfoImg.o_id}
	</div>
	<div class="gallary_forSale_image">
		<div id="first_image_large" class="gallary_image_first gallary_image_position" style="background-position:center center; background-image: url(${InfoImg.image_1});"></div>
		<div id="second_image_large" class="gallary_image_second gallary_image_position" style="background-position:center center; background-size: cover; background-image: url(${InfoImg.image_2});"></div>
		<div id="third_image_large" class="gallary_image_third gallary_image_position" style="background-position:center center; background-size: cover; background-image: url(${InfoImg.image_3});"></div>
		<div id="fourth_image_large" class="gallary_image_fourth gallary_image_position" style="background-position:center center; background-size: cover; background-image: url(${InfoImg.image_4});"></div>
		<div id="fifth_image_large" class="gallary_image_fifth gallary_image_position" style="background-position:center center; background-size: cover; background-image: url(${InfoImg.image_5});"></div>
	</div>
</div>

<!-- <div class="gallary_black_bg"></div>
<div class="gallary_modal_wrap">
   	<div class="gallary_modal_close"><a href="#">close</a></div>
</div> -->

<div class="gallary_popup gallay_hidden">
	<div class="gallary_popup_1"></div>
	<div class="gallary_popup_2">
		<div class="gallay_popup_close_div">
			<button class="gallay_popup_close_btn">✖</button>
		</div>
	</div>

</div>

<script src="${pageContext.request.contextPath }/resources/assets/js/info/gallary.js"></script>