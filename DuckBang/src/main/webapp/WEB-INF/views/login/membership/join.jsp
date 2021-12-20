<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/assets/css/login/membership/join.css" type="text/css" />
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>

<div class="membership_container">
	<div class="membership_content">  
		<h1>회원가입</h1>
		<h2>환영합니다! 다방 서비스 이용약관에 동의해주세요.</h2>
		<label class="membership_label">
			<input class="membership_label_input" type="checkbox" />
			<p class="membership_label_text">모두 동의합니다.</p>
		</label>
		<div class="membership_agree">
			<div class="membership_agree_check">
				<label class="membership_agree_label">
					<input class="membership_agree_input" type="checkbox" />
					<p class="membership_agree_label_text">[필수] 만 14세 이상입니다.</p>
				</label>
			</div>
			<div class="membership_agree_check">
				<label class="membership_agree_label">
					<input class="membership_agree_input" type="checkbox" />
					<p class="membership_agree_label_text">[필수] 다방 서비스 이용약관 동의</p>
				</label>
				<i class='bx bx-chevron-right'></i>
			</div>
			<div class="membership_agree_check">
				<label class="membership_agree_label">
					<input class="membership_agree_input" type="checkbox" />
					<p class="membership_agree_label_text">[필수] 개인정보 수집 및 이용 동의</p>
				</label>
				<i class='bx bx-chevron-right'></i>
			</div>
			<div class="membership_agree_check">
				<label class="membership_agree_label">
					<input class="membership_agree_input" type="checkbox" />
					<p class="membership_agree_label_text">[선택] 마케팅 정보 수신에 대한 동의</p>
				</label>
				<i class='bx bx-chevron-right'></i>
			</div>
		</div>
		<div class="membership_info">
			<p class="membership_info_text">만 14세 이상 회원 가입 가능합니다.</p>
			<p class="membership_info_text">해당 내용은 <a href="">이용약관 및 정책</a>에서도 확인이 가능합니다.</p>
		</div>
		<button class="membership_btn">
			<span>동의하고 진행하기</span>
		</button>
	</div>
</div>

</body>
</html>