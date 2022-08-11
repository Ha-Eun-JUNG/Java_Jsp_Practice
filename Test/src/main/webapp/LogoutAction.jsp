<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>LOGOUT</title>
</head>
<body>
	<%
		session.invalidate();
	%>
	<script>
		alert("로그아웃");
		location.href="index.jsp";
	</script>
</body>
</html>
