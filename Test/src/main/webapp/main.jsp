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
		//���� �������� �̵����� �� ���ǿ� ���� ����ִ��� üũ
		String userid = null;
		if(session.getAttribute("id") != null){
			userid = (String) session.getAttribute("id");
		}
		
		if(userid == null){
	%>
	<button type="button" onclick = "location.href ='join.jsp'">ȸ������</button>
	<button type="button" onclick = "location.href ='login.jsp'">�α���</button>	
	<%
		}
		else{
	%>
	<button type="button" onclick = "location.href ='login.jsp'">�α���</button>	
	<%
		}
	%>
</body>
</html>