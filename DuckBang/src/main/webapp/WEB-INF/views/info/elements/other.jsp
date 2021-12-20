<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="${pageContext.request.contextPath}/resources/assets/css/info/other.css" rel="stylesheet" type="text/css"/>

<div class="other">
	<h1>이 중개사무소의 다른 방</h1>
	<ul>
		<c:forEach begin="0" end="3" var="i">
			<li class="other_li">
				<div>
					<div>
						<button class="other_like_btn"></button>
					</div>
					<a href="./info?o_id=${InfoOther[i].o_id }" class="other_a">
						<div class="other_img">
							<img src="${InfoOther[i].image_1}"/>
							<div class="other_img_1"></div>
						</div>
						<div class="other_details">
							<p class="other_details_p1">${InfoOther[i].od_room_kind}</p>
							<h1 class="other_details_h1">
								${InfoOther[i].ok_code}
								<c:choose>
									<c:when test="${InfoOther[i].ok_code eq '월세'}">
										${InfoOther[i].ok_deposit}/${InfoOther[i].ok_month_of_payment}
									</c:when>
									<c:when test="${InfoOther[i].ok_deposit % 10000 == 0}">
										${Math.round(InfoOther[i].InfoOther[i]/10000)}억
									</c:when>	
									<c:when test="${InfoOther[i].ok_deposit >= 10000}">
										${Math.round(InfoOther[i].ok_deposit/10000)}억${InfoOther[i].ok_deposit % 10000}
									</c:when>
									<c:otherwise>
										${InfoOther[i].ok_deposit}
									</c:otherwise>										
								</c:choose>
							</h1>
							<p class="other_details_p2">${InfoOther[i].od_apply_floor}층, ${InfoOther[i].od_private_area}m², 관리비 ${InfoOther[i].ok_maintenance_cost }만</p>
							<p class="other_details_p2">입주가능일: ${InfoOther[i].od_occupy_date}</p>
							<div class="other_details_div1"></div>
						</div>
					</a>	
				</div>
			</li>
		</c:forEach>
	</ul>
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
               
	for(var i=0; i<=3; i++){
		interest_btn[i] = document.getElementsByClassName('other_like_btn')[i];
		interest_btn[i].addEventListener("click", add_interest);
	}

	var index = 0;
	<c:forEach items="${InfoOther}" var="infoOther"> 
		if(index < 4){
			interest_btn[index].setAttribute("value", "${infoOther.o_id}");
			interest_btn_values[index] = "${infoOther.o_id}";
			interest_btn[index].style.backgroundImage = "url('https://cdn.discordapp.com/attachments/895995335292370949/904688143884767252/1.png')";
			interest_btn[index].style.backgroundSize = "cover";
			interest_btn[index].style.color = "white";
		}      
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