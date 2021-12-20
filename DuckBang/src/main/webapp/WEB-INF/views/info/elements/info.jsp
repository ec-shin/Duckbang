<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath}/resources/assets/css/info/info.css" rel="stylesheet" type="text/css">
<div class="info_a">
	<div class="info_a_1">
		<p class="info_a_1_1">
			확인매물
			<span>
				${Info1.o_register_date}
			</span>
		</p>
		<p class="info_a_1_2">
			<span>방주인과 공인중개사가 거래정보를 확인한 매물입니다.</span>
			<button class="info_a_1_2_btn">?</button>
			<div class="info_popup hidden">
  				<div class="info_popup_1"></div>
  					<div class="info_popup_2">
    					<div class="popup_1">
    						<h1>확인매물이란?</h1>
    						<p>확인매물은 아래 절차를 모두 통과한 가장 믿을 수 있는</p>
    						<p>매물정보입니다.</p>
    					</div>
    					<ul>
    						<li>
    							<h1>방주인 확인</h1>
    							<p>방주인이 직접 거래가격, 위치, 중개사무소까지 확인했어요!</p>
    						</li>
    						<li>
    							<h1>중개사무소 확인</h1>
    							<p>인증을 완료한 믿을 수 있는 중개업소가 광고한 매물입니다.</p>
    						</li>
    						<li>
    							<h1>인증날짜 확인</h1>
    							<p>인증날짜를 확인하세요.</p>
    							<p>최근에 인증된 방이 더욱 믿을 수 있어요!</p>
    						</li>
    					</ul>
    					<div class="popup_2">
    						<button class="info_popup_close_btn">✖</button>
    					</div>
  					</div>
				</div>
			</div>
		</p>
	</div>
	<!-- 
		나중에 DB서 불러올때
		<li>
			<p class="info_a_2_1">컬럼명</p>
			<div class="info_a_2_2">값</div>
		</li>
		불러오면 됩니다.
	 -->
	<ul class="info_a_2">
		<li>
			<p class="info_a_2_1">해당층/건물층</p>
			<div class="info_a_2_2">${Info1.od_apply_floor}층 / ${Info1.od_whole_floor}층</div>
		</li>
		<li>
			<p class="info_a_2_1">전용/계약면적</p>
			<div class="info_a_2_2">${Info1.od_private_area}㎡ / ${Info1.od_supply_area}㎡</div>
		</li>
		<li>
			<p class="info_a_2_1">방 수/욕실 수</p>
			<div class="info_a_2_2">${Info1.od_room_count}개 / ${Info1.od_bathroom_count}개</div>
		</li>
		<li>
			<p class="info_a_2_1">방향</p>
			<div class="info_a_2_2">북동</div>
		</li>
		<li>
			<p class="info_a_2_1">난방종류</p>
			<div class="info_a_2_2">${Info1.od_heating_kind}</div>
		</li>
		<li>
			<p class="info_a_2_1">빌트인</p>
			<div class="info_a_2_2">빌트인 주방</div>
		</li>
		<li>
			<p class="info_a_2_1">총 세대수</p>
			<div class="info_a_2_2">414세대</div>
		</li>
		<li>
			<p class="info_a_2_1">건물 주차수</p>
			<div class="info_a_2_2">총 437대</div>
		</li>
		<li>
			<p class="info_a_2_1">세대당 주차수</p>
			<div class="info_a_2_2">1대</div>
		</li>
		<li>
			<p class="info_a_2_1">베란다/발코니</p>
			<div class="info_a_2_2">없음</div>
		</li>
		<li>
			<p class="info_a_2_1">입주가능일</p>
			<div class="info_a_2_2">${Info1.od_occupy_date}</div>
		</li>
		<li>
			<p class="info_a_2_1">주용도</p>
			<div class="info_a_2_2">${Info1.od_construction_use}</div>
		</li>
		<li>
			<p class="info_a_2_1">사용승인일</p>
			<div class="info_a_2_2">${Info1.od_use_approval_date}</div>
		</li>
		<li>
			<p class="info_a_2_1">최종 등록일</p>
			<div class="info_a_2_2">2021-10-03</div>
		</li>
		<li>
			<p class="info_a_2_1">최근 수정일</p>
			<div class="info_a_2_2">2021-10-03</div>
		</li>
	</ul>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/info/info.js"></script>
