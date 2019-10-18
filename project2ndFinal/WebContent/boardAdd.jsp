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
	
	<!-- <script type="text/javascript" src="/editor/js/HuskyEZCreator.js" charset="utf-8"></script> 
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script> -->
	<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
	<script type="text/javascript" src="./Se/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
	
	<script type="text/javascript">
		var oEditors = [];
		$(function(){
		      nhn.husky.EZCreator.createInIFrame({
		          oAppRef: oEditors,
		          elPlaceHolder: "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
		          //SmartEditor2Skin.html 파일이 존재하는 경로
		          sSkinURI: "./Se/SmartEditor2Skin.html",  
		          htParams : {
		              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		              bUseToolbar : true,             
		              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		              bUseVerticalResizer : true,     
		              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		              bUseModeChanger : true,         
		              fOnBeforeUnload : function(){
		                   
		              }
		          }, 
		          fOnAppLoad : function(){
		              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
		              oEditors.getById["ir1"].exec("PASTE_HTML", ["***내용을 적어주세요***"]);
		          },
		          fCreator: "createSEditor2"
		      });
		      
		      //저장버튼 클릭시 form 전송
		      $("#insert").click(function(){
		    	  //editor의 내용을  textarea에 적용
		          oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		          
		    	  var form = document.writeform;
		          if(!form.title.value){
		        	  alert("제목을 적어주세요");
		        	  document.writeform.title.focus();
		        	  return;
		          }
		          
		          if( !form.bpw.value )
				   {
				    alert( "비밀번호를 적어주세요" );
				    form.bpw.focus();
				    return;
				   }
				 
				  /* if( !form.content.value )
				   {
				    alert( "내용을 적어주세요" );
				    form.content.focus();
				    return;
				   } */
				   
					var ir1valid = document.getElementById("ir1").value.length;
					console.log(ir1valid);
					if(ir1valid <= 11)  {
					     alert("내용을 입력하세요.");
					     oEditors.getById["ir1"].exec("FOCUS"); //포커싱
					     return;
					}
				   
		          $("#frm").submit();
		      });    
		});
	
	</script>

	<!-- <script language = "javascript"> // 자바 스크립트 시작

		function writeCheck()	// check test필요
		  {
			   var form = document.writeform;
			   
			   if( !form.title.value )   // form 에 있는 name 값이 없을 때
			   {
			    alert( "제목을 적어주세요" ); // 경고창 띄움
			    form.title.focus();   // form 에 있는 title 위치로 이동
			    return;
			   }
			   
			   if( !form.bpw.value )
			   {
			    alert( "비밀번호를 적어주세요" );
			    form.bpw.focus();
			    return;
			   }
			 
			  if( !form.content.value )
			   {
			    alert( "내용을 적어주세요" );
			    form.content.focus();
			    return;
			   }
			 
			  /* if((form.insert.value).equal("등록")){
				  String message = "insert";
				  response.sendRedirect("writeOk.jsp?message="+message);
			  } */
			  
			  form.submit();	//submit을 이 함수에서 실행하게끔 만드는 코드
		  }
	
	  
	 </script> -->




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
          <li class="nav-item">
            <a class="nav-link" href="about.html">로그인</a>	<!-- 로그인, About -->
          </li>
          <li class="nav-item">
            <a class="nav-link" href="services.html">게시판</a>	<!-- 게시판, Services -->
          </li>
          <li class="nav-item">
            <a class="nav-link" href="contact.html">GA 위치 or 고객센터</a>	<!-- GA 소개 or 고객센터, Contact -->
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              	여행정보	<!-- Portfolio, 장채연 -->
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
            	<!-- 원하는 포트폴리오로 테마별, 지역별로 구성 -->
              <a class="dropdown-item" href="portfolio-1-col.html">1 Column Portfolio</a>
              <a class="dropdown-item" href="portfolio-2-col.html">2 Column Portfolio</a>
              <a class="dropdown-item" href="portfolio-3-col.html">3 Column Portfolio</a>
              <a class="dropdown-item" href="portfolio-4-col.html">4 Column Portfolio</a>
              <a class="dropdown-item" href="portfolio-item.html">Single Portfolio Item</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              	나의 여행계획	<!-- Blog, 김민중 - 나의 여행계획(blog 형식의 틀로 잡혀있는 것, 지도를 끌어와 위치를 찍을 수 있으면 좋을듯함 -->
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <a class="dropdown-item" href="blog-home-1.html">Blog Home 1</a>
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

<div class="row">
	<div class="col-lg" align="center">
		<form id="frm" name="writeform" action="writeOk.jsp">
		<table>
			<tr>
				<td align="center">제목 </td>
				<td align="left" width="650"><input type="text" name="title" id="title" style = "width:650px; height:100%;"></td>
			</tr>
			
			<tr>
				<td align="center">아이디 </td>
				<td align="left" width="650"><input type="text" name="bid" value="${id}" style = "width:650px; height:100%;" readonly="readonly"></td>
			</tr>
			
			<tr>
				<td align="center">비밀번호 </td>
				<td align="left" width="650"><input type="password" name="bpw" style = "width:650px; height:100%;"></td>
			</tr>
			
			<tr>
				<td align="center">내<br><br><br>용</td>
				<td align="left" width="800">
					<textarea rows="10" cols="30" id="ir1" name="content" style = "width:650px; height:350px;"></textarea>
				</td>
			</tr>
				<td></td>
			<tr>
				<td><input type=button value="등록" name="insert" id="insert">
				<!-- <input type="button" value="수정" name="update" onclick="writeCheck()"> -->
				<input type="button" value="삭제" name="delete">
				<input type=button value="취소" OnClick="history.back(-1)">
				</td>
				<td>
				
				</td>
			</tr>
		
		</table>
		</form>
	</div>

</div>


</body>
</html>