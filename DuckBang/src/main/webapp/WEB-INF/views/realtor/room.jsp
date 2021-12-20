<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="${pageContext.request.contextPath}/resources/assets/css/realtor/room.css" rel="stylesheet" type="text/css"/>
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>

<form id="regist_form" action="./regist" method="POST" accept-charset="utf-8"></form>
<header class="realtor_header">
	<div>
		<h1 class="realtor_title">	방내놓기</h1>
	</div>
</header>
<div class="realtor_container">
	<div>
		<div class="realtor_box">
			<h1>매물 종류</h1>
			<table>
				<colgroup>
					<col width="150px"/>
				</colgroup>
				<tbody>
					<tr>
						<th>종류 선택</th>
						<td class="realtor_box_td">
							<ul class="realtor_box_ul">
								<li>
									<label class="realtor_box_label">
										<input form="regist_form" type="radio" name="room_kind" value="원룸" checked/>
										<p>원룸</p>
									</label>
								</li>
								<li>
									<label class="realtor_box_label">
										<input form="regist_form" type="radio" name="room_kind" value="투룸" />
										<p>투/쓰리룸</p>
									</label>
								</li>
								<li>
									<label class="realtor_box_label">
										<input form="regist_form" type="radio" name="room_kind" value="오피스텔" />
										<p>오피스텔</p>
									</label>
								</li>
								<li>
									<label class="realtor_box_label">
										<input  form="regist_form"type="radio" name="room_kind" value="아파트" />
										<p>아파트</p>
									</label>
								</li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="realtor_box">
			<h1>위치 정보</h1>
			<table>
				<colgroup>
					<col width="150px"/>
				</colgroup>
				<tbody>
					<tr>
						<th>주소</th>
						<td>
							<div class="realtor_address">
								<div class="realtor_address_1">
									<p>latitude (위도)</p>
									<input form="regist_form" id="location_x" type="text" name="l_xcordinate" readonly/>
									<p>longitude (경도)</p>
									<input form="regist_form" id="location_y" type="text" name="l_ycordinate" readonly/>
									<p id="address_p">주소:</p>
								</div>
								<div class="realtor_address_2">
									<div id="map"></div>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="realtor_box">
			<h1>거래 정보</h1>
			<table>
				<colgroup>
					<col width="150px"/>
				</colgroup>
				<tbody>
					<tr id="room_tr">
						<th id="room_th" rowspan="2">거래 종류</th>

						</tr>
						<tr>
							<td>
							<div class="realtor_ok_code">
								<input form="regist_form" id="ok_code_input" type="hidden" name="ok_code"/>
								<button onclick="okCodeBtn(this)" id="month_btn">월세</button>
								<button onclick="okCodeBtn(this)" id="deposit_btn">전세</button>
								<button onclick="okCodeBtn(this)" id="trading_btn">매매</button>
								<label class="realtor_short_lease">
									<input form="regist_form" name="od_short_lease" type="checkbox" />
									<p>단기가능</p>
								</label>
								<p class="realtor_ok_code_text">
									<i class='bx bxs-info-circle'></i>
									처음에 선택한 거래 종류가 우선노출됩니다. 예치금이 있는 경우 보증금 입력란에 필히 입력하세요.
								</p>
							</div>
						</td>
						</tr>
				</tbody>
			</table>
		</div>
		<div class="realtor_box">
			<h1>기본정보</h1>
			<table>
				<colgroup>
					<col width="150px"/>
				</colgroup>
				<tbody>
					<tr>
						<th rowspan="2">
							<p>건물 크기</p>
							<span>(1P = 3.3058㎡)</span>
						</th>
						<td>
							<div class="realtor_area">
								<p class="realtor_area_p">공급 면적</p>
								<div class="realtor_area_div">
									<input form="regist_form" id="area_input1" class="realtor_area_input" name="od_private_area2" type="text" onkeyup="areaChange(this);"/>
									<p class="realtor_area_p2">평</p>
									<input form="regist_form" id="area_input2" class="realtor_area_input" name="od_private_area" type="text" placeholder="0" readonly/>
									<p class="realtor_area_p2">㎡</p>
								</div>
							</div>
						</td>
						<th rowspan="2">건물 층수</th>
						<td>
							<div class="realtor_floor">
								<p class="realtor_floor_p">건물 층수</p>
								<input form="regist_form" class="realtor_area_input" type="text" name="od_whole_floor"/>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="realtor_area">
								<p class="realtor_area_p">전용 면적</p>
								<div class="realtor_area_div">
									<input form="regist_form" id="area_input3" class="realtor_area_input" type="text" onkeyup="areaChange(this);"/>
									<p class="realtor_area_p2">평</p>
									<input form="regist_form" id="area_input4" class="realtor_area_input" name="od_supply_area" type="text"  placeholder="0" readonly/>
									<p class="realtor_area_p2">㎡</p>
								</div>
							</div>
						</td>
						<td>
							<div class="realtor_floor">
								<p class="realtor_floor_p">해당 층수</p>
								<input form="regist_form" class="realtor_area_input" type="text" name="od_apply_floor"/>
							</div>
						</td>
					</tr>
					<tr>
						<th>난방 종류</th>
						<td>
							<div class="realtor_area">
								<select form="regist_form" name="od_heating_kind" class="realtor_heating">
									<option>난방 종류 선택</option>
									<option value="중앙난방">중앙난방</option>
									<option value="개별난방">개별난방</option>
									<option value="지역난방">지역난방</option>
								</select>
							</div>							
						</td>
						<th rowspan="2">방 수</th>
						<td>
							<div class="realtor_area">
								<p class="realtor_area_p">방 수</p>
								<div class="realtor_area_div">
									<input form="regist_form" id="area_input3" class="realtor_area_input" name="od_room_count" type="text"/>
									<p class="realtor_area_p2">개</p>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>건축 용도</th>
						<td>
							<div class="realtor_area">
								<select form="regist_form" name="od_construction_use" class="realtor_heating">
									<option>건축 용도 선택</option>
									<option value="주거시설">주거시설</option>
									<option value="업무시설">업무시설</option>
									<option value="공동주택">공동주택</option>
									<option value="단독주택">단독주택</option>
								</select>
							</div>							
						</td>	
						<td>
							<div class="realtor_area">
								<p class="realtor_area_p">욕실 수</p>
								<div class="realtor_area_div">
									<input form="regist_form" id="area_input3" class="realtor_area_input" name="od_bathroom_count" type="text"/>
									<p class="realtor_area_p2">개</p>
								</div>
							</div>
						</td>	
					</tr>
					<tr>
						<th>입주 가능일</th>	
						<td><input form="regist_form" name="od_occupy_date" class="realtor_date" type="date" /></td>
					</tr>
				</tbody>
			</table>	
		</div>
		<div class="realtor_box">
			<h1>요금 정보</h1>
			<table>
				<colgroup>
					<col width="150px"/>
					<col width="450px"/>
					<col width="150px"/>
					<col width="430px"/>
				</colgroup>
				<tbody>
					<tr>
						<th>관리비</th>
						<td>
							<div class="realtor_maintenance">
								<input form="regist_form" id="maintenance_fee" name="ok_maintenance_cost" class="maintenance_input" placeholder="0"/>
								<p class="maintenance_p">만원</p>
								<div class="maintenance_div">
									<label class="maintenance_label">
										<input form="regist_form" type="checkbox" onclick="maintenance(this);"/>
										<p>관리비 없음</p>
									</label>
								</div>
							</div>
						</td>
						<th>주차여부</th>
						<td>
							<div class="realtor_maintenance">
								<label class="maintenance_label">
									<input form="regist_form" onclick="impossible(this);" id="parking_impossible" type="radio" name="check" checked />
									<p>불가능</p>
								</label>
								<label class="maintenance_label">
									<input form="regist_form" onclick="possible(this);" id="parking_possible" type="radio" name="check"/>
									<p>가능</p>
								</label>
								<input form="regist_form" id="parking_fee" type="text" class="option_parking_input" placeholder="0" name="ok_parking_fee" readonly/>
								<p class="option_parking_p">만원</p>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="realtor_box">
			<h1>옵션 정보</h1>
			<table>
				<tbody>
					<tr>
						<td class="realtor_option_td">
							<div class="realtor_option">
								<label class="maintenance_label">
									<input form="regist_form" name="option" type="checkbox" value="0"/>
									<p>인덕션</p>
								</label>								
							</div>					
						</td>
						<td class="realtor_option_td">
							<div class="realtor_option">
								<label class="maintenance_label">
									<input form="regist_form" name="option" type="checkbox" value="1"/>
									<p>세탁기</p>
								</label>								
							</div>					
						</td>
						<td class="realtor_option_td">
							<div class="realtor_option">
								<label class="maintenance_label">
									<input form="regist_form" name="option" type="checkbox" value="2" />
									<p>전자레인지</p>
								</label>								
							</div>					
						</td>			
						<td class="realtor_option_td">
							<div class="realtor_option">
								<label class="maintenance_label">
									<input form="regist_form" name="option" type="checkbox" value="3" />
									<p>냉장고</p>
								</label>								
							</div>					
						</td>	
						<td class="realtor_option_td">
							<div class="realtor_option">
								<label class="maintenance_label">
									<input form="regist_form" name="option" type="checkbox" value="4" />
									<p>에어컨</p>
								</label>								
							</div>					
						</td>
						<td class="realtor_option_td">
							<div class="realtor_option">
								<label class="maintenance_label">
									<input form="regist_form" name="option" type="checkbox" value="5"  />
									<p>TV</p>
								</label>								
							</div>					
						</td>			
						<td class="realtor_option_td">
							<div class="realtor_option">
								<label class="maintenance_label">
									<input form="regist_form" name="option" type="checkbox" value="6" />
									<p>가스레인지</p>
								</label>								
							</div>		
						</td>
						</tr>	
						<tr>
							<td class="realtor_option_td">
							<div class="realtor_option">
								<label class="maintenance_label">
									<input form="regist_form" name="option" type="checkbox" value="7"  />
									<p>옷장</p>
								</label>								
							</div>					
						</td>			
						<td class="realtor_option_td">
							<div class="realtor_option">
								<label class="maintenance_label">
									<input form="regist_form" name="option" type="checkbox" value="8"  />
									<p>신발장</p>
								</label>								
							</div>					
						</td>						
						<td class="realtor_option_td">
							<div class="realtor_option">
								<label class="maintenance_label">
									<input form="regist_form" name="option" type="checkbox" value="9"  />
									<p>인터폰</p>
								</label>								
							</div>					
						</td>		
						<td class="realtor_option_td">
							<div class="realtor_option">
								<label class="maintenance_label">
									<input form="regist_form" name="option" type="checkbox" value="10" />
									<p>침대</p>
								</label>								
							</div>					
						</td>	
						<td class="realtor_option_td">
							<div class="realtor_option">
								<label class="maintenance_label">
									<input form="regist_form" name="option" type="checkbox" value="11"  />
									<p>도어락</p>
								</label>								
							</div>					
						</td>
						<td class="realtor_option_td">
							<div class="realtor_option">
								<label class="maintenance_label">
									<input form="regist_form" name="option" type="checkbox" value="12"  />
									<p>비데</p>
								</label>								
							</div>					
						</td>																											
						</tr>		
				</tbody>
			</table>
		</div>
			<div class="realtor_box">
			<h1>보안 정보</h1>
			<table>
				<tbody>
					<tr>
						<td class="realtor_option_td">
							<div class="realtor_option">
								<label class="maintenance_label">
									<input form="regist_form" name="security" type="checkbox" value="0"/>
									<p>인터폰</p>
								</label>								
							</div>					
						</td>
						<td class="realtor_option_td">
							<div class="realtor_option">
								<label class="maintenance_label">
									<input form="regist_form" name="security" type="checkbox" value="1"/>
									<p>공동현관</p>
								</label>								
							</div>					
						</td>
						<td class="realtor_option_td">
							<div class="realtor_option">
								<label class="maintenance_label">
									<input form="regist_form" name="security" type="checkbox" value="2"/>
									<p>CCTV</p>
								</label>								
							</div>					
						</td>			
						<td class="realtor_option_td">
							<div class="realtor_option">
								<label class="maintenance_label">
									<input form="regist_form" name="security" type="checkbox" value="3"/>
									<p>카드키</p>
								</label>								
							</div>					
						</td>	
						<td class="realtor_option_td">
							<div class="realtor_option">
								<label class="maintenance_label">
									<input form="regist_form" name="security" type="checkbox" value="4"/>
									<p>방범창</p>
								</label>								
							</div>					
						</td>
						</tr>		
				</tbody>
			</table>
		</div>
		<div class="realtor_box">
			<h1>사진 등록</h1>
			<table class="imgTable">
				<tr>
					<th>1. Image</th>
					<td><input form="regist_form"class="imageInput" type="text" name="image_1"/></td>
				</tr>
				<tr>
					<th>2. Image</th>
					<td><input form="regist_form"class="imageInput" type="text" name="image_2"/></td>
				</tr>
				<tr>
					<th>3. Image</th>
					<td><input form="regist_form"class="imageInput" type="text" name="image_3"/></td>
				</tr>
				<tr>
					<th>4. Image</th>
					<td><input form="regist_form"class="imageInput" type="text" name="image_4"/></td>
				</tr>
				<tr>
					<th>5. Image</th>
					<td><input form="regist_form"class="imageInput" type="text" name="image_5"/></td>
				</tr>
			</table>
		</div>
		<div class="realtor_end">
			<label class="realtor_end_label">
				<input form="regist_form" type="checkbox" name="realtor_agreeChk"/>
				<p>매물관리규정을 확인하였으며, 입력한 정보는 실제 매물과 다름이 없습니다.</p>
			</label>
			<div class="realtor_end_div">
				<button onclick="location.href='realtor'" class="realtor_cancel">취소</button>
				<input form="regist_form" type="submit" class="realtor_add" value="매물등록"/>
			</div>
		</div>
	</div>
</div>

<script src="${pageContext.request.contextPath }/resources/assets/js/realtor/room.js" charset="UTF-8"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCO1eRP2ExsPqAhGnAd2H6FO2Zo2dIefYE&callback=initMap&libraries=places&v=weekly&region=kr" async>
</script>
