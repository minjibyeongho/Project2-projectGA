<%@page import="bean.BoardDTO"%>
<%@page import="bean.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Modern Business - Start Bootstrap Template</title>

	<!-- bootstrap CDN -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">
<%
	int idx = Integer.parseInt(request.getParameter("num"));
	// 게시글 번호를 idx에 가져옴
	BoardDAO dao = new BoardDAO();
	BoardDTO dbdto = dao.Select(idx);
	
		  

%>

	<script>
		var bpw = "<%= dbdto.getBpw() %>";
		
		
		function deleteCheck()
		{
		   var form = document.deleteform;
		   //확인
		   console.log(bpw);
		   console.log(form.password.value);
		   
		   
		   if( !form.password.value){
		    alert( "비밀번호를 적어주세요" );
		    form.password.focus();	//그 부분으로 이동
		    return;
		    
		   }else{
			   if(form.password.value == bpw){
				   	alert("해당 게시물을 삭제하였습니다.");
				   	<%
				   		dao.Delete(idx);
				   	%>
				   	location.href="boardlist.jsp";
			   }else{
				   alert("비밀번호가 틀립니다.");
				   return;
			   }
			   
		   }
		   
		} 
		
	</script>

</head>
<body>

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
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              	나의 여행계획	<!-- Blog, 김민중 - 나의 여행계획(blog 형식의 틀로 잡혀있는 것, 지도를 끌어와 위치를 찍을 수 있으면 좋을듯함 -->
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <a class="dropdown-item" href="blog-home-1.jsp">Blog Home 1</a>
              <a class="dropdown-item" href="blog-home-2.html">Blog Home 2</a>
              <a class="dropdown-item" href="blog-post.html">Blog Post</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Other Pages
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <a class="dropdown-item" href="full-width.html">Full Width Page</a>	<!-- 추가 메뉴(필요시 삭제) -->
              <a class="dropdown-item" href="sidebar.html">추천사이트</a>		<!-- Sidebar Page, 추천사이트로 이용하는게 좋을듯 현재는 HTML에 있는 페이지로 연결되어 있는 것을 각 추천 여행 사이트로 연결 -->
              <a class="dropdown-item" href="faq.html">자주 묻는 질문</a>	<!-- 고객센터로 이용? -->
              <a class="dropdown-item" href="404.html">404</a>	<!-- 추가 메뉴(필요시 삭제) -->
              <a class="dropdown-item" href="pricing.html">Pricing Table</a>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </nav>	<!-- 메뉴 끝! -->

<%
	

%>
	<h1>게시판 삭제 페이지</h1>

	<!-- boardView에서 num값(게시글 번호)를 넘겨 받아옴 -->
	<div class="row">
		<div class="col-lg" align="center">
			<form name="deleteform" action="boardDeleteCheck2.jsp" method="get">
				<table>
					<tr>
						<td>비밀번호 : </td>
						<td colspan="2"><input name="password" type="password"></td>
					</tr>
					<tr>
						<td><input name="num" value="<%= idx%>" type="hidden"></td>
					</tr>
					<tr>
						<td>
						<button type="button" OnClick="deleteCheck()">삭제</button>
						<button type="button" OnClick="history.back(-1)">취소</button>
						<button type="button" OnClick="window.location='boardlist.jsp'">목록으로</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

</body>
</html>