
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
         
         // ???????????? ????????? ??? ???????????????
         var latitude = place.geometry.location.lat();   // ??????
         var longitude = place.geometry.location.lng();   // ??????

         const citymap = {
            center: { lat: latitude, lng: longitude},
         };
         
         // ????????? ?????????????????? ??????
         if(cityCircle) {
            cityCircle.setMap(null);
         }
         
         // ?????? ??????????????? ????????? ?????? ????????????
         google.maps.event.addListener(map, 'drag', () => {
            cityCircle.setMap(null);
            for(var idx = 0; idx < markers.length; idx++) {
                markers[idx].setMap(null);
            }
         });

         // Add the circle for this city to the map.
         // ????????? var cityCircle????????????
         cityCircle = new google.maps.Circle({
            strokeColor: "gray",   // ?????? ???
            strokeOpacity: 0.8,      // ?????? ????????????
            strokeWeight: 2,      // ?????? ??????
            fillColor: "gray",      // ????????? ??????
            fillOpacity: 0.35,      // ????????? ????????????
            map,               // ????????? ?????? ??????
            center: citymap.center,   // ?????? ????????????
            radius: 500,         // ?????? ????????? (??????: ??????)
         });
            // ???????????? ???????????? ????????? ????????? ?????????
      });
      map.fitBounds(bounds);

   });
  
   // ?????? ?????? ????????????
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
         
         // ?????? ????????? ?????? ???????????????
         new google.maps.Marker({
             position: pos,
             map,
             title: "?????? ??????", // ????????? mouseover????????? ????????? ???
             icon: image,
           });
         
         //infoWindow.setPosition(pos);
         //infoWindow.setContent("<div style='background-color: black;'>????????????</div>");
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
   // ???????????? ?????? ?????? ????????????

   //????????? ?????? ??????
   makeMarkers(map);
}


// ???????????? ????????? ??????
function makeMarkers(map) {

   // location??????????????? x??????, y?????? ?????????
   const xcordinate = document.getElementById("value_xcordinate").value;      // x??????
   const ycordinate = document.getElementById("value_ycordinate").value;      // y??????
   const o_id = document.getElementById("value_o_id").value;               // ????????????

   // ????????? ???????????????
   let x_slice = xcordinate.slice(1, -1);
   let x_array = x_slice.split(',');

   let y_slice = ycordinate.slice(1, -1);
   let y_array = y_slice.split(',');
   
   let id_slice = o_id.slice(1, -1);
   let id_array = id_slice.split(',');
   
   var locations = [];
   
   // locations ????????? x??????, y??????, ???????????? ????????????
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
   
   // ?????? ????????????
   addMarker(locations, map);
}

// ?????? ?????? ??????
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

// ?????? ????????? get???????????? ???????????? info??? ????????????
// ???????????? ?????????
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
   form.submit(); //????????????
   
}

// ???????????? ?????? ??? ?????? ???????????? ??????
function handleLocationError(browserHasGeolocation, infoWindow, pos) {
   infoWindow.setPosition(pos);
   infoWindow.setContent(
      browserHasGeolocation
      ? "Error: The Geolocation service failed."
      : "Error: Your browser doesn't support geolocation."
   );
   infoWindow.open(map);
}
