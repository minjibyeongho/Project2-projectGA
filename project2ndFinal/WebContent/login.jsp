<%@page import="bean.MemberDAO"%>
<%@page import="bean.MemberDTO"%>
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

	<!-- bootstrap CDN -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

	<!-- JQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>	<!-- jquery이용하기 위한 -->

	<script type="text/javascript">
	
	
	
	
	function checkValue(){	//아이디와 비밀번호가 입력되어 있는지 여부 확인
		if(!document.log.id.value){	//document 접근 순서 form name(log) -> td name
			alert("아이디를 입력하세요!")
			return false;
		}
		
		if(!document.log.pw.value){
			alert("비밀번호를 입력하세요!")
			return false;
		}
	}
	
	</script>
</head>

<body>
<jsp:useBean id="dto" class="bean.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="index.html">Project GA</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              	여행지	<!-- Blog, 김민중 - 나의 여행계획(blog 형식의 틀로 잡혀있는 것, 지도를 끌어와 위치를 찍을 수 있으면 좋을듯함 -->
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <a class="dropdown-item" href="place.html">지역별 여행지</a>
              <a class="dropdown-item" href="theme.html">테마별 여행지</a>
              <a class="dropdown-item" href="member.html">멤버별 여행지</a>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="boardlist.jsp">게시판</a>	<!-- 게시판, Services -->
          </li>
          <li class="nav-item">
            <a class="nav-link" href="blog-home-1.jsp">나의 여행계획</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             	 추천사이트
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <a class="dropdown-item" href="crawling.jsp">경기 명소1</a>	<!-- 추가 메뉴(필요시 삭제) -->
              <a class="dropdown-item" href="crawling2.jsp">경기 명소2</a>		<!-- Sidebar Page, 추천사이트로 이용하는게 좋을듯 현재는 HTML에 있는 페이지로 연결되어 있는 것을 각 추천 여행 사이트로 연결 -->
            </div>
          </li>
        </ul>
      </div>
    </div>
  </nav>	<!-- 메뉴 끝! -->


<%
/* String text = "홍길동" ;

// 전송 문자 UTF-8 인코딩
string encText = URLEncoder.encode(text, "UTF-8") ; */

	/* String id = document.log.id.value; */
	
	String message = request.getParameter("message");
	
	// id, pw 유효성 검사
	if(message== null){
		message = "";	
	}else if(message.equals("pwfail")){
		message = "비밀번호를 확인해주세요!";
	}else if(message.equals("idfail")){
		message = "아이디를 확인해주세요!";
	}else{
		message = "아이디와 비밀번호를 확인해주세요!";
	}
	
	String findmessage = request.getParameter("findmessage");
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto1 = null;
	
	// id, pw 찾기
	String fmessage = "";
	if(findmessage==null){
		fmessage="";
	}else if(findmessage.equals("findid")){
		// id 찾기 넘어 갔다옴 parameter(name, tel)
		dto1 = dao.FindID(dto);
		fmessage = dto1.getName()+"님의 ID : "+ dto1.getId();
	}else{
		// pw 찾기 넘어 갔다옴 parameter()
		dto1 = dao.FindPW(dto);
		fmessage = dto1.getId()+"님의 PW : "+dto1.getPw();
	}

%>

  <div class="container">
  	<br>
  	<br>
  	<h1 class="my-4" align="center">로그인 페이지</h1>
	<div class="row">
    	<div class="col-lg-4">

    	</div>

    	<div class="col-lg-4">
    		
		<form name="log" action="logincheck.jsp" onsubmit="return checkValue()">
    		<table>
    		
	    			<tr align="center">
	    				<td colspan="3">
			     			<input type="text" name="id" id="id" placeholder="아이디"><br>
			     		</td>
			     	</tr>
			     	
			     	<tr align="center">
			     		<td>
			     			<input type="password" name="pw" id="pw" placeholder="비밀번호"><br>
			     		</td>
			     	</tr>

			     	<tr>
				     	<!-- 아이디, 비밀번호 찾기 -->
				     	<td>
	    				<a href="findid.jsp">아이디</a>/<a href="findpw.jsp">비밀번호</a> 찾기
	    				</td>
			     	</tr>
			     	<tr>
			     		<td>
		     				<button type="submit">로그인</button>
		     				
			     		</td>
	    			</tr>
	    			<tr>
	    				<td>
	    					<%= message %><%= fmessage %>
	    				</td>
	    			</tr>
	    			
	    	</table>
   		</form>
    		
    	</div>
    		
    	<div class="col-lg-4">
    	</div>
    </div>	<!-- row end -->
 </div>	<!-- container end -->   
    



</body>
</html>