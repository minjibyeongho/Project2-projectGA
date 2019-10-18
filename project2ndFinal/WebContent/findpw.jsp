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


	<br>
	<br>
<!-- 비밀번호 찾기 : 아이디, 생년월일, 전화번호, 이메일 -->
<div class="container">
	<div class="row">
    	<div class="col-lg-12">
    		<h1 align="center">비밀번호 찾기</h1>
    		<form action="login.jsp" method="post">
    			<table>
	    			<tr>
	    				<th align="center">아이디 : </th>
	    				<th align="left">
			     			<input type="text" name="id" placeholder="아이디"><br>
			     		</th>
			     	</tr>
			     	
			     	<tr align="left">
		     			<th align="center">생년월일 : </th>
			     		<th>
				     		<input type="text" maxlength="10" name="year" placeholder="년" class="btn btn-info">
				     		<select name="month" class="btn btn-info">
				     			<option value="">월</option>
				     			<option value="01">1</option>
				     			<option value="02">2</option>
				     			<option value="03">3</option>
				     			<option value="04">4</option>
				     			<option value="05">5</option>
				     			<option value="06">6</option>
				     			<option value="07">7</option>
				     			<option value="08">8</option>
				     			<option value="09">9</option>
				     			<option value="10">10</option>
				     			<option value="11">11</option>
				     			<option value="12">12</option>
				     		</select>
				     		<!-- <input type="text" name="month" placeholder="월" class="btn btn-info"> -->
				     		<input type="text" name="day" placeholder="일" class="btn btn-info">
			     		</th>
		     		</tr>
		     		<tr>
		     			<th align="center">연락처 : </th>
			     		<th>
			     			<input type="text" name="tel" placeholder="연락처"><br>
			     		</th>
			     	</tr>
			     	<tr>
			     		<th align="center">이메일 :</th>
			     		<th>
			     			<input type="text" name="email1" class="btn btn-info">@
	                        <select name="email2" class="btn btn-info">
	                            <option>naver.com</option>
	                            <option>daum.net</option>
	                            <option>gmail.com</option>
	                            <option>nate.com</option>                        
	                        </select>
			     		</th>
               		</tr>
			     	<tr>
			     		<th>
	    				<input type="hidden" name="findmessage" value="findpw">
	    				<!-- name, tel parameter를 login.jsp로 전송하여 거기서 처리하도록 -->
	    				</th>
			     	</tr>
			     	<tr>
			     		<th>
	    				<input type="submit" value="비밀번호찾기" class="btn btn-outline-success">
	    				<!-- name, tel parameter를 login.jsp로 전송하여 거기서 처리하도록 -->
	    				</th>
			     	</tr>
	    		</table>
    		</form>
    	</div>
    </div>
</div>

</body>
</html>