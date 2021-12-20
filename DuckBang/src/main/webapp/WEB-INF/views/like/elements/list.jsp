<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/like/list.css" type="text/css" />
<div class="room">
	<div class="room_div1">
		<p class="room_div1_p1">
			내가 찜한 방 목록
			<span class = "room_size">(${likeRoom.size()}개)</span>
		</p>
	</div>
	<ul class="room_ul1">
		<c:forEach items="${likeRoom}" var="likeRoom">
			<li class="room_li">
				<div class="room_ul1_div1">
					<div>
						<button class="room_like_btn"></button>
					</div>			
				</div>
				<a href="./info?o_id=${likeRoom.o_id}" class="room_ul1_a1">
					<div class="room_ul1_div2">
						<div class="room_ul1_div3">
							<img src="${likeRoom.image_1}">
						</div>
						<div class="room_ul1_div4"></div>
					</div>
					<div class="room_ul1_div5">
						<p class="room_ul1_p1">${likeRoom.od_room_kind}</p>
						<h1 class="room_ul1_h1">
							${likeRoom.ok_code}
								<c:choose>
									<c:when test="${likeRoom.ok_code eq '월세'}"> 
										${likeRoom.ok_deposit}/${likeRoom.ok_month_of_payment}
									</c:when>
									<c:when test="${likeRoom.ok_deposit % 10000 == 0}">
										${Math.round(likeRoom.ok_deposit/10000)}억
									</c:when>	
									<c:when test="${likeRoom.ok_deposit >= 10000}">
										${Math.round(likeRoom.ok_deposit/10000)}억${likeRoom.ok_deposit % 10000}
									</c:when>
									<c:otherwise>
										${likeRoom.ok_deposit}
									</c:otherwise>						
								</c:choose>
						</h1>
						<p class="room_ul1_p2">${likeRoom.od_apply_floor}층, ${likeRoom.od_private_area}m², 관리비 ${likeRoom.ok_maintenance_cost}만</p>
						<p class="room_ul1_p2">입주가능일 ${likeRoom.od_occupy_date}</p>
					</div>
				</a>
			</li>
		</c:forEach>
	</ul>
	<!-- 버튼 리스트는 추후 DB만들면서 -->
</div>

<script>
	var interest_btn = new Array();
	var interest_btn_values = new Array();
	var room_li = new Array();
	var user_cookie;
   
	user_cookie = getCookies('user_id')
	var userDate = new Date();
   
	const room_li_li = document.getElementsByClassName('room_li');
	
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
			
			xhttp.open('POST','/room/deleteInterest', true);
			xhttp.setRequestHeader('content-type','application/json;charset=EUC-KR');
			xhttp.send(JSON.stringify(interest));
	            
			xhttp.addEventListener('readystatechange', (e)=>{
				for(var i=0; i< room_li.length; i++){
					if(room_li[i].value == this.value){
						room_li[i].remove();
					}
				}

				
				room_size = document.getElementsByClassName('room_size')[0];
				room_size.innerText = "("+room_li_li.length + "개)";
				
			});
			
		}
	}
               

	var index = 0;
	<c:forEach items="${likeRoom}" var="likeRoom"> 
		room_li[index] = document.getElementsByClassName('room_li')[index];
		room_li[index].setAttribute("value", "${likeRoom.o_id}");
		interest_btn[index] = document.getElementsByClassName('room_like_btn')[index];
		interest_btn[index].addEventListener("click", add_interest);
		interest_btn[index].setAttribute("value", "${likeRoom.o_id}");
		interest_btn_values[index] = "${likeRoom.o_id}";
		interest_btn[index].style.backgroundImage = "url('https://cdn.discordapp.com/attachments/895995335292370949/904688143884767252/1.png')";
		interest_btn[index].style.backgroundSize = "cover";
		interest_btn[index].style.color = "white";    
		index++;
	</c:forEach>
   
	if(user_cookie != null){
		<c:forEach items="${interest_list}" var="interest_list">
			if(user_cookie == "${interest_list.u_id}"){
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

</script>









