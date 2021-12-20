<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/abo/profile.css" type="text/css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons+outlined"
      rel="stylesheet">
<div class="profile_div1">
	<div class="profile_div2">
		<img src="https://dabang-prod-profile-image.s3.amazonaws.com/67b183a3ecf022bbe6630c47abc10463">
	</div>
	<div class="profile_div3">
		<span class="material-icons-outlined">
			info
		</span>
		<p>간편문의를 사용하는 중개사무소입니다.</p>
	</div>
	
	<p class="profile_p1">
		${AboInfo.r_business_name}
	</p>
</div>