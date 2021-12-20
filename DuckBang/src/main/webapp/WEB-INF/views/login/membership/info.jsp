<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/assets/css/login/membership/info.css" type="text/css" />
</head>
<body>

<div class="member_info_container">
	<div class="member_info_content">
		<h1>회원정보 입력</h1>
		<h2>다방 서비스 이용을 위해 아래 정보를 입력해주세요.</h2>
		<div class="member_info_id">
			<label class="member_info_label">
				<p class="member_info_text">아이디</p>
				<input class="member_info_input" autocomplete="off" type="text" name="email" placeholder="이메일 주소 입력"/>
			</label>
		</div>
		<div class="member_info_pw">
			<label class="member_info_label">
				<p class="member_info_text">비밀번호</p>
				<input class="member_info_input" autocomplete="off" type="password" name="password" placeholder="8자리 이상 영문, 숫자, 특수문자 포함"/>
			</label>
		</div>
		<input class="member_info_input" autocomplete="off" type="password" name="passwordConfirm" readonly placeholder="비밀번호 확인"/>
		<button class="member_info_btn">
			<span>확인</span>
		</button>
	</div>
</div>

</body>
</html>