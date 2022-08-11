<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MAIN</title>
</head>
<body>
	<%
		//메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userid = null;
		if(session.getAttribute("id") != null){
			userid = (String) session.getAttribute("id");
		}
		
		if(userid == null){
	%>
	<button type="button" onclick = "location.href ='join.jsp'">회원가입</button>
	<button type="button" onclick = "location.href ='login.jsp'">로그인</button>	
	<%
		}
		else{
	%>
	<button type="button" onclick = "location.href ='login.jsp'">로그인</button>	
	<%
		}
	%>
</body>
</html>