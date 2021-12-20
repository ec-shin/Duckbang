<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<script>

	const setCookie = function (name, value, expiredDay) { 
		const expired = new Date(); 
		expired.setTime(expired.getTime() + expiredDay * 24 * 60 * 60 * 1000); 
		document.cookie = name + '=' + encodeURIComponent(value) + ';expires=' + expired.toUTCString() + ';path=/'; 
	
	};	
	
    setCookie("user_id", "${email}", 1);
	location.href = "./main";

</script>
</body>
</html>