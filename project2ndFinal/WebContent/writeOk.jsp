<%@page import="bean.BoardDAO"%>
<%@page import="bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

%>
<jsp:useBean id="dto" class="bean.BoardDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<!-- dto에는 boardAdd에서 title, bpw, bid, content가 넘어오고, datetime은 알아서 넣어줌 -->
<!-- 글쓰기 DB처리 페이지
	insert, update, delete,  -->
	
<%
	BoardDAO dao = new BoardDAO();
	dao.Insert(dto);
%>
	<script language=javascript>
	alert("입력한 글을 저장하였습니다.");
	location.href="boardlist.jsp"; 
	</script>




</body>
</html>