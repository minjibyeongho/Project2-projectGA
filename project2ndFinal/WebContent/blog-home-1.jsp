<%@page import="bean.ListDTO"%><%@page import="bean.ListDTO"%>
<%@page import="bean.ListDAO"%>
<%@page import="bean.TravelDTO"%>
<%@page import="bean.TravelDAO"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Modern Business - Start Bootstrap Template</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">


<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
      $(document).ready(function() {
         $("#keyword").click(function() {
         var k = $("#search").val();
            location.href = "blog-home-1.jsp?search="+k;
         })

        $("#listSearch").click(function() {
         var r = $("#reg").val();
         var p = $("#selectPlace").val();
         alert("R 값 :  "+r+"      P 값 : "+p);
            location.href = "blog-home-1.jsp?search="+r+"&searchPlace="+p;
            
        })
      })
   $(function() {
      $("#reg").change(function(){
         var val = $(this).val();
         var si = $("#place option").length;
         for(var a=0;a<si-1;a++){
            $("#place option:last").remove();
         }
         var op = new String;
         <%int size = 0;%>
         <%ArrayList listSession = new ArrayList();%>
         
         
         
         
         $.ajax({
            url: "DBselect.jsp",
            data:{
               
               "val" : val
            } ,
            success:function(result){
               
            },
            error: function(jqXHR, exception) {
                 if (jqXHR.status === 0) {
                     alert('Not connect.\n Verify Network.');
                 }
                 else if (jqXHR.status == 400) {
                     alert('Server understood the request, but request content was invalid. [400]');
                 }
                 else if (jqXHR.status == 401) {
                     alert('Unauthorized access. [401]');
                 }
                 else if (jqXHR.status == 403) {
                     alert('Forbidden resource can not be accessed. [403]');
                 }
                 else if (jqXHR.status == 404) {
                     alert('Requested page not found. [404]');
                 }
                 else if (jqXHR.status == 500) {
                     alert('Internal server error. [500]');
                 }
                 else if (jqXHR.status == 503) {
                     alert('Service unavailable. [503]');
                 }
                 else if (exception === 'parsererror') {
                     alert('Requested JSON parse failed. [Failed]');
                 }
                 else if (exception === 'timeout') {
                     alert('Time out error. [Timeout]');
                 }
                 else if (exception === 'abort') {
                     alert('Ajax request aborted. [Aborted]');
                 }
                 else {
                     alert('Uncaught Error.n' + jqXHR.responseText);
                 }
             }


         });
         
     
        <%
        try{
           
           
         
           
            listSession = (ArrayList)request.getSession().getAttribute("place");
            
               size = listSession.size();
        }catch(Exception e){
           
        }
        
         %>        
         
           setTimeout(function() {
              location.reload();
            }, 100);
   });
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

   <!-- Page Content -->
   <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">
         나의 여행 계획 <small></small>
      </h1>

      <ol class="breadcrumb">
         <li class="breadcrumb-item"><a href="index.html">Home</a></li>
         <li class="breadcrumb-item active">나의 여행계획 1</li>
      </ol>

      <!-- 검색창 -->
      <div style="padding-bottom: 30px">
         <div id="regionS" style="display: inline-block;">
            <button class="btn btn-secondary" type="button" disabled="true">지역</button>
            <select id="reg" name="reg"
               style="font-size: 1.5em; border-radius: 0.25rem; width: 200px; transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out; position: relative; top: 5px; left: 15px">
               <%
                  String getatt = (String) request.getSession().getAttribute("region");
               %>
               <c:set var="reg" value='<%=getatt%>' />
               <option id="region" value="전체">전체</option>

               <c:if test="${reg =='강원'}">
                  <option id="region" selected value="강원">강원</option>
               </c:if>
               <c:if test="${reg =='경북'}">
                  <option id="region" selected value="경북">경북</option>
               </c:if>
               <c:if test="${reg =='대구'}">
                  <option id="region" selected value="대구">대구</option>
               </c:if>
               <c:if test="${reg =='서울'}">
                  <option id="region" selected value="서울">서울</option>
               </c:if>
               <c:if test="${reg =='울산'}">
                  <option id="region" selected value="울산">울산</option>
               </c:if>
               <c:if test="${reg =='전남'}">
                  <option id="region" selected value="전남">전남</option>
               </c:if>
               <c:if test="${reg =='제주'}">
                  <option id="region" selected value="제주">제주</option>
               </c:if>
               <c:if test="${reg =='충북'}">
                  <option id="region" selected value="충북">충북</option>
               </c:if>

               <c:if test="${reg !='강원'}">
                  <option id="region" value="강원">강원</option>
               </c:if>
               <c:if test="${reg !='경북'}">
                  <option id="region" value="경북">경북</option>
               </c:if>
               <c:if test="${reg !='대구'}">
                  <option id="region" value="대구">대구</option>
               </c:if>
               <c:if test="${reg !='서울'}">
                  <option id="region" value="서울">서울</option>
               </c:if>
               <c:if test="${reg !='울산'}">
                  <option id="region" value="울산">울산</option>
               </c:if>
               <c:if test="${reg !='전남'}">
                  <option id="region" value="전남">전남</option>
               </c:if>
               <c:if test="${reg !='제주'}">
                  <option id="region" value="제주">제주</option>
               </c:if>
               <c:if test="${reg !='충북'}">
                  <option id="region" value="충북">충북</option>
               </c:if>

            </select>
         </div>
         <div id="searchbox" style="display: inline-block;">
            <!-- Place 리스트 박스  -->
            <select id="selectPlace" name="selectPlace"
               style="font-size: 1.5em; border-radius: 0.25rem; width: 200px; transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out; position: relative; top: 5px; left: 20px">
               <option id="place" value="전체">전체</option>
               <%
                  ArrayList listSession2 = (ArrayList) request.getSession().getAttribute("place");

                  int size2 = 0;
                  try {
                     size2 = listSession2.size();

                  } catch (Exception e) {

                  }
               %>
               <%
                  for (int z = 0; z < size2; z++) {
               %>
                $("#place").append("<option value=<%=listSession2.get(z)%>><%=listSession2.get(z)%></option>");
               
               <%
                  }
               %>
            </select>
         </div>

         <div style="padding-top: 10px">
            <button class="btn btn-secondary" type="button" disabled="true"
               ; style="position: relative; top: 5px;">테마</button>
            <select name="theme"
               style="font-size: 1.5em; border-radius: 0.25rem; width: 200px; transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out; position: relative; top: 10px; left: 15px">
               <option id="region">전체</option>
               <option id="region">자연</option>
               <option id="region">역사</option>
               <option id="region">체험</option>
               <option id="region">감성</option>
            </select>
         </div>
         <div style="padding-top: 20px; position: relative; left: 30%;">
            <button type="button" id="listSearch"
               class="btn btn-lg btn-secondary" style="width: 250px">검색</button>
         </div>
      </div>

      <div class="row">

         <!-- Blog Entries Column -->
         <div class="col-md-8">
            <!--          Blog Post          포스트 메인      -->
            <%
               ListDAO dao = new ListDAO();
               String search = request.getParameter("search"); //검색한 검색어 받아오기      Region 값
               String place = request.getParameter("searchPlace"); //검색한 검색어 받아오기     Place 값
               ArrayList<ListDTO> list = new ArrayList<ListDTO>();
               String UserId = (String)session.getAttribute("id");
               try {
                  if (search.length()==4) {
                     list = dao.selectAll(UserId);
                     System.out.println("Search 값은 Null");
                  } else {
                     list = dao.search(UserId,search, place,""); //검색 값 페이지랑 상관없습니다.
                     System.out.println("Search 값은 Null이 아니다");
                  }

               } catch (Exception e) {
                  list = dao.selectAll(UserId);
               }
               int nowPage; //현재 페이지값 선언
               try {
                  String b = request.getParameter("page"); //페이지 설정
                  nowPage = Integer.valueOf(b);
               } catch (Exception e) {
                  nowPage = 1; //만약 페이지 값이 없다면 시작페이지로 선언
               }
               int nowPost = (nowPage - 1) * 4;
               int limit = 0;
               for (int i = nowPost; i < list.size(); i++) {
                  if (limit == 4) //한 페이지에 4개의 글만 생성하게 제한
                     break;
                  ListDTO dto = list.get(i);
            %>
            <div class="card mb-4">
               <img class="card-img-top" src=<%=dto.getPicture()%>
                  alt="Card image cap">
               <div class="card-body">
                  <h2 class="card-title"><%=dto.getName()%></h2>
                  <p class="card-text">         </p>      <!-- 여행지 카드 내에 텍스트 적을 수 있는 공간 -->
                  <a href="region.jsp?region=<%=dto.getRegion() %>" class="btn btn-primary">Read More &rarr;</a>
               </div>
               <div class="card-footer text-muted">
                  Posted on January 1, 2017 by <a href="#">Start Bootstrap</a>
               </div>
            </div>
            <%
               limit += 1;
               }
            %>

            <!-- Pagination -->
            <ul class="pagination justify-content-center mb-4">
               <%
                  if (nowPage == 1) {
               %>
               <li class="page-item disabled">
                  <%
                     } else {
                  %>
               
               <li class="page-item">
                  <%
                     }
                  %> <a class="page-link"
                  href="blog-home-1.jsp?page=<%=nowPage - 1%>&search=<%=search%>">&larr;
                     Older</a>
               </li>
               <%
                  int maxPage = list.size() / 4;
                  if (list.size() % 4 > 0)
                     maxPage += 1;
                  if (maxPage == 0)
                     maxPage = 1;
                  for (int i = 0; i < maxPage; i++) {
               %>
               <li class="page-item"><a class="page-link"
                  href="blog-home-1.jsp?page=<%=i + 1%>&search=<%=search%>"><%=i + 1%></a>
               </li>
               <%
                  }
                  if (nowPage == maxPage) {
               %>
               <li class="page-item disabled">
                  <%
                     } else {
                  %> <%
    }
 %> <a class="page-link"
                  href="blog-home-1.jsp?page=<%=nowPage + 1%>&search=<%=search%>">Newer
                     &rarr;</a>
               </li>
            </ul>
         </div>

         <!-- Sidebar Widgets Column -->
         <div class="col-md-4">

            <!-- Search Widget -->
            <div class="card mb-4">
               <h5 class="card-header">Search</h5>
               <div class="card-body">
                  <div class="input-group">
                     <input type="text" id="search" class="form-control"
                        placeholder="Search for..."> <span
                        class="input-group-btn">
                        <button id="keyword" class="btn btn-secondary" type="button">Go!</button>
                     </span>
                  </div>
               </div>
            </div>

         </div>

      </div>
      <!-- /.row -->

   </div>
   <!-- /.container -->

   <!-- Footer -->
   <footer class="py-5 bg-dark">
      <div class="container">
         <p class="m-0 text-center text-white">Copyright &copy; Your
            Website 2019</p>
      </div>
      <!-- /.container -->
   </footer>

   <!-- Bootstrap core JavaScript -->
   <script src="vendor/jquery/jquery.min.js"></script>
   <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>