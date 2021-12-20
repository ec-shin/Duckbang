<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>Places Search Box</title>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="<c:url value='/resources/assets/css/map/list.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/assets/css/map/map.css'/>" />
  </head>
	<body>
	
	<div id="mapContainer">
		<div id="map_map">
	    	<input id="pac-input" class="controls" type="text" placeholder="지역, 지하철역, 학교 검색"/>
	    	<input id="value_o_id" type="hidden" value="${o_id }"/>
	    	<input id="value_xcordinate" type="hidden" value="${xcordinate }"/>
	    	<input id="value_ycordinate" type="hidden" value="${ycordinate }"/>	    
	    	<div class="map_btn_div">
	    		<button id="map_btn"></button>
			</div>
		</div>

		<div id="map"></div>
	</div>
	
	<div id="listContainer">
		<div id="list_body">
			<div id="list_area">
				<div id="list_count"></div>
				<div id="list_option_code">
					<select id="list_code_select" name="ok_code">
						<option class="option_ok_code" value="전체">전체</option>
						<option class="option_ok_code" value="월세">월세</option>
						<option class="option_ok_code" value="전세">전세</option>
						<option class="option_ok_code" value="매매">매매</option>
					</select>
				</div>
				<div id="list_unit_box">
					<button id="unit_btn" class = "list_unit_btn"></button>
				</div>
			</div>
			
			<div id="list_room_infos">
			</div>
			<div id="paging">
			</div>
		</div>
	
	</div>
	
	<script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCO1eRP2ExsPqAhGnAd2H6FO2Zo2dIefYE&callback=initMap&libraries=places&v=weekly&region=kr"
      async
    ></script>

	<script>
		//console.log(typeof ${summaryLists.size()});
		//console.log(${summaryLists.get(0).getImage_1()});

		const list_code_select = document.getElementById('list_code_select');
		const list_room_infos = document.getElementById('list_room_infos');
		const unit_btn = document.getElementById('unit_btn');
		const list_count = document.getElementById('list_count');
		const list_info_a_class = document.getElementsByClassName('list_info_a');
		
		var list_only_btn_div;
		var list_info_a;
		var list_class_info;
		var list_room_image_div; // 이미지랑 버튼 전체 div
		var list_room_imageDiv;  // 이미지만 있는 div
		var list_room_image_btn_div; // 버튼만 있는 div
		var list_room_image_btn;
		var list_room_image;
		var room_info;
		var list_room_reco_sort;
		var list_room_sort;
		var list_room_type;
		var list_room_size;
		var list_room_occupy_date;
		var list_room_area;
		var list_room_lease;
		
		var no_list_info;
		var no_list_image_div;
		var no_list_image;
		var no_list_text1;
		var no_list_text2;
		
		var o_ids = [];
		var o_code_ids = [];
		
		var option_code_value;
		
		// 찜하기
		function interest() {
			var interest_btn = new Array();
			var interest_btn_values = new Array();
			var user_cookie;
		   
			const getCookie = function (name) { 
				var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)'); 
				return value ? decodeURIComponent(value[2]) : null; 
			};
		   
			user_cookie = getCookie('user_id')
			var userDate = new Date();
		   
			function add_interest(){
				if(user_cookie == null){
					location.href = "./login"
				}else{
					const xhttp = new XMLHttpRequest();
		         
					const interest = {
						o_id : this.value,
						u_id : user_cookie,
						i_date : userDate
					};
		         
					if(this.style.color == "white"){
						xhttp.open('POST','/room/interest', true);
						xhttp.setRequestHeader('content-type','application/json;charset=EUC-KR');
						xhttp.send(JSON.stringify(interest));
			            
						xhttp.addEventListener('readystatechange', (e)=>{
							this.style.backgroundImage = "url('https://cdn.discordapp.com/attachments/895995335292370949/904688134137217024/2_1.png')";
							this.style.backgroundSize = "cover";
							this.style.color = "red";
			
						});
			            
					}else{
						xhttp.open('POST','/room/deleteInterest', true);
						xhttp.setRequestHeader('content-type','application/json;charset=EUC-KR');
						xhttp.send(JSON.stringify(interest));
			            
						xhttp.addEventListener('readystatechange', (e)=>{
							this.style.backgroundImage = "url('https://cdn.discordapp.com/attachments/895995335292370949/904688143884767252/1.png')";
							this.style.backgroundSize = "cover";
							this.style.color = "white";
						});
					}
				}
			}
		    for(let i = 0; i < o_ids.length; ++i) {
				<c:forEach items='${summaryLists}' var="list">
					if(option_code_value == '전체'){
						if(o_ids[i] == '${list.getO_id()}'){
							interest_btn[i] = document.getElementsByClassName('list_room_image_btn')[i];
							interest_btn[i].addEventListener("click", add_interest);
							
							interest_btn[i].setAttribute("value", "${list.o_id}");
							interest_btn_values[i] = "${list.o_id}";
							interest_btn[i].style.backgroundImage = "url('https://cdn.discordapp.com/attachments/895995335292370949/904688143884767252/1.png')";
							interest_btn[i].style.backgroundSize = "cover";
							interest_btn[i].style.color = "white";
						}
					} else {
						if((o_code_ids[i] == '${list.getO_id()}') && (option_code_value =="${list.getOk_code()}")){
							interest_btn[i] = document.getElementsByClassName('list_room_image_btn')[i];
							interest_btn[i].addEventListener("click", add_interest);
							
							interest_btn[i].setAttribute("value", "${list.o_id}");
							interest_btn_values[i] = "${list.o_id}";
							interest_btn[i].style.backgroundImage = "url('https://cdn.discordapp.com/attachments/895995335292370949/904688143884767252/1.png')";
							interest_btn[i].style.backgroundSize = "cover";
							interest_btn[i].style.color = "white";
						}	
					}
					
				</c:forEach>
		    }
		    
			if(user_cookie != null){
				<c:forEach items="${interest_list}" var="interest_list"> 
					if("${interest_list.u_id}" == user_cookie){
						for(var i=0; i< interest_btn.length; i++){
							if(interest_btn[i].value == "${interest_list.o_id}"){
								interest_btn[i].style.backgroundImage = "url('https://cdn.discordapp.com/attachments/895995335292370949/904688134137217024/2_1.png')";
								interest_btn[i].style.backgroundSize = "cover";
								interest_btn[i].style.color = "red";
							}
						}
					}
				</c:forEach>
			}
		}
		
		function getLists(locations, map) {
			
			list_count.innerText = '지역 목록 0개';
			
			option_code_value = "전체";
			list_code_select.addEventListener('change', () => {
				o_code_ids = [];
				option_code_value = list_code_select.options[list_code_select.selectedIndex].value;
				list_div_plus(locations, map);
				
				o_code_ids  = o_code_ids.filter(function(item) {
				  return item !== null && item !== undefined && item !== '';
				});
				
				interest();
			});
			
			// 리스트에 데이터 넣기
			list_div_plus(locations, map);
		}
		
		function list_div_plus(locations, map){
			
			if(o_ids.length == 0){
				list_room_infos.innerHTML = '';
				no_list_info = document.createElement('div');
				no_list_image_div = document.createElement('div');
				no_list_image = document.createElement('div');
				no_list_text1 = document.createElement('div');
				no_list_text2 = document.createElement('div');
				
				no_list_info.setAttribute('class', 'no_list_info');
				no_list_image_div.setAttribute('class', 'no_list_image_div');
				no_list_image.setAttribute('class', 'no_list_image');
				no_list_text1.setAttribute('class', 'no_list_text1');
				no_list_text2.setAttribute('class', 'no_list_text2');
				
				no_list_text1.innerText = '검색조건에 맞는 매물이 없습니다.';
				no_list_text2.innerText = '위치를 변경해보세요';
				
				no_list_image_div.appendChild(no_list_image);
				
				no_list_info.appendChild(no_list_image_div);
				no_list_info.appendChild(no_list_text1);
				no_list_info.appendChild(no_list_text2);
				
				list_room_infos.appendChild(no_list_info);
			}else {
				list_room_infos.innerHTML = '';
				
				for(let i = 0; i < o_ids.length; ++i) {
		            
	 				<c:forEach items="${summaryLists}" var="list">

						var dateFormat = new Date('${list.getOd_occupy_date()}');
						var deposit = '${list.getOk_deposit()}';
						var depositRest = parseInt(deposit / 10000);
						
						if(option_code_value == "전체"){
							
							if(o_ids[i] == '${list.getO_id()}'){
		               
								list_only_btn_div = document.createElement('div');
								list_info_a = document.createElement('a');      
								list_class_info = document.createElement('div');
								list_room_image_div = document.createElement('div');
								list_room_imageDiv = document.createElement('div');
								list_room_image_btn_div = document.createElement('div');
								list_room_image_btn = document.createElement('button');
								list_room_image = document.createElement('img');
								room_info = document.createElement('div');
								list_room_reco_sort = document.createElement('div');
								list_room_sort = document.createElement('div');
								list_room_type = document.createElement('div');
								list_room_size = document.createElement('div');
								list_room_occupy_date = document.createElement('div');
								list_room_area = document.createElement('div');
								list_room_lease = document.createElement('div');
								
								list_only_btn_div.setAttribute('class', 'list_only_btn_div');
								list_info_a.setAttribute('class', 'list_info_a');
								list_class_info.setAttribute('class', 'list_class_info');
								list_room_image_div.setAttribute('class', 'list_room_image_div');
								list_room_imageDiv.setAttribute('class', 'list_room_imageDiv');
								list_room_image_btn_div.setAttribute('class', 'list_room_image_btn_div');
								list_room_image_btn.setAttribute('class', 'list_room_image_btn');
								list_room_image.setAttribute('class', 'list_room_image');
								room_info.setAttribute('class', 'room_info');
								list_room_reco_sort.setAttribute('class', 'list_room_reco_sort');
								list_room_sort.setAttribute('class', 'list_room_sort');
								list_room_type.setAttribute('class', 'list_room_type');
								list_room_size.setAttribute('class', 'list_room_size');
								list_room_size.setAttribute('id', '${list.getO_id()}');
								list_room_occupy_date.setAttribute('class', 'list_room_occupy_date');
								list_room_area.setAttribute('class', 'list_room_area');
								list_room_lease.setAttribute('class', 'list_room_lease');
								
								list_info_a.setAttribute('href', './info?o_id=${list.getO_id()}');
								list_room_image.setAttribute('src', '${list.getImage_1()}');
								list_room_image_btn_div.appendChild(list_room_image_btn);
								list_room_imageDiv.appendChild(list_room_image);
								list_room_image_div.appendChild(list_room_imageDiv);
								list_room_sort.innerText = '${list.getOd_room_kind()}';
								list_room_reco_sort.appendChild(list_room_sort);
								room_info.appendChild(list_room_reco_sort);
								
								if(depositRest !== 0){
									if((deposit % 10000) == 0) {
										deposit = depositRest +'억 ';
									}else {
										deposit = depositRest +'억 ' + (deposit % 10000).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
									}
								}else {
									deposit = deposit.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
								}
								
								if('${list.getOk_code()}' == '월세'){
									list_room_type.innerHTML = '<b style="color: black";>${list.getOk_code()}</b>' + '  ' + deposit +'/' + '${list.getOk_month_of_payment()}';
								}else {
									list_room_type.innerHTML = '<b style="color: black";>${list.getOk_code()}</b>' + '  ' + deposit;
								}
								
								list_room_size.innerText = '${list.getOd_private_area()}m² · ${list.getOd_apply_floor()}층';
								list_room_occupy_date.innerText = '입주 날짜: ' + dateFormat.toLocaleDateString();
								list_room_lease.innerHTML = '단기임대 여부: ' + '<b>${list.getOd_short_lease()}</b>';
								
								room_info.appendChild(list_room_type);
								room_info.appendChild(list_room_size);
								room_info.appendChild(list_room_occupy_date);
								room_info.appendChild(list_room_area);
								room_info.appendChild(list_room_lease);
								
								list_only_btn_div.appendChild(list_room_image_btn_div);
								list_class_info.appendChild(list_room_image_div);
								list_class_info.appendChild(room_info);
								list_info_a.appendChild(list_class_info);
								list_room_infos.appendChild(list_only_btn_div);
								list_room_infos.appendChild(list_info_a);
								
								var eachMarker;
								var eachMarkerIcon = new google.maps.MarkerImage("resources/assets/icon/map/selectArea.png", null, null, null, new google.maps.Size(40,40));
								
								list_class_info.addEventListener('mouseenter', () => {
									for(var i = 0; i < locations.length; i++) {
										if("${list.getO_id()}" == locations[i][2]) {
											eachMarker = new google.maps.Marker({
										         position: new google.maps.LatLng(locations[i][0], locations[i][1]),
										         map: map,
										         animation: google.maps.Animation.BOUNCE,
										         icon: eachMarkerIcon,
										      });
										}
									}
								});
								
								list_class_info.addEventListener('mouseleave', () => {
									for(var i = 0; i < locations.length; i++) {
										if("${list.getO_id()}" == locations[i][2]) {
											eachMarker.setMap(null);
										}
									}
								});
							}
						}else {
							
							if(o_ids[i] == '${list.getO_id()}' && "${list.getOk_code()}" == option_code_value){
								
								o_code_ids[i] = o_ids[i];
								
								list_only_btn_div = document.createElement('div');
								list_info_a = document.createElement('a');      
								list_class_info = document.createElement('div');
								list_room_image_div = document.createElement('div');
								list_room_imageDiv = document.createElement('div');
								list_room_image_btn_div = document.createElement('div');
								list_room_image_btn = document.createElement('button');
								list_room_image = document.createElement('img');
								room_info = document.createElement('div');
								list_room_reco_sort = document.createElement('div');
								list_room_sort = document.createElement('div');
								list_room_type = document.createElement('div');
								list_room_size = document.createElement('div');
								list_room_occupy_date = document.createElement('div');
								list_room_area = document.createElement('div');
								list_room_lease = document.createElement('div');
								
								list_only_btn_div.setAttribute('class', 'list_only_btn_div');
								list_info_a.setAttribute('class', 'list_info_a');
								list_class_info.setAttribute('class', 'list_class_info');
								list_room_image_div.setAttribute('class', 'list_room_image_div');
								list_room_imageDiv.setAttribute('class', 'list_room_imageDiv');
								list_room_image_btn_div.setAttribute('class', 'list_room_image_btn_div');
								list_room_image_btn.setAttribute('class', 'list_room_image_btn');
								list_room_image.setAttribute('class', 'list_room_image');
								room_info.setAttribute('class', 'room_info');
								list_room_reco_sort.setAttribute('class', 'list_room_reco_sort');
								list_room_sort.setAttribute('class', 'list_room_sort');
								list_room_type.setAttribute('class', 'list_room_type');
								list_room_size.setAttribute('class', 'list_room_size');
								list_room_size.setAttribute('id', '${list.getO_id()}');
								list_room_occupy_date.setAttribute('class', 'list_room_occupy_date');
								list_room_area.setAttribute('class', 'list_room_area');
								list_room_lease.setAttribute('class', 'list_room_lease');
								
								list_info_a.setAttribute('href', './info?o_id=${list.getO_id()}');
								list_room_image.setAttribute('src', '${list.getImage_1()}');
								list_room_image_btn_div.appendChild(list_room_image_btn);
								list_room_imageDiv.appendChild(list_room_image);
								list_room_image_div.appendChild(list_room_imageDiv);
								list_room_sort.innerText = '${list.getOd_room_kind()}';
								list_room_reco_sort.appendChild(list_room_sort);
								room_info.appendChild(list_room_reco_sort);
								
								if(depositRest !== 0){
									if((deposit % 10000) == 0) {
										deposit = depositRest +'억 ';
									}else {
										deposit = depositRest +'억 ' + (deposit % 10000).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
									}
								}else {
									deposit = deposit.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
								}
								
								if('${list.getOk_code()}' == '월세'){
									list_room_type.innerHTML = '<b style="color: #0649c0";>${list.getOk_code()}</b>' + '  ' + deposit +'/' + '${list.getOk_month_of_payment()}';
								}else {
									list_room_type.innerHTML = '<b style="color: #0649c0";>${list.getOk_code()}</b>' + '  ' + deposit;
								}
								
								list_room_size.innerText = '${list.getOd_private_area()}m² · ${list.getOd_apply_floor()}층';
								list_room_occupy_date.innerText = '입주 날짜: ' + dateFormat.toLocaleDateString();
								list_room_lease.innerHTML = '단기임대 여부: ' + '<b>${list.getOd_short_lease()}</b>';
								
								room_info.appendChild(list_room_type);
								room_info.appendChild(list_room_size);
								room_info.appendChild(list_room_occupy_date);
								room_info.appendChild(list_room_area);
								room_info.appendChild(list_room_lease);
								
								list_only_btn_div.appendChild(list_room_image_btn_div);
								list_class_info.appendChild(list_room_image_div);
								list_class_info.appendChild(room_info);
								list_info_a.appendChild(list_class_info);
								list_room_infos.appendChild(list_only_btn_div);
								list_room_infos.appendChild(list_info_a);
								
								var eachMarker;
								var eachMarkerIcon = new google.maps.MarkerImage("resources/assets/icon/map/selectArea.png", null, null, null, new google.maps.Size(40,40));
								
								// 마우스 올렸을 때 지도에 마커로 표시해주기
								list_class_info.addEventListener('mouseenter', () => {
									for(var i = 0; i < locations.length; i++) {
										if("${list.getO_id()}" == locations[i][2]) {
											eachMarker = new google.maps.Marker({
										         position: new google.maps.LatLng(locations[i][0], locations[i][1]),
										         map: map,
										         animation: google.maps.Animation.BOUNCE,
										         icon: eachMarkerIcon,
										      });
										}
									}
								});
								
								// 마우스 내렸을때 마커 이벤트 지워주기
								list_class_info.addEventListener('mouseleave', () => {
									for(var i = 0; i < locations.length; i++) {
										if("${list.getO_id()}" == locations[i][2]) {
											eachMarker.setMap(null);
										}
									}
								});
							}
						}
					</c:forEach>
					list_count.innerText = '지역 목록 ' + list_info_a_class.length + '개';
					
				}
				if(list_info_a_class.length == 0) {
					
					no_list_info = document.createElement('div');
					no_list_image_div = document.createElement('div');
					no_list_image = document.createElement('div');
					no_list_text1 = document.createElement('div');
					no_list_text2 = document.createElement('div');
					
					no_list_info.setAttribute('class', 'no_list_info');
					no_list_image_div.setAttribute('class', 'no_list_image_div');
					no_list_image.setAttribute('class', 'no_list_image');
					no_list_text1.setAttribute('class', 'no_list_text1');
					no_list_text2.setAttribute('class', 'no_list_text2');
					
					no_list_text1.innerText = '검색조건에 맞는 매물이 없습니다.';
					no_list_text2.innerText = '위치를 변경해보세요';
					
					no_list_image_div.appendChild(no_list_image);
					
					no_list_info.appendChild(no_list_image_div);
					no_list_info.appendChild(no_list_text1);
					no_list_info.appendChild(no_list_text2);
					
					list_room_infos.appendChild(no_list_info);
				}
			}
		}
		
		// 단위 버튼 눌렀을 때 change해주기
		var press_btn = false;
		
		unit_btn.addEventListener('click', () => {
			
			var aa = document.getElementsByClassName('list_room_size');
			
			if(press_btn == true) {
				press_btn = false;
			}else if(press_btn == false) {
				press_btn = true;
			}
			
			Array.from(aa).forEach((e) => {
				
				<c:forEach items="${summaryLists}" var="list">
					if(e.getAttribute('id') == "${list.getO_id()}" && press_btn == true){
		            	e.innerText = "${list.getOd_private_area2()}평 · ${list.getOd_apply_floor()}층";
		            }else if(e.getAttribute('id') == "${list.getO_id()}" && press_btn == false) {
		            	e.innerText = '${list.getOd_private_area()}m² · ${list.getOd_apply_floor()}층';
		            }
		            
	     		</c:forEach>
				
			});
		});
		
		// 지도 시작
		var cityCircle;
		var infoWindow;
		function initMap() {
		<c:choose>
			<c:when test="${check eq 'get' || lat eq 'undefined'}">
			  const map = new google.maps.Map(document.getElementById("map"), {
			      center: {
			         lat: 37.497926, 
			         lng: 127.027808
			      },
			      zoom: 18,
			      mapTypeControl: false,
			      fullscreenControl: false,
			      mapTypeId: "roadmap",
			      options: {
			         gestureHandling: 'greedy'
			      }
			   });
			</c:when>
			<c:otherwise>
			  const map = new google.maps.Map(document.getElementById("map"), {
			      center: {
			         lat: ${lat},
			         lng: ${lng}
			      },
			      zoom: 18,
			      mapTypeControl: false,
			      fullscreenControl: false,
			      mapTypeId: "roadmap",
			      options: {
			         gestureHandling: 'greedy'
			      }
			   });
			</c:otherwise>
		</c:choose>
		
		   // Create the search box and link it to the UI element.
		   const input = document.getElementById("pac-input");
		   const map_map = document.getElementById("map_map");
		   const input_div = input.parentNode;
		   const map_btn = document.getElementById("map_btn");
		   const searchBox = new google.maps.places.SearchBox(input);

		   map.controls[google.maps.ControlPosition.TOP_LEFT].push(map_map);
		   input.style.marginTop = "13px";
		   input.style.marginLeft = "13px";
		  
		   // Bias the SearchBox results towards current map's viewport.
		   const clickEvent = map.addListener("bounds_changed", () => {
		                     searchBox.setBounds(map.getBounds());
		                  });

		   let markers = [];

		   // Listen for the event fired when the user selects a prediction and retrieve
		   // more details for that place.
		   searchBox.addListener("places_changed", () => {
		      const places = searchBox.getPlaces();

		      if (places.length == 0) {
		         return;
		      }

		      // Clear out the old markers.
		      markers.forEach((marker) => {
		         marker.setMap(null);
		      });
		      markers = [];

		      // For each place, get the icon, name and location.
		      const bounds = new google.maps.LatLngBounds();

		      places.forEach((place) => {
		         if (!place.geometry || !place.geometry.location) {
		            console.log("Returned place contains no geometry");
		            return;
		         }

		         const icon = {
		            url: place.icon,
		            size: new google.maps.Size(71, 71),
		            origin: new google.maps.Point(0, 0),
		            anchor: new google.maps.Point(17, 34),
		            scaledSize: new google.maps.Size(25, 25),
		         };

		         // Create a marker for each place.
		         markers.push(
		            new google.maps.Marker({
		               map,
		               icon,
		               title: place.name,
		               position: place.geometry.location,
		            })
		         );
		         
		         if (place.geometry.viewport) {
		            // Only geocodes have viewport.
		            bounds.union(place.geometry.viewport);
		         } else {
		            bounds.extend(place.geometry.location);
		         }
		         
		         // 검색위치 반경에 원 표시해주기
		         var latitude = place.geometry.location.lat();   // 위도
		         var longitude = place.geometry.location.lng();   // 경도

		         const citymap = {
		            center: { lat: latitude, lng: longitude},
		         };
		         
		         // 여러개 나오게하는거 방지
		         if(cityCircle) {
		            cityCircle.setMap(null);
		         }
		         
		         // 지도 드래그할때 원이랑 마커 지워주기
		         google.maps.event.addListener(map, 'drag', () => {
		            cityCircle.setMap(null);
		            for(var idx = 0; idx < markers.length; idx++) {
		                markers[idx].setMap(null);
		            }
		         });

		         // Add the circle for this city to the map.
		         // 맨위에 var cityCircle선언해줌
		         cityCircle = new google.maps.Circle({
		            strokeColor: "gray",   // 선의 색
		            strokeOpacity: 0.8,      // 선의 불투명도
		            strokeWeight: 2,      // 선의 두께
		            fillColor: "gray",      // 채우기 색깔
		            fillOpacity: 0.35,      // 채우기 불투명도
		            map,               // 표시할 맵의 이름
		            center: citymap.center,   // 원의 중심좌표
		            radius: 500,         // 원의 반지름 (단위: 미터)
		         });
		            // 여기까지 검색위치 반경에 원표시 해주기
		      });
		      map.fitBounds(bounds);

		   });
		  
		   // 현재 위치 불러오기
		   infoWindow = new google.maps.InfoWindow();

		   const locationButton = document.createElement("button");

		   locationButton.classList.add("custom-map-control-button");
		   map.controls[google.maps.ControlPosition.TOP_RIGHT].push(locationButton);
		   locationButton.addEventListener("click", () => {
		      // Try HTML5 geolocation.
		      if (navigator.geolocation) {
		         navigator.geolocation.getCurrentPosition((position) => {
		            const pos = {
		               lat: position.coords.latitude,
		               lng: position.coords.longitude,
		            };

		         const image = new google.maps.MarkerImage("resources/assets/icon/map/geolocationIcon.png", null, null, null, new google.maps.Size(15,15));
		         
		         // 현재 위치에 마커 표시해주기
		         new google.maps.Marker({
		             position: pos,
		             map,
		             title: "현재 위치", // 마커에 mouseover했을때 나오는 글
		             icon: image,
		           });
		         
		         //infoWindow.setPosition(pos);
		         //infoWindow.setContent("<div style='background-color: black;'>현재위치</div>");
		         infoWindow.open(map);
		         map.setCenter(pos);
		      },() => {
		         handleLocationError(true, infoWindow, map.getCenter());
		         });
		      } else {
		         // Browser doesn't support Geolocation
		         handleLocationError(false, infoWindow, map.getCenter());
		      }
		   });
		   // 여기까지 현재 위치 불러오기

		   //여러개 마커 찍기
		   makeMarkers(map);
		   
		}

		// 여러가지 마커들 찍기
		function makeMarkers(map) {

		   // location테이블에서 x좌표, y좌표 가져옴
		   const xcordinate = document.getElementById("value_xcordinate").value;      // x좌표
		   const ycordinate = document.getElementById("value_ycordinate").value;      // y좌표
		   const o_id = document.getElementById("value_o_id").value;               // 매물번호

		   // 데이터 정리해주기
		   let x_slice = xcordinate.slice(1, -1);
		   let x_array = x_slice.split(', ');

		   let y_slice = ycordinate.slice(1, -1);
		   let y_array = y_slice.split(', ');
		   
		   let id_slice = o_id.slice(1, -1);
		   let id_array = id_slice.split(', ');
		   
		   var locations = [];
		   
		   // locations 배열에 x좌표, y좌표, 매물번호 넣어주기
		   for(j = 0; j < x_array.length; j++) {
		      locations[j] = [];
		      for(k = 0; k < 2; k++) {
		         locations[j][0] = x_array[j];
		         locations[j][1] = y_array[j];
		         locations[j][2] = id_array[j];
		      }
		   }
		   
		   var listContainer = document.getElementById("listContainer");
		   var map_div = document.getElementById("map");
		   
		   google.maps.event.addListener(map, 'zoom_changed', function() {
		      o_ids = [];
		      press_btn = false;
		      
		      list_code_select[0].selected = '전체';
		      
		      listContainer.style.visibility = "visible";
		      map_div.style.width = "100%";
		      
		      const boundss = map.getBounds();
		      var endLat = boundss.getNorthEast().lat();
		      var endLng = boundss.getNorthEast().lng();
		      
		      var startLat = boundss.getSouthWest().lat();
		      var startLng = boundss.getSouthWest().lng();
		      
		      for(i = 0; i < locations.length; i++) {
		         if((locations[i][0] >= startLat && locations[i][0] <= endLat) && (locations[i][1] >= startLng && locations[i][1] <= endLng)){
		            o_ids.push(locations[i][2]);
		         }
		      }
		      //console.log("o_ids: " + o_ids);
		      getLists(locations, map);
		      interest();

		   });
		   
		   google.maps.event.addListener(map, 'dragend', function() {
			      o_ids = [];
			      press_btn = false;
			      
			      list_code_select[0].selected = '전체';
			      
			      listContainer.style.visibility = "visible";
			      map_div.style.width = "100%";
			      
			      const boundss = map.getBounds();
			      var endLat = boundss.getNorthEast().lat();
			      var endLng = boundss.getNorthEast().lng();
			      
			      var startLat = boundss.getSouthWest().lat();
			      var startLng = boundss.getSouthWest().lng();

			      for(i = 0; i < locations.length; i++) {
			         if((locations[i][0] >= startLat && locations[i][0] <= endLat) && (locations[i][1] >= startLng && locations[i][1] <= endLng)){
			            o_ids.push(locations[i][2]);
			         }
			      }

			getLists(locations, map);
			interest();
		   });
		   
		   // 마커 추가해줌
		   addMarker(locations, map);
		}

		// 마커 출력 함수
		function addMarker(locations, map) {
		   var i, marker;
		   var room_kind_icon = "";

		   if("${empty room_kind}"){
			   addAllRoomIconMarker(marker, locations, map);
		   }
		   if("${!empty room_kind}"){
			   if("${room_kind}" == '아파트'){
				   room_kind_icon = new google.maps.MarkerImage("resources/assets/icon/map/apartIcon.png", null, null, null, new google.maps.Size(40,40));
				   addRoomIconMarker(marker, locations, room_kind_icon, map);
			   }else if("${room_kind}" == '오피스텔'){
				   room_kind_icon = new google.maps.MarkerImage("resources/assets/icon/map/officeIcon.png", null, null, null, new google.maps.Size(40,40));
				   addRoomIconMarker(marker, locations, room_kind_icon, map);
			   }else if("${room_kind}" == '원룸'){
				   room_kind_icon = new google.maps.MarkerImage("resources/assets/icon/map/oneroomIcon.png", null, null, null, new google.maps.Size(40,40));
				   addRoomIconMarker(marker, locations, room_kind_icon, map);
			   }else if("${room_kind}" == '투룸'){
				   room_kind_icon = new google.maps.MarkerImage("resources/assets/icon/map/tworoomIcon.png", null, null, null, new google.maps.Size(40,40));
				   addRoomIconMarker(marker, locations, room_kind_icon, map);
			   }
		   }
		   
		}
		
		// 마커 찍어주기
		function addRoomIconMarker(marker, locations, room_kind_icon, map){
			for(i = 0; i < locations.length; i++){
				  
			      marker = new google.maps.Marker({
			         position: new google.maps.LatLng(locations[i][0], locations[i][1]),
			         map: map,
			         icon: room_kind_icon,
			      });
			      
			      google.maps.event.addListener(marker, 'click', (function(marker, i) {
			         return function() { 
			            sendNumGet('./info', locations[i][2]);
			         } 
			      })(marker, i));
			   }
		}
		
		// 모든 방 아이콘 찍기
		function addAllRoomIconMarker(marker, locations, map){

			<c:forEach items="${room_kinds}" var="kind" varStatus="status">
			
				<c:choose>
					<c:when test="${kind eq '아파트'}">
						room_kind_icon = new google.maps.MarkerImage("resources/assets/icon/map/apartIcon.png", null, null, null, new google.maps.Size(40,40));
						
						marker = new google.maps.Marker({
					         position: new google.maps.LatLng(${xcordinate[status.index]}, ${ycordinate[status.index]}),
					         map: map,
					         icon: room_kind_icon,
					      });
					      
					      google.maps.event.addListener(marker, 'click', (function(marker) {
					         return function() { 
					            sendNumGet('./info', ${o_id[status.index]});
					         } 
					      })(marker));
					</c:when>
					<c:when test="${kind eq '원룸'}">
						room_kind_icon = new google.maps.MarkerImage("resources/assets/icon/map/oneroomIcon.png", null, null, null, new google.maps.Size(40,40));

						marker = new google.maps.Marker({
					         position: new google.maps.LatLng(${xcordinate[status.index]}, ${ycordinate[status.index]}),
					         map: map,
					         icon: room_kind_icon,
					      });
					      
					      google.maps.event.addListener(marker, 'click', (function(marker) {
					         return function() { 
					            sendNumGet('./info', ${o_id[status.index]});
					         } 
					      })(marker));
					</c:when>
					<c:when test="${kind eq '오피스텔'}">
					room_kind_icon = new google.maps.MarkerImage("resources/assets/icon/map/officeIcon.png", null, null, null, new google.maps.Size(40,40));

					marker = new google.maps.Marker({
				         position: new google.maps.LatLng(${xcordinate[status.index]}, ${ycordinate[status.index]}),
				         map: map,
				         icon: room_kind_icon,
				      });
				      
				      google.maps.event.addListener(marker, 'click', (function(marker) {
				         return function() { 
				            sendNumGet('./info', ${o_id[status.index]});
				         } 
				      })(marker));
				</c:when>
				<c:when test="${kind eq '투룸'}">
					room_kind_icon = new google.maps.MarkerImage("resources/assets/icon/map/tworoomIcon.png", null, null, null, new google.maps.Size(40,40));

					marker = new google.maps.Marker({
				         position: new google.maps.LatLng(${xcordinate[status.index]}, ${ycordinate[status.index]}),
				         map: map,
				         icon: room_kind_icon,
				      });
				      
				      google.maps.event.addListener(marker, 'click', (function(marker) {
				         return function() { 
				            sendNumGet('./info', ${o_id[status.index]});
				         } 
				      })(marker));
				</c:when>
				</c:choose>

			</c:forEach>
		}

		// 마커 클릭시 get방식으로 매물번호 info에 넘겨주기
		// 새창으로 넘기기
		function sendNumGet(url, o_id) {

		   var form = document.createElement('form');
		   form.setAttribute('method','get');
		   form.setAttribute('action', url);
		   form.setAttribute('target', '_blank');
		   document.charset = "utf-8";
		   
		   var hiddenField = document.createElement("input");
		   hiddenField.setAttribute('type','hidden');
		   hiddenField.setAttribute('name','o_id');
		   hiddenField.setAttribute('value',o_id);
		   form.appendChild(hiddenField);
		   
		   document.body.appendChild(form);
		   form.submit(); //전송하기
		   
		}

		// 현재위치 검색 시 에러 잡아주는 함수
		function handleLocationError(browserHasGeolocation, infoWindow, pos) {
		   infoWindow.setPosition(pos);
		   infoWindow.setContent(
		      browserHasGeolocation
		      ? "Error: The Geolocation service failed."
		      : "Error: Your browser doesn't support geolocation."
		   );
		   infoWindow.open(map);
		}

		
	</script>
	</body>
</html>