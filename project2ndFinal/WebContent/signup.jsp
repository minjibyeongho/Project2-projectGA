<%@page import="bean.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- bootstrap CDN -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</head>
<body>

<jsp:useBean id="dto" class="bean.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>


<%

	String command = request.getParameter("command");
	 System.out.println(command);
	String mess = "";

	MemberDAO dao = new MemberDAO();
	// signup.html에서 오는 것과 memberinfo에서 오는 것을 동시에 처리 할 수 있도록 설계하면?? 헷갈릴꺼...같은데?(처리 완료)
	if(command.equals("insert")){
		dao.Insert(dto);
		mess = "회원가입 완료!";
	}else if(command.equals("update")){
		dao.Update(dto);
		out.write("회원 수정 완료!");
		mess = "회원 수정 완료!";
	}else if(command.equals("delete")){
		dao.Delete(dto);
		mess = "탈퇴 완료...!";
	}

%>


<%= mess %>

<form action="memberinfo.jsp">
	<input type="hidden" name="id" value=<%=dto.getId() %>>
	<button type="submit" class="btn btn-primary">가입 정보 보러가기</button>
</form>

<form action="index.html">
	<button type="submit" class="btn btn-primary">ProjectGA로</button>
</form>


</body>
</html>