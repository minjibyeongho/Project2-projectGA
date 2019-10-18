<%@page import="java.util.ArrayList"%>
<%@page import="bean.MemberDTO"%>
<%@page import="bean.MemberDAO"%>
<!-- 한글 넘길 시 깨짐현상 방지용 보내는 쪽 Encoder 받는쪽 Decoder 걍 2개 다 써버리자; -->    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dto" class="bean.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<!-- dto는 login.jsp에서 넘어온 객체(id, pw만 가지고 있음) -->

<%
	MemberDAO dao = new MemberDAO();
	MemberDTO dbdto = dao.Select(dto);	/* dbdto는 dto(id값)을 가지고 검색해옴 */
	
	//id가 잘못들어왔을 경우 생기는 에러 확인(null point로 나오는데)
	
	// id, pw를 login.jsp에서 넘어온 parameter로 받음
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// 참고사항 : String.isEmpty() 메소드 : "", null일 경우 true를 반환
	// id, pw는 login.jsp에서 넘어온 변수들, dbdto에 저장된 변수들은 id로 검색하여 가져온 db에서 가져온 정보들
	// id가 잘못들어올 경우dbdto에는 잘못된 id값이 저장되어 있음....
	
	//id 유효성 검사
	String idcheck = dao.SelectId(id);
	
	if(id.equals(idcheck) && pw.equals(dbdto.getPw())){
		session.setAttribute("id", id);
		response.sendRedirect("index.jsp?id="+id);
	}else{
		if(idcheck == null){
			String message = "idfail";
			response.sendRedirect("login.jsp?message="+message);
		}else if(!pw.equals(dbdto.getPw())){
			String message = "pwfail";
			response.sendRedirect("login.jsp?message="+message);
		}else{
			String message = "allfail";
			response.sendRedirect("login.jsp?message="+message);
		}
	}
%>



</body>
</html>