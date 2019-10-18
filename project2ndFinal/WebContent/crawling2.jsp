<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Modern Business - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">

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
    <h1 class="mt-4 mb-3">경기도 명소
      <small>추천 8선</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">홈</a>
      </li>
      <li class="breadcrumb-item active">경기도 명소</li>
    </ol>
   
   <%
   
   Document doc2 = Jsoup.connect("https://www.ggtour.or.kr/enjoy/hundred.php?tsort=2&msort=10").get();
   
   Elements posts = doc2.body().getElementsByClass("gall_board");
   Elements file = posts.select("li");
   
   String[] title = new String[20];
   String[] link = new String[20];
   String[] image = new String[20];
   String[] text = new String[20];
   
   int i=0;
      
      /* 입력 반복문 */
       for(Element e : file){
           title[i] = e.select("h3").text();
          link[i] = "https://www.ggtour.or.kr"+e.select("a").attr("href");
          image[i] = "https://www.ggtour.or.kr"+e.select(".inner_box img").attr("src");
          text[i] = e.select("h5").text();
          
          text[i]=text[i].substring(0, 40)+"...";
          
          i++;
       }
   %>
    
    <div class="row">
      <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="<%= link[0] %>"><img class="card-img-top" src=<%= image[0] %> alt=<%= title[0] %>></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="<%= link[0] %>"><%= title[0] %></a>
            </h4>
            <p class="card-text"><%= text[0] %></p>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="<%= link[1] %>"><img class="card-img-top" src=<%= image[1] %> alt=<%= title[1] %>></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="<%= link[1] %>"><%= title[1] %></a>
            </h4>
            <p class="card-text"><%= text[1] %></p>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="<%= link[2] %>"><img class="card-img-top" src=<%= image[2] %> alt=<%= title[2] %>></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="<%= link[2] %>"><%= title[2] %></a>
            </h4>
            <p class="card-text"><%= text[2] %></p>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="<%= link[3] %>"><img class="card-img-top" src=<%= image[3] %> alt=<%= title[3] %>></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="<%= link[3] %>"><%= title[3] %></a>
            </h4>
            <p class="card-text"><%= text[3] %></p>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="<%= link[4] %>"><img class="card-img-top" src=<%= image[4] %> alt=<%= title[4] %>></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="<%= link[4] %>"><%= title[4] %></a>
            </h4>
            <p class="card-text"><%= text[4] %></p>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="<%= link[5] %>"><img class="card-img-top" src=<%= image[5] %> alt=<%= title[5] %>></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="<%= link[5] %>"><%= title[5] %></a>
            </h4>
            <p class="card-text"><%= text[5] %></p>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="<%= link[6] %>"><img class="card-img-top" src=<%= image[6] %> alt=<%= title[6] %>></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="<%= link[6] %>"><%= title[6] %></a>
            </h4>
            <p class="card-text"><%= text[6] %></p>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="<%= link[7] %>"><img class="card-img-top" src=<%= image[7] %> alt=<%= title[7] %>></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="<%= link[7] %>"><%= title[7] %></a>
            </h4>
            <p class="card-text"><%= text[7] %></p>
          </div>
        </div>
      </div>
    </div>

    <!-- Pagination -->
    <ul class="pagination justify-content-center">
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
          <span class="sr-only">Previous</span>
        </a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#">1</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
          <span class="sr-only">Next</span>
        </a>
      </li>
    </ul>

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>