<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/info/price.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="price_content">
	<h1 id="room_payment_h1">가격정보</h1>
	<table id="payment_table">
		<colgroup>
			<col width="35%">
			<col width="35%">
			<col width="15%">
			<col width="15%">
		</colgroup>
		<thead>  
			<tr>
				<th>${price.ok_code }</th>
				<th>관리비</th>
				<th>주차비</th>
				<th>단기임대</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><p>
					<c:choose>
						<c:when test="${price.ok_code eq '월세'}"> 
							${price.ok_deposit}/${price.ok_month_of_payment}
						</c:when>
						<c:when test="${price.ok_deposit % 10000 == 0}">
							${Math.round(price.ok_deposit/10000)}억
						</c:when>					
						<c:when test="${price.ok_deposit >= 10000}">
							${Math.round(price.ok_deposit/10000)}억${price.ok_deposit % 10000}
						</c:when>
						<c:otherwise>
							${price.ok_deposit}
						</c:otherwise>	
					</c:choose>
				</p></td>
				<td id="special">
					<div>
						<p>매월 ${price.ok_maintenance_cost}만 원</p>
						<p>
							<span>(인터넷, 유선 TV)</span>
						</p>
					</div>
					<div>
						<p>별도 금액으로 부과</p>
						<p>
							<span>(전기료, 수도료, 가스사용료)</span>
						</p>
					</div>
				</td>
				<td>
					<c:choose>
						<c:when test="${price.ok_parking_pee eq 0}">
							<p>가능(무료)</p>
						</c:when>
						<c:otherwise>
							<p>${price.ok_parking_pee} 만원</p>
						</c:otherwise>
					</c:choose>
				</td>
				<td>
					<p>${price.od_short_lease}</p>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<div id="price_month">
	<div id="inner">
		<p>한달 예상 주거비용</p>
		<div id="payment">
			<div>
				${price.ok_maintenance_cost + price.ok_parking_pee}만원
				<span>
					(관리비+주차비)
				</span>
			</div>
			<div id="payment2">
				별도 금액으로 부과되는 항목은 제외됩니다.
			</div>
		</div>
	</div>
</div>
	