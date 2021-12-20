<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main/explain.css" type="text/css" />

<div id="explain_container">
	<div class="explain_info_text"><p><blueT>강남역</blueT>은 어떤 동네일까요?</p></div>
	<div class="explain_info">
		<div id="info_slide" class="explain_info_slide">
			<div class="explain_info_slide_option-1">
				<p class="title">원룸 평균 매물가</p>
				<div class="explain_infoWrap">
					<div class="explain_priceWrap">
						<div class="explain_price">
							<p class="name" id="explain1_okCode">${explain_1.ok_code}</p>
							<p class="value" id="explain1_deposit">
								${Math.round(explain_1.ok_deposit/100)*100}/${Math.round(explain_1.ok_month_of_payment/10)*10}
							</p>
						</div>
						<div class="explain_price">
							<p class="name" id="explain2_okCode">${explain_2.ok_code}</p>
							<p class="value" id="explain2_deposit">
								<c:if test="${explain_2.ok_deposit >= 10000}">
									${Math.round(explain_2.ok_deposit/10000)}억${Math.round((explain_2.ok_deposit % 10000)/10)*10}
								</c:if>
							</p>
						</div>
					</div>
					
					<p class="description">※ 전용면적 33㎡(10평)이하</p>
				</div>
			</div>
			<div class="explain_info_slide_option-1">
				<p class="title">투·쓰리룸 평균 매물가</p>
				<div class="explain_infoWrap">
					<div class="explain_priceWrap">
						<div class="explain_price">
							<p class="name" id="explain3_okCode">${explain_3.ok_code}</p>
							<p class="value" id="explain3_deposit">
								${Math.round(explain_3.ok_deposit/100)*100}/${Math.round(explain_3.ok_month_of_payment/10)*10}
							</p>
						</div>
						<div class="explain_price">
							<p class="name" id="explain4_okCode">${explain_4.ok_code}</p>
							<p class="value" id="explain4_deposit">
								<c:if test="${explain_4.ok_deposit >= 10000}">
									${Math.round(explain_4.ok_deposit/10000)}억${Math.round((explain_4.ok_deposit % 10000)/10)*10}
								</c:if>
							</p>
						</div>
					</div>
					<p class="description">※ 전용면적 60㎡(18평)이하</p>
				</div>
			</div>
			<div class="explain_info_slide_option-1">
				<p class="title">오피스텔 평균 매물가</p>
				<div class="explain_infoWrap">
					<div class="explain_priceWrap">
						<div class="explain_price">
							<p class="name" id="explain5_okCode">${explain_5.ok_code}</p>
							<p class="value" id="explain5_deposit">
								${Math.round(explain_5.ok_deposit/10)*10}/${Math.round(explain_5.ok_month_of_payment/10)*10}
							</p>
						</div>
						<div class="explain_price">
							<p class="name" id="explain6_okCode">${explain_6.ok_code}</p>
							<p class="value" id="explain6_deposit">
								<c:if test="${explain_6.ok_deposit >= 10000}">
									${Math.round(explain_6.ok_deposit/10000)}억${Math.round((explain_6.ok_deposit % 10000)/10)*10}
								</c:if>
							</p>
						</div>
					</div>
					<p class="description">※ 전용면적 33㎡(10평)이하</p>
				</div>
			</div>
			
		<div class="explain_info_slide_option-2">
			<p class="title">편의시설</p>
			<div class="explain_infoWrap">
			<div class="explain_icons">
				<div class= "explain_icon">
					<div class="explain_icon-1">
					</div>
					<p class="name">카페</p>
					<p class="value">72</p>
				</div>
				<div class= "explain_icon">
					<div class="explain_icon-2">
					</div>
					<p class="name">편의점</p>
					<p class="value">34</p>
				</div>
				<div class= "explain_icon">
					<div class="explain_icon-3">
					</div>
					<p class="name">수퍼마켓</p>
					<p class="value">16</p>
				</div>
				<div class= "explain_icon">
					<div class="explain_icon-4">
					</div>
					<p class="name">미용실</p>
					<p class="value">71</p>
				</div>
				<div class= "explain_icon">
					<div class="explain_icon-5">
					</div>
					<p class="name">세탁/빨래방</p>
					<p class="value">19</p>
				</div>	
				<div class= "explain_icon">
					<div class="explain_icon-6">
					</div>
					<p class="name">실내운동</p>
					<p class="value">0</p>
				</div>
			</div>	
		</div>
		</div>
		<div class="explain_info_slide_option-3">
				<p class="title">강남역에서는</p>
				<p class="title_bold">원룸 상담이 가장 많아요</p>
			<div class="explain_infoWrap">
				<div class="explain_barWrap">
					<div class="explain_barWrap_content">
						<p>원룸</p>
						<div class="explain_bar-1"><div><p>56.2%</p></div></div>
					</div>
					<div class="explain_barWrap_content">
						<p>투쓰리룸</p>
						<div class="explain_bar-2"><div><p>40.6%</p></div></div>
					</div>
					<div class="explain_barWrap_content">
						<p>아파트</p>
						<div class="explain_bar-3"><div><p>20%</p></div></div>
					</div>
				</div>
			</div>
			<p class="description">※ 최근 7일간 문자/전화문의 수 기준</p>			
		</div>
		</div>
		<!-- next -->
		<svg id = "next_point" class="next" style="width: 50; height: 50; viewBox: 0 0 50 50;">
			<g fill="none"; fill-rule="evenodd">
				<path fill="#000" d="M0 0h50v50H0z"></path>
				<path stroke="#FFF" d="M22 16l9 9-9 9"></path>
			</g>
		</svg>
		<!-- prev -->
		<svg id = "prev_point" class="prev" style="width: 50; height: 50; viewBox: 0 0 50 50;">
			<g fill="none"; fill-rule="evenodd">
				<path fill="#000" d="M0 0h50v50H0z"></path>
				<path stroke="#FFF" d="M22 16l9 9-9 9"></path>
			</g>
		</svg>
	</div>
</div>

<script type="text/javascript" src="./resources/assets/js/main/explain.js"></script>