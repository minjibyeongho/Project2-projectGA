<%@page import="bean.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dto" class="bean.CommentDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<!-- commentdto에는 cid, bnum, comment 값이 들어있다 -->

<%
	CommentDAO dao = new CommentDAO();
	dao.Insert(dto);
	// insert 완료
	

%>

</body>
</html>