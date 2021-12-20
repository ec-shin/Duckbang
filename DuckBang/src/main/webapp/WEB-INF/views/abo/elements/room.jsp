<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/abo/room.css" type="text/css" />
<div class="room">
	<div class="room_div1">
		<p class="room_div1_p1">
			이 부동산의 방
			<span>(${AboRoom.size()})</span>
		</p>
	</div>
	
	<ul class="room_ul1">
		<c:forEach items="${AboRoom}" var="AboRoom">
			<li>
				<div class="room_ul1_div1">
					<div>
						<button class="room_like_btn"></button>
					</div>			
				</div>
				<a href="./info?o_id=${AboRoom.o_id}" class="room_ul1_a1">
					<div class="room_ul1_div2">
						<div class="room_ul1_div3">
							<img src="${AboRoom.image_1}">
						</div>
						<div class="room_ul1_div4"></div>
					</div>
					<div class="room_ul1_div5">
						<p class="room_ul1_p1">${AboRoom.od_room_kind}</p>
						<h1 class="room_ul1_h1">
							${AboRoom.ok_code}
								<c:choose>
									<c:when test="${AboRoom.ok_code eq '월세'}"> 
										${AboRoom.ok_deposit}/${AboRoom.ok_month_of_payment}
									</c:when>
									<c:when test="${AboRoom.ok_deposit % 10000 == 0}">
										${Math.round(AboRoom.ok_deposit/10000)}억
									</c:when>	
									<c:when test="${AboRoom.ok_deposit >= 10000}">
										${Math.round(AboRoom.ok_deposit/10000)}억${AboRoom.ok_deposit % 10000}
									</c:when>
									<c:otherwise>
										${AboRoom.ok_deposit}
									</c:otherwise>						
								</c:choose>
						</h1>
						<p class="room_ul1_p2">${AboRoom.od_apply_floor}층, ${AboRoom.od_private_area}m², 관리비 ${AboRoom.ok_maintenance_cost}만</p>
						<p class="room_ul1_p2">입주가능일 ${AboRoom.od_occupy_date}</p>
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
	var user_cookie;
   
	user_cookie = getCookie('user_id')
	var userDate = new Date();
   
	function add_interest(){
		if(user_cookie == ''){
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

	var index = 0;
	<c:forEach items="${AboRoom}" var="aboRoom"> 
		interest_btn[index] = document.getElementsByClassName('room_like_btn')[index];
		interest_btn[index].addEventListener("click", add_interest);
		
		interest_btn[index].setAttribute("value", "${aboRoom.o_id}");
		interest_btn_values[index] = "${aboRoom.o_id}";
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