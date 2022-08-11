<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JOIN</title>
</head>
<body>
 	<form method="post" action="JoinAction.jsp">
 		<p>회원가입</p>
 		<input type="text" placeholder="이름" name="name">
 		<input type="text" placeholder="아이디" name="id">
 		<input type="password" placeholder="비밀번호" name="pw">
 		<input type="submit" value="회원가입">
 	</form>
</body>
</html>