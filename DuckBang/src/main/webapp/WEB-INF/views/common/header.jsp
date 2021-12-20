<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/common/header.css">

<div id="header_area">
<!-- 
   <h3># header.jsp</h3>
-->
      <form id="headerForm">
         <input id="headerInput" type="hidden" name="room_kind" />
      </form>
        <div id="navi_flex">
           <a href="${pageContext.request.contextPath }/main" style="cursor: pointer;">
               <div id="header_area_logo">
               </div>
            </a>
            <div>
                <ul id="header_area_top_menu">
                    <li id="apart">
                        <span>아파트 </span> <br>
                        <span id="header_area_small">매매/전월세/신축분양</span>
                        <div class="header_area_sub_menu">
                            <a class=" ">매매/전·월세</a><br>
                            <a class=" ">신축분양</a><br>
                            <a class=" ">인구흐름</a><br>
                        </div>
                    </li>
                    <li id="tworoom">
                        <span>빌라, 투룸</span><br>
                        <span id="header_area_small">신축분양/매매/전월세</span>
                        <div class="header_area_sub_menu">
                            <a class=" ">빌라, 투룸 찾기</a><br>
                            <a class=" ">찜한 매물</a><br>
                            <a class=" ">빌라 내놓기(전월세만)</a><br>
                        </div>
                    </li>
                    <li id="oneroom">
                        <span>원룸</span><br>
                        <span id="header_area_small">전월세</span>
                        <div class="header_area_sub_menu">
                            <a class=" ">방 찾기</a><br>
                            <a class=" ">찜한 매물</a><br>
                            <a class=" ">방 내놓기(전월세만)</a><br>
                        </div>
                    </li>
                    <li id="office">
                        <span>오피스텔</span><br>
                        <span id="header_area_small">도시형생활주택/전월세</span>
                        <div class="header_area_sub_menu">
                            <a class=" ">오피스텔 찾기</a><br>
                            <a class=" ">찜한 매물</a><br>
                            <a class=" ">오피스텔 내놓기(전/월세만)</a><br>
                        </div>
                    </li>
                     <li id="all">
                        <span>지도</span><br>
                        <span id="header_area_small">모든 항목</span>
                        <div class="header_area_sub_menu">
                            <a class=" ">오피스텔 찾기</a><br>
                            <a class=" ">찜한 매물</a><br>
                            <a class=" ">오피스텔 내놓기(전/월세만)</a><br>
                        </div>
                    </li>
                </ul>
            </div>
            <div id="login_area">
            	<c:choose>
            		<c:when test="${empty cookie.user_id.value }">
               			<button type="button" class="login_btn" style="vertical-align: middle;" onclick="location.href='${pageContext.request.contextPath }/login'">로그인 및 회원가입</button>
               		</c:when>
               		<c:when test="${not empty cookie.user_id.value }">
               			<div class="user_menu">
               				<ul>
               				<li><p id="current"></p>
  								<ul style="width: 100px">
               						<li style="margin-left:20px; width: 100px"><a href="${pageContext.request.contextPath }/like">찜목록</a></li>
          						 	<li style="margin-left:20px; width: 100px"><a href="${pageContext.request.contextPath }/realtor">방내놓기</a></li>
            						<li style="margin-left:20px; width: 100px"><a onclick="deleteCookie('user_id', '', 0)">로그아웃</a></li>
               					</ul>
               				</ul>
               			</div>
               		</c:when>
               	</c:choose>
           </div>
           <div id="seller_join">
              <p id="seller_join_inner" style="vertical-align: middle;">
                 중개사무소 가입 <br>
                 및 광고문의
              </p>
           </div>
        </div>  
</div>

<script>
	const headerForm = document.getElementById('headerForm');
	const headerInput = document.getElementById('headerInput');
	const headerApart = document.getElementById('apart');
	const headerTwo = document.getElementById('tworoom');
	const headerOne = document.getElementById('oneroom');
	const headerOffice = document.getElementById('office');
	const headerAll = document.getElementById('all');
	headerApart.addEventListener('click', () => {
		headerInput.value = 'apart';
		headerApart.style.color = 'rgb(6, 73, 192)';
		headerForm.action = './map';
		headerForm.method = 'GET';
		headerForm.submit();
	});
	headerTwo.addEventListener('click', () => {
		headerInput.value = 'tworoom';
		headerTwo.style.color = 'rgb(6, 73, 192)';
		headerForm.action = './map';
		headerForm.method = 'GET';
		headerForm.submit();
	});
	headerOne.addEventListener('click', () => {
		headerInput.value = 'oneroom';
		headerOne.style.color = 'rgb(6, 73, 192)';
		headerForm.action = './map';
		headerForm.method = 'GET';
		headerForm.submit();
	});
	headerOffice.addEventListener('click', () => {
		headerInput.value = 'office';
		headerOffice.style.color = 'rgb(6, 73, 192)';
		headerForm.action = './map';
		headerForm.method = 'GET';
		headerForm.submit();
	});
	headerAll.addEventListener('click', () => {
		headerInput.value = 'all';
		headerAll.style.color = 'rgb(6, 73, 192)';
		headerForm.action = './map';
		headerForm.method = 'GET';
		headerForm.submit();
	});
	
	const current = document.getElementById('current');
	const getCookies = function (name) { 
	   var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)'); 
	   return value ? decodeURIComponent(value[2]) : null; 
	};
	
	console.log(getCookies("user_id"));
	
	var user_cookie = getCookies("user_id");
	if(user_cookie != null){
		var index = (user_cookie.indexOf('@'));
		var user = user_cookie.substr(0,index);
		current.innerText = user;
	}
	
	const apart = document.getElementById('apart');
    const tworoom = document.getElementById('tworoom');
    const oneroom = document.getElementById('oneroom');
    const office = document.getElementById('office');
    const all = document.getElementById('all');

     const url = new URL(window.location.href);

     const urlParams = url.searchParams;

     const nowParam = urlParams.get('room_kind');


     if (nowParam == 'apart') {
        apart.style.color = 'rgb(6, 73, 192)';
        tworoom.style.color = 'black';
        oneroom.style.color = 'black';
        office.style.color = 'black';
        all.style.color = 'black';
     }

     if (nowParam == 'tworoom') {
            apart.style.color = 'black';
            tworoom.style.color = 'rgb(6, 73, 192)';
            oneroom.style.color = 'black';
            office.style.color = 'black';
            all.style.color = 'black';
     }

     if (nowParam == 'oneroom') {
            apart.style.color = 'black';
            tworoom.style.color = 'black';
            oneroom.style.color = 'rgb(6, 73, 192)';
            office.style.color = 'black';
            all.style.color = 'black';
     }

     if (nowParam == 'office') {
            apart.style.color = 'black';
            tworoom.style.color = 'black';
            oneroom.style.color = 'black';
            office.style.color = 'rgb(6, 73, 192)';
            all.style.color = 'black';
     }

     if (nowParam == 'all') {
            apart.style.color = 'black';
            tworoom.style.color = 'black';
            oneroom.style.color = 'black';
            office.style.color = 'black';
            all.style.color = 'rgb(6, 73, 192)';
     }
	
     function getCookie(cName) {
         cName = cName + '=';
         var cookieData = document.cookie;
         var start = cookieData.indexOf(cName);
         var cValue = '';
         if(start != -1){
         start += cName.length;
         var end = cookieData.indexOf(';', start);
         if(end == -1)end = cookieData.length;
         cValue = cookieData.substring(start, end);
         }
         return unescape(cValue);
     }
     
     const deleteCookie = function (name, value, expiredDay) {
    	 const expired = new Date();
    	 var checkEvent = getCookie("user_id");
    	 expired.setTime(expired.getTime() + expiredDay * 24 * 60 * 60 * 1000);              
    	 document.cookie = name + '=' + encodeURIComponent(checkEvent) + ';expires=' + expired.toUTCString() + ';path=/';
    	 window.location.reload();
   	 };

</script>