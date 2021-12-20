<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/info/header.css" type="text/css" />
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
<div id="header_container">
	<ul class="header_ul">
		<li class="header_li">
			<p class="header_p1"></p>
			<div class="header_price">
			<h1>${InfoTop1.ok_code} 
				<c:choose>
					<c:when test="${InfoTop1.ok_code eq '월세'}">
						${InfoTop1.ok_deposit}/${InfoTop1.ok_month_of_payment}
					</c:when>
					<c:when test="${InfoTop1.ok_deposit % 10000 == 0}">
						${Math.round(InfoTop1.ok_deposit/10000)}억
					</c:when>	
					<c:when test="${InfoTop1.ok_deposit >= 10000}">
						${Math.round(InfoTop1.ok_deposit/10000)}억${InfoTop1.ok_deposit % 10000}
					</c:when>
					<c:otherwise>
						${InfoTop1.ok_deposit}
					</c:otherwise>
				</c:choose>
				</h1>	
				<span>만원</span>
			</div>
		</li>
		<li class="header_li">
			<p class="header_width">전용면적</p>
			<div class="header_width_2">
				<h1 id="number" class="header_h1">${InfoTop1.od_private_area}㎡</h1>
				<button id="areaBtn" class="header_btn1"><i class='bx bx-refresh'></i><span id="areaSpan">평</span></button>
			</div>
		</li>
		<li class="header_li">
			<p class="header_month">한달 예상 주거비</p>
			<h1 class="header_h2"><span>${InfoTop1.ok_maintenance_cost + InfoTop1.ok_parking_pee}만원 + α</span></h1>
		</li>
		<li class="header_li2">
			<div>
				<p class="header_p2">${InfoTop2.r_business_name}</p>
				<p class="header_p3">${InfoTop2.r_name}</p>
			</div>
			<button class="header_phone_btn"><span>연락처보기</span></button>
			
			
			<div class="header_phone_popup hidden">
				<div class="header_bg"></div>
				<div class="header_box">
					<div class="header_popup_1">
						<h1>연락처 보기</h1>
					</div>
					<button class="header_popup_close_btn">x</button>
					<div class="header_popup_2">
						<div class="header_popup_2_1">
							<h1>${InfoTop2.r_business_name}</h1>
							<p>${InfoTop2.r_address}</p>
							<div class="header_popup_2_2">
								<p>대표명</p>
								<p>${InfoTop2.r_name}</p>
							</div>
							<div class="header_popup_2_2">
								<p>중개등록번호</p>
								<p>${InfoTop2.r_business_license}</p>
							</div>
							<div class="header_popup_2_2">
								<p>대표번호</p>
								<p>${InfoTop2.r_business_phone}</p>
								<a href="./abo?r_id=${InfoTop2.r_id }">중개소 정보 더보기</a>
							</div>
						</div>
					</div>
					<div class="header_popup_3">
						<div class="header_popup_3_1">
								<p>다방이 해당 공인중개사무소에</p>
							<p>계약 가능 여부를 확인하여 알려드립니다.</p>
						</div>
						<button class="header_popup_question_btn">간편문의</button>
						<div class="header_popup_3_2">
							<div>
								<p>중개사무소에서 계약 가능여부를 확인하여 48시간 이내</p>
								<p>카카오 알림톡으로 알려드립니다. (알림시간 : 오전 9시 ~</p>
								<p>오후 7시)</p>
							</div>
							<div>
								<p>
									*계약 가능한 매물일 경우 
									<span>회원님의 전화번호는 안심번호로</span>
								</p>
								<p>
									<span>중개사무소에 전달</span>
									되며, 회원님에게 연락드릴 수 있습니다.
								</p>
								<p>(회원님이 전화를 거실 때는 실제 번호가 노출됩니다.)</p>
							</div>
							<div>
								<p>
									알림톡 발송 및 안심번호 이용을 위해
									<span>회원정보의 연락처를</span>
								</p>
								<p>확인해주세요.</p>
							</div>
						</div>
					</div>
					<div class="header_popup_4">
						<div class="header_popup_4_1">
							<i class='bx bxs-phone' ></i><p>0504-1396-1878</p>
						</div>
						<p class="header_popup_4_p">중개사무소에 연락하여 방문일을 예약하세요.</p>
						<p class="header_popup_4_p">다방에서 보고 연락한다고 말씀하시면</p>
						<p class="header_popup_4_p">더욱 빠른 예약이 가능합니다.</p>
					</div>
					<!-- 
						<div class="header_popup_5">
							<i class='bx bx-info-circle'></i><p>다방앱을 이용하시면 문자로 연락요청이 가능합니다.</p>
						</div>
					 -->
					
				</div>
			</div>
		</li>
	</ul>	
</div>
<script>
	var check = true;
	
	document.getElementById('areaBtn').addEventListener('click', () => {
		if(check){
			check = false;
			document.getElementById('number').innerText = '${InfoTop1.od_private_area2}평';
			document.getElementById('areaSpan').innerHTML = '㎡'
		}else{
			check = true;
			document.getElementById('number').innerText = '${InfoTop1.od_private_area}㎡';
			document.getElementById('areaSpan').innerHTML = '평'
		}
	});
</script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/info/header.js"></script>