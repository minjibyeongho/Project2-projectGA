<%@page import="bean.BoardDAO"%>
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
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int num = Integer.parseInt(request.getParameter("num"));
		
		
		BoardDAO dao = new BoardDAO();
		dao.Update(title, content, num);
	%>
		<script type="text/javascript">
			alert("입력한 글을 저장하였습니다.");
			location.href="boardlist.jsp"; 
		</script>
</body>
</html>