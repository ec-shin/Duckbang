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
 	point.style.left = 150 + "px";
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
 	point.style.left = 300 + "px";
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
 	point.style.left = 450 + "px";
 });
 
 
 
 
 
 