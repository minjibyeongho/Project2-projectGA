<%@page import="java.io.Console"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="bean.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
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
		String sid = null;
		try{
			sid = (String)session.getAttribute("id"); 
		}catch(Exception e){ }
	
	%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>	<!-- jquery 쓰기위한 import로 생각 -->	
	<script type="text/javascript">
		function boardAdd(){
			<% 
				if(sid == null){
			%>
				alert("로그인 후 글쓰기가 가능합니다.")
			<%
			}else{
			%>
			location.href = "boardAdd.jsp";
			<%}%>
		}
		
		// boardlist에서 덧글 또는 boardView에서 댓글 달수 있게 구현 
	
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
	BoardDAO dao = new BoardDAO();
	ArrayList<BoardDTO> list = dao.SelectAll();
	// arraylist에 게시판에 있는 정보 모두 가져옴
	
	int pg;
	try{
		pg = Integer.parseInt(request.getParameter("pg"));	//pg값이 정해져 있으면 그 값을 가져온다
	}catch(Exception e){
		pg = 1;		//기본 페이지 값
	}
	
	
	int rowsize = 10;	//해당 페이지에서 보여줄 게시물 수
	int block = ((int)list.size()/rowsize) + 1;		//보여줄 페이지 갯수
	
	//게시물 번호 차리
	int start = (pg*rowsize)-(rowsize);	//pg =1, start=1 / pg=2, start=6이됨	<- 해당 페이지에서 게시물 처음
	int end = (pg*rowsize-1);		//pg=1, end =5 / pg=2, end=10	<- 해당 페이지에서 게시물 끝
	//페이지수 처리
	int allpage = 0;	//초기화
	System.out.println("start 페이지 :"+start);
	int startPage = ((pg-1)/block*block)+1;		//pg=1, startpage=1, pg=2, startpage=
	int endPage = ((pg-1)/block*block)+block;	//pg=1, endpage

	allpage = (int)(list.size()/(double)rowsize)+1;	//51개 게시물이면 allpage는 6이 나온다.
	
	if(list.size() == 0 ){
		%>
		<script type="text/javascript">
		alert("게시물이 없습니다!");
		</script>
		<%
	}
	
	if(endPage == pg){	//마지막 페이지에서
		end = start + list.size() % rowsize - 1;	//게시물이 26개이면 end는 6이될 것
	}
	
%>
<div class="row">

	<div class="col-lg" align="center">
		<table>
			<tr align="left">
				<td width="1000">총 게시물 수 : <%= list.size() %></td>
			</tr>
		</table>
		
		<table border="1">
			<tr align="center">
				<td width="100">게시번호</td>
				<td width="500">제목</td>
				<td width="100">작성자</td>
				<td width="200">작성일</td>
				<td width="100">조회</td>
			</tr>
		<!-- DB에 저장된 게시글들을 가져와서 만들게 됨 -->
		<!-- boardDAO, boardDTO 만들고 ID Session처리하여 끌고 올 수 있도록 -->
			<%
				//분기문 작성(게시물이 없을 때와 있을 때)
			if(list.size()==0){
			 %>
			 <tr>
			 	<td colspan="5"></td>
			 </tr>
			 <tr align="center">
			 	<td colspan="5">등록된 글이 없습니다</td>
			 </tr>
			 <tr>
			 	<td colspan="5"></td>
			 </tr>
				 
			 <%
			}else{
				BoardDTO dbdto = null;
				for(int i=start;i<=end;i++){
					dbdto = list.get(i);
					//게시물 번호 확인
					System.out.println("게시물 번호 : "+dbdto.getNum());
					
			%>
			<tr align="center">
				<td width="100"><%= dbdto.getNum() %></td>
				<td width="500"><a href="boardView.jsp?num=<%= dbdto.getNum()%>"><%= dbdto.getTitle() %></a></td>	<!-- a tag이용 상세 내용 페이지로 가게끔 -->
				<td width="100"><%= dbdto.getBid() %></td>
				<td width="200"><%= dbdto.getDate() %></td>
				<td width="100"><%= dbdto.getHit() %></td>
			</tr>	
			<% 
				}
			}
			System.out.println("----------------");
			%>
			<tr>
				<td colspan="5" align="center"><!-- 페이징 처리할 부분 -->
					<%
						for(int i=startPage;i<=endPage;i++){
							if(i==pg){	//현재 페이지는 눌려있는 것으로(그냥 글로 표현)
								%>
									[<%= i %>]
								<%
							}else{		//나머지 페이지는 <a>로 누를 수 있도록 표현
								%>
									[<a href="boardlist.jsp?pg=<%=i %>"><%= i %></a>]
								<%
							}
						}
					%>
				</td>
			</tr>	
			<tr>
				<td colspan="5">
					<button type="button" onclick="boardAdd()">글쓰기</button>
				</td>
			</tr>
		
		</table>
<%
	// board db에서 selectAll로 모든 자료 가져오는 분기문
	// if() - 자료가 없을 때 / else() - 자료가 있을 때, 페이지 개념 도입으로 10개씩 게시글을 끊어서 관리

%>	

	
	
	
	<!-- <div class="col-4" align="right">
		ddd
	
	</div>
	<div class="col-4" align="center">
		dd
	
	</div>
	<div class="col-4" align="left">
		ddd
	
	</div> -->

	</div>	<!-- col-lg end -->
</div>	<!-- row end -->
</body>
</html>