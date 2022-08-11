<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<% request.setCharacterEncoding("utf-8"); %> 
<jsp:useBean id="user" class="user.User" scope="page" /> 
<jsp:setProperty name="user" property="id" /> 
<jsp:setProperty name="user" property="pw" />
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
			script.println("location.href='index.jsp'");
			script.println("</script>");
		}
		
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getId(), user.getPw());
		if(result == 1){
			session.setAttribute("id", user.getId());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 성공')");
			script.println("location.href='index.jsp'");
			script.println("</script>");
		}else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류입니다')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>