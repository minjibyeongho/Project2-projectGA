<%@page import="java.util.ArrayList"%>
<%@page import="bean.CommentDAO"%>
<%@page import="bean.CommentDTO"%>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%
	String sid = (String)session.getAttribute("id");	//session에서 현재 접속한 id를가져옴
	
	//request.getParameter으로 받아오는 값은 String 타입으로
		int idx = Integer.parseInt(request.getParameter("num"));

		BoardDAO dao = new BoardDAO();
		BoardDTO dbdto = dao.Select(idx);
		
		// 스크립트 릿에서 body에는 표현식(EL)로 땡기는게 가능
%>
	<script type="text/javascript">
		
	
		function boardlist(){
			location.href = "boardlist.jsp";
		}
	
		//수정, 삭제시 bpw 일치여부 체크 후 삭제 진행
	
		function boardDelete(){
			location.href = "boardDelete.jsp?num="+idx;
		}
		
		//jquery
		//댓글
		$(function(){
			$("#b1").click(function(){	//#id명 = 그 id를 지정
				// cid : 댓글 작성자 id, text1 = comment 내용, bnum : 게시글 번호
				
				var cid = "<%= sid %>";	//session에서 가져온 아이디를 input에 넣고 그것을 여기로 땡김
				var idx = "<%= idx %>";	//게시판 글번호
				var text1 = document.querySelector("#text").value;	//id명= text인 것을 가져옴
				console.log(cid);
				console.log(text1);
				console.log(<%= idx%>);
				$.ajax({
					url: "commentCheck.jsp",
					data: {
						"cid": cid,
						"bnum": idx,
						"comment": text1
					},
					success: function(){
						location.href="boardView.jsp?num="+<%= idx%>;
						alert("댓글 전송 완료!");
						//댓글을 전부 넣게끔
					}
				})
				// ajax로 작성하면?
				<%-- <%
					CommentDAO cdao = new CommentDAO();
					CommentDTO cdto = new CommentDTO();
					
					cdto.setCid(sid);
					cdto.setComment(comment);
					cdto.setBnum(idx);
					
					cdao.Insert(cdto);
							
				
				%> --%>
				
				<%-- $("#base").append("<li>"+ cid + "<br>"+text1+"<br>"+<%= idx %>+"</li>") --%>
			})
			
		});
	
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

<script type="text/javascript">
	var id = "<%= sid %>";
	var bid = "<%= dbdto.getBid()%>";
	var bpw = "<%= dbdto.getBpw()%>";
	var idx = "<%= dbdto.getNum()%>";
	//idx : 게시글 번호
	//consolo.log(id);
	
	//delete
	function deleteCheck(){
		if(id == bid){
			alert("삭제 페이지로!")
			location.href="boardDelete.jsp?num="+idx;
		}else{
			alert("삭제 권한이 없습니다...");
		}
	}
	
	//update
	function updateCheck(){
		// 1. 세션ID와 게시글 id를 비교 - 비밀번호 입력 후 수정 페이지로 이동하게끔
		if(id == bid){
			alert("수정!")
			var pw = prompt("게시글 비밀번호");
			if(pw == bpw){
				alert("게시글을 수정합니다!")
				location.href="boardUpdate.jsp?num="+idx;
			}else{
				alert("게시글 비밀번호가 틀립니다...")
			}
		}else{
			alert("수정 권한이 없습니다(작성자만이 삭제할 수 있습니다...)")
		}
		
	}

</script>

<h1 align="left">게시글 페이지</h1>

<div class="row">
	<div class="col-lg" align="center">
		<table border= "1" style = "border:2px solid black">
			<tr bordercolor="blue">
				<td align="center" width="300">제목 </td>
				<td align="left" width="650"><%= dbdto.getTitle() %></td>
			</tr>
			
			<tr bordercolor="blue">
				<td align="center">아이디 </td>
				<td align="left" width="650"><%= dbdto.getBid() %></td>
			</tr>
			
			<tr bordercolor="blue">
				<td align="center">조회수 </td>
				<td align="left" width="650"><%= dbdto.getHit() %></td>
			</tr>
			
			<tr bordercolor="blue">
				<td align="center">작성일시</td>
				<td align="left" width="650"><%= dbdto.getDate() %></td>
			</tr>
			
			<tr bordercolor="blue">
				<td align="center">내<br><br><br>용</td>
				<td align="left" width="650">
					<%= dbdto.getContent() %>
				</td>
			</tr>
			<%
				dao.UpdateHit(dbdto.getHit(), dbdto.getNum());	//hit는 select해오면서 +1되어서 옴
			
			%>
			<tr>
				<td colspan="2">
				<input type=button value="목록" OnClick="window.location='boardlist.jsp'">
				<input type="button" value="수정" OnClick="updateCheck()">
				<input type="button" value="삭제" OnClick="deleteCheck()">
				<!-- <input type=button value="취소" OnClick="history.back(-1)"> -->
				</td>
				<td>
				
				</td>
			</tr>
			<tr>
				<td colspan="2" bordercolor="blue">
					
				<!-- 댓글 달릴 공간 -->
				<!-- 답글 달기 버튼 추가하여 -->
					<button type="button" id="b1">댓글 달기</button>
					<%-- <input type="hidden" value="<%= sid%>" id="tid"> --%>
					<input type="text" id="text">
					
					<ul style="list-style:none">
						<li id="base"></li>
						<%
							CommentDAO cdao = new CommentDAO();
							ArrayList<CommentDTO> list = cdao.SelectBnum(idx);
							CommentDTO cdto = null;
							for(int j=0;j<list.size();j++){
									cdto = new CommentDTO();
									cdto = list.get(j);
								%>
								<li><%=cdto.getCid() %> <%=cdto.getDate() %><br><%= cdto.getComment() %></li>
								<form>
								<li>
									<a href="commentUpdateDelete.jsp?bnum=<%= cdto.getBnum()%>&cnum=<%= cdto.getCnum()%>&sid=<%= sid %>&message=Update">수정</a>|
									<% System.out.println(cdto.getBnum()+", "+cdto.getCnum()); %>
									<a href="commentUpdateDelete.jsp?bnum=<%= cdto.getBnum()%>&cnum=<%= cdto.getCnum()%>&sid=<%= sid %>&message=Delete">삭제</a>
								</li>
								</form>
								<%
							}
						%>
					</ul>
					
				</td>
			</tr>
		
		</table>
	</div>	<!-- col-lg end -->

</div>	<!-- row end -->


</body>
</html>