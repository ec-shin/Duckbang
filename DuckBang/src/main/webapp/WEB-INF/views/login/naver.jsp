<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
    src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
    charset="utf-8"></script>
<script type="text/javascript"
    src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<form id="toMain">

</form>
<script type="text/javascript">
	

	
$(document).ready(function() {
    const setCookie = function (name, value, expiredDay) { 
        const expired = new Date(); 
        expired.setTime(expired.getTime() + expiredDay * 24 * 60 * 60 * 1000); 
        document.cookie = name + '=' + encodeURIComponent(value) + ';expires=' + expired.toUTCString() + ';path=/'; 

    };

    const main_form = document.getElementById("toMain");

    var name = ${result}.response.name;
    var email = ${result}.response.email;

    setCookie("user_id", email, 1);
    //location.href = "./main";
    main_form.setAttribute("method","POST");
    main_form.setAttribute("action","./main");
    main_form.submit();
  });

    

</script>

</body>
</html>















