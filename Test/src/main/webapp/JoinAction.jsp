<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<% request.setCharacterEncoding("utf-8"); %> 
<jsp:useBean id="user" class="user.User" scope="page" >
<jsp:setProperty name="user" property="name" /> 
<jsp:setProperty name="user" property="id" /> 
<jsp:setProperty name="user" property="pw" />
</jsp:useBean>

<!--
	page import="java.io.PrintWriter" //자바스크립트 사용하기 위함
	page import="user.UserDAO" //우리가 만든 클래스 사용
	page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" //넘어온 데이터 한글깨짐 방지
	jsp:useBean id="user" class="user.User" scope="page" //User클래스를 자바빈즈로써 사용
	jsp:setProperty name="user" property="id" //로그인 페이지에서 받아온 id를 'id'에 저장
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>LOGIN</title>
</head>
<body>
	<%
		String userid = null;
		if(session.getAttribute("id") != null){
			userid = (String) session.getAttribute("id");
		}
	
		if(userid != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 되어있습니다')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
		if(user.getName()==null || user.getId() == null || user.getPw() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력 안된 정보가 있습니다')");
			script.println("history.back()");
			script.println("</script>");
		}else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입 성공')");
				script.println("location.href='login.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>
