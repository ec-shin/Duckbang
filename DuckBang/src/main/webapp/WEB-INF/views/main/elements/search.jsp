<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel = "stylesheet" href ="${pageContext.request.contextPath}/resources/assets/css/main/search.css">
<form id="searchForm" action="./map" method="POST" accept-charset="UTF-8">
	<input id="searchLat" type="hidden" name="lat"/>
	<input id="searchLong" type="hidden" name="lng"/>
	<input id="searchCheck" type="hidden" name="check"/>
</form>
<div class = "h01_bg css-search1">
	<div class = "h01_slide css-search1">
		<div class = "h01_slide-1 css-search1-1 f01_search">어떤 집을 찾고 계세요?</div>
	</div>
	<div class = "h01_searchBar css-search1">
		<div id="searchBar" class = "h01_searchBar-1 css-search1">
			<div class = "h01_searchBar-1_options css-search1">
				<div  id = "point" class = "h01_searchBar-1_point css-search_option" dir="auto"></div>
				<div  class = "h01_searchBar-1_option css-search_option">
					<span id = "apt" class = "option_name css-search_option">아파트</span>
				</div>
				<div  class = "h01_searchBar-1_option css-search_option">
					<span id = "villa" class = "option_name css-search_option">빌라,투룸+</span>
				</div>
				<div  class = "h01_searchBar-1_option css-search_option">
					<span id = "studioApt" class = "option_name css-search_option">원룸</span>
				</div>
				<div  class = "h01_searchBar-1_option css-search_option">
					<span id = "officetel" class = "option_name css-search_option">오피스텔</span>
				</div>
			</div>
			<div class = "h01_searchBar-2 css-search1">
				<div class = "searchBar-input css-search1">
					<input id="pac-input" type="text" placeholder="원하시는 지역명을 입력해주세요" class = "css-input_text">
				</div>
				<div id = "searchInfoBtn" class = "searchBar-icon css-search1">
					<img alt="ê²ì" src="https://s.zigbang.com/v1/web/main/ic_search.png" class = "icon-style">
					<div class = "searchBar-icon_01 css-search1">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="map" style="display:none"></div>
<script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCO1eRP2ExsPqAhGnAd2H6FO2Zo2dIefYE&callback=initMap&libraries=places&v=weekly&region=kr"
      async
></script>
<script>
var check = 1;
   var latitude;
   var longitude;
   var cityCircle;
   var infoWindow;
   //var o_ids = [];  // 현재 위치에서 보이는 마커들의 매물번호 배열

   function initMap() {
      const map = new google.maps.Map(document.getElementById("map"), {
         center: {
            lat: 37.566826,
            lng: 126.9786567
         },
         zoom: 18,
         mapTypeControl: false,
         fullscreenControl: false,
         mapTypeId: "roadmap",
         options: {
            gestureHandling: 'greedy'
         }
      });
      
      // Create the search box and link it to the UI element.
      const input = document.getElementById("pac-input");
      const searchBox = new google.maps.places.SearchBox(input);

      map.controls[google.maps.ControlPosition.TOP_LEFT].push(searchBox);
     
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
            latitude = place.geometry.location.lat();   // 위도
            longitude = place.geometry.location.lng();   // 경도
            console.log("lat : " + latitude);
            console.log("long : " + longitude);	
            console.log("check : " + check);
         });
         map.fitBounds(bounds);
      });

   }
   
   const point = document.getElementById("point");
   const apt = document.getElementById("apt");
   const villa = document.getElementById("villa");
   const studioApt = document.getElementById("studioApt");
   const officetel = document.getElementById("officetel");
   
   apt.addEventListener("click", function(e){
   	apt.style.fontWeight = "bold";
   	apt.style.color = "#2D60A3";
   	villa.style.fontWeight = "normal";
   	villa.style.color = "#FFFFFF";
   	studioApt.style.fontWeight = "normal";
   	studioApt.style.color = "#FFFFFF";
   	officetel.style.fontWeight = "normal";
   	officetel.style.color = "#FFFFFF";
   	point.style.left = 0 + "px";
   	check = 1;
   });
   
   villa.addEventListener("click", function(e){
   	villa.style.fontWeight = "bold";
   	villa.style.color = "#2D60A3";
   	apt.style.fontWeight = "normal";
   	apt.style.color = "#FFFFFF";
   	studioApt.style.fontWeight = "normal";
   	studioApt.style.color = "#FFFFFF";
   	officetel.style.fontWeight = "normal";
   	officetel.style.color = "#FFFFFF";
   	point.style.left = 138 + "px";
   	check = 2;
   });
   
   studioApt.addEventListener("click", function(e){
   	studioApt.style.fontWeight = "bold";
   	studioApt.style.color = "#2D60A3";
   	apt.style.fontWeight = "normal";
   	apt.style.color = "#FFFFFF";
   	villa.style.fontWeight = "normal";
   	villa.style.color = "#FFFFFF";
   	officetel.style.fontWeight = "normal";
   	officetel.style.color = "#FFFFFF";
   	point.style.left = 287 + "px";
   	check = 3;
   });
   
   officetel.addEventListener("click", function(e){
   	officetel.style.fontWeight = "800";
   	officetel.style.color = "#2D60A3";
   	apt.style.fontWeight = "normal";
   	apt.style.color = "#FFFFFF";
   	villa.style.fontWeight = "normal";
   	villa.style.color = "#FFFFFF";
   	studioApt.style.fontWeight = "normal";
   	studioApt.style.color = "#FFFFFF";
   	point.style.left = 431 + "px";
   	check = 4;
   });
   
   const searchBtn = document.getElementById("searchInfoBtn");
   const form = document.getElementById("searchForm");
   const lat = document.getElementById("searchLat");
   const lng = document.getElementById("searchLong");
   const room_kind = document.getElementById("searchCheck");
   searchBtn.addEventListener("click", () => {
	   lat.value = latitude;
	   lng.value = longitude;
	   room_kind.value = check;
	   form.submit();
   });
</script>