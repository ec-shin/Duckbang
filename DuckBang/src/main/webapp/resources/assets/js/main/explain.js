 const slide = document.getElementById("info_slide");
 const next = document.getElementById("next_point");
 const prev = document.getElementById("prev_point");
 
 next.addEventListener("click", function(e){
 	slide.style.right = 468 + "px";
 });
 
 prev.addEventListener("click", function(e){
 	slide.style.right = 0	 +"px"; 
 });