
var cityCircle;
var infoWindow;

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
   let x_array = x_slice.split(',');

   let y_slice = ycordinate.slice(1, -1);
   let y_array = y_slice.split(',');
   
   let id_slice = o_id.slice(1, -1);
   let id_array = id_slice.split(',');
   
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
      console.log("o_ids: " + o_ids);
      getLists();

   });
   
   google.maps.event.addListener(map, 'dragend', function() {
      o_ids = [];
      
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

	getLists();
   });
   
   // 마커 추가해줌
   addMarker(locations, map);
}

// 마커 출력 함수
function addMarker(locations, map) {
   var i, marker;
   
   for(i = 0; i < locations.length; i++){
   
      marker = new google.maps.Marker({
         position: new google.maps.LatLng(locations[i][0], locations[i][1]),
         label: "1",
         map: map,
      });
      
      google.maps.event.addListener(marker, 'click', (function(marker, i) {
         return function() { 
            sendNumGet('./info', locations[i][2]);
         } 
      })(marker, i));
   }
}

// 마커 클릭시 get방식으로 매물번호 info에 넘겨주기
// 새창으로 넘기기
function sendNumGet(url, o_id) {

   var form = document.createElement('form');
   form.setAttribute('method','get');
   form.setAttribute('action', url);
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
