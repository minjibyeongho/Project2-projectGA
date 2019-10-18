<%@page import="java.awt.List"%>
<%@page import="bean.ListDTO"%>
<%@page import="bean.ListDAO"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.ThrowStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.TravelDTO"%>
<%@page import="bean.TravelDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
        
      <style type="text/css">
     .site-quick-menu__item--menu .site-quick-menu__link {
       -ms-flex-align: center;
       -ms-flex-pack: center;
       -webkit-box-align: center;
       -webkit-box-pack: center;
       align-items: center;
       display: -webkit-box;
       display: -ms-flexbox;
       display: flex;
       font-size: 16px;
       font-weight: 700;
       height: 60px;
       justify-content: center;
       letter-spacing: -.025em;
       line-height: 1.25;
       margin-bottom: 1px;
       position: relative;
   }
   .site-quick-menu__link {
       color: #fff;
       display: block;
       position: relative;
   }

   /* 퀵메뉴 바탕 색 */
     .site-quick-menu__item--menu .site-quick-menu__link--theme {
       background-color: #f07884;
       text-decoration: none;
   }      
     
   .site-quick-menu__item--menu .site-quick-menu__link--benefit {
       background-color: #f5ad00;
       text-decoration: none;
   }
   .site-quick-menu__item--menu .site-quick-menu__link--event {
      background-color: #3ba1b5;
       text-decoration: none;
   }
   .site-quick-menu__item--menu .site-quick-menu__link--visitkorea {
         background-color: #3b76b2;
       text-decoration: none;
   }
   
   .site-quick-menu__item:after {
       clear: both;
       content: "";
       display: block;
   }
   
   .site-quick-menu {
       position: fixed;
       right: 20px;
       text-align: center;
       top: 280px;
       width: 140px;
       z-index: 400;
   }
   
     .site-quick-menu__item--menu2 .site-quick-menu__link2 {
       -ms-flex-align: center;
       -ms-flex-pack: center;
       -webkit-box-align: center;
       -webkit-box-pack: center;
       align-items: center;
       display: -webkit-box;
       display: -ms-flexbox;
       display: flex;
       font-size: 16px;
       font-weight: 700;
       height: 60px;
       justify-content: center;
       letter-spacing: -.025em;
       line-height: 1.25;
       margin-bottom: 1px;
       position: relative;
   }
   .site-quick-menu__link2 {
       color: #fff;
       display: block;
       position: relative;
   }
   
   ol, ul {
       list-style: none;
   }
   
   /* 퀵메뉴 바탕 색 */
     .site-quick-menu__item--menu2 .site-quick-menu__link--theme2 {
       background-color: #f07884;
       text-decoration: none;
       font-size: 15px;
       height: 35px;
       text-align: center;
       align-items: center;
       justify-content: center;
   }      
     
   .site-quick-menu__item--menu2 .site-quick-menu__link--benefit2 {
       background-color: #f5ad00;
       text-decoration: none;
       height: 300px;
   }
   
   .site-quick-menu__item:after2 {
       clear: both;
       content: "";
       display: block;
   }
   
   .site-quick-menu2 {
       position: fixed;
       right: 20px;
       text-align: center;
       top: 550px;
       width: 140px;
       z-index: 400;
   }
   
   aside {
       display: block;
   }
  </style>     
        
        
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <script type="text/javascript">
      $(function() {               //DB Insert 목록에 추가 버튼을 눌렀을 시 작동 List DB에 추가
         
         $("button").click(function() {
            var value = $(this).attr('value');
            var command = $(this).attr('id');
               
            //alert("value = "+value + " id = "+command);
            	//value : 여행지명, id : insert, delete 등 명령어
               if(command=="insert"||command=="delete")
                  //alert("if문");
               $.ajax({
                  
                   type : "POST",
                   url : "DBinsert.jsp",         //DBinsert 페이지로 데이터 전송 그쪽에서 list 에 insert 처리
                   data : {"value" : value,
                         "command" : command,   
                   },
                       success: function() {
                          //alert("Ajax 1");
                          
                          

                       },
                       error: function(jqXHR, exception) {
                             if (jqXHR.status === 0) {
                                 //alert('Not connect.\n Verify Network.');
                             }
                             else if (jqXHR.status == 400) {
                                 //alert('Server understood the request, but request content was invalid. [400]');
                             }
                             else if (jqXHR.status == 401) {
                                 //alert('Unauthorized access. [401]');
                             }
                             else if (jqXHR.status == 403) {
                                // alert('Forbidden resource can not be accessed. [403]');
                             }
                             else if (jqXHR.status == 404) {
                                 //alert('Requested page not found. [404]');
                             }
                             else if (jqXHR.status == 500) {
                                 //alert('Internal server error. [500]');
                             }
                             else if (jqXHR.status == 503) {
                                // alert('Service unavailable. [503]');
                             }
                             else if (exception === 'parsererror') {
                                // alert('Requested JSON parse failed. [Failed]');
                             }
                             else if (exception === 'timeout') {
                                // alert('Time out error. [Timeout]');
                             }
                             else if (exception === 'abort') {
                                // alert('Ajax request aborted. [Aborted]');
                             }
                             else {
                               //  alert('Uncaught Error.n' + jqXHR.responseText);
                             }
                         }
   
               });
            
              $.ajax({
                   type : "POST",
                   url : "최근본목록추가.jsp",         //최근 본 목록에 데이터
                   data : {"text" : value,
                   },
                       success: function(data) {
                    // alert("Ajax 2");
                           if(data != null)    {
                           } else {
                               // 데이터가 없을 때
                           }
                       },
   
               });   
               
            //window.location.reload();
            history.go(0);
            return false;
         });//insert & delete End
         
         
         
         
         /* 
         $("button").click(function() {                  //최근 본 목록 Session에 추가
             var id = $(this).attr('id');
             var text = $(this).text();
             if(id == 'ViewList'){
                $.ajax({
                    type : "POST",
                    url : "최근본목록추가.jsp",         //최근 본 목록에 데이터
                    data : {"text" : text,
                    },
                        success: function(data) {
                     alert("Ajax");
                            if(data != null)    {
                            } else {
                                // 데이터가 없을 때
                            }
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
             }//if문 END
             //window.location.reload();
             history.go(0);
             return false;
          });
          */
         
         
         
         
      });
   
   

   </script>
        
        
        
        
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
   <% String region = request.getParameter("region");
    String theme = request.getParameter("theme"); 
    String member = request.getParameter("member");
   String name1 = null;
   String type = null;
   %>
   <c:set var="column" value='<%=region %>'/>
     <c:if test="${not empty column}">   <%System.out.println("If문 region");name1 = region;type ="지역";%></c:if>
   <c:set var="column" value='<%=theme %>'/>
     <c:if test="${not empty column}">   <%System.out.println("If문 theme");name1 = theme; type ="테마";%></c:if>
   <c:set var="column" value='<%=member %>'/>
     <c:if test="${not empty column}">   <%System.out.println("If문 member");name1 = member;type ="멤버";%></c:if>
    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3"><%=name1 %>
      <small><%=type%></small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">홈</a>
      </li>
      <li class="breadcrumb-item active"><%=name1 %></li>
    </ol>
    
    <!-- db연결 -->
    <div class="row">
   <%
         TravelDAO dao = new TravelDAO();
         TravelDTO dto = new TravelDTO();
      ArrayList list = dao.selectAll();
      
      for(int i=0; i<list.size(); i++ ) {
            boolean in = false;
           dto = (TravelDTO)list.get(i); 
           boolean DBCheck = false;
           
             if(type=="지역")DBCheck = dto.getRegion().equals(region);
           if(type=="멤버")DBCheck = dto.getMember().equals(member);
           if(type=="테마")DBCheck = dto.getTheme().equals(theme);
              
            if(DBCheck) {
   %>
   
               <div class="col-lg-4 col-sm-6 portfolio-item">
                 <div class="card h-100">
                      <a href="#"><img class="card-img-top" src=<%= dto.getPicture() %> alt=""></a>
                   <div class="card-body">
                   
                     <h4 class="card-title">
                       <button type="button" id="ViewList"><%= dto.getName() %></button>
                     </h4>
                     
                     <p class="card-text">#<%= dto.getPlace() %> </p>
                     <p class="card-text">#<%= dto.getTheme() %> </p>
                     <p class="card-text">#<%= dto.getMember() %> </p>
                     
                     <input id = "viewplace" name="place" class="card-text" type="hidden" value=<%= dto.getPlace() %>></input>
                     <input id = "viewpicture" name="picture" class="card-text" type="hidden" value=<%= dto.getPicture() %>></input>
                     <input id = "viewname" name="name" class="card-text" type="hidden" value=<%= dto.getName() %>></input>
                       <%
                          String UserId = (String)session.getAttribute("id");
                       
                          ListDAO ldao = new ListDAO();
                          
                             if(UserId !=null){
                          
                              ArrayList<ListDTO> listL = ldao.selectAll(UserId);
                                  for(int j=0; j<listL.size(); j++ ) {
                                      ListDTO dtoL = (ListDTO)listL.get(j);    
                                      if(dtoL.getName().equals(dto.getName())==true)
                                      {
                                         in = true;
                                      }
                                  }
                                 if(in == false) // List에 현재 여행지가 들어있을 경우 목록에서 제거 버튼으로 버튼을 생성
                                 {
                                   %>
                                   <button type="button" id="insert" value=<%=dto.getName() %> class="btn btn-primary" style="float: right;">목록에 추가</button>
                                   <%
                                 }// List에 현재 여행지가 없을 경우 목록에 추가 버튼으로 버튼을 생성
                                       else if(in == true){
                                   
                                   %> 
                                   <button type="button" id="delete" value=<%=dto.getName() %> class="btn btn-primary" style="float: right;">목록에서 제거</button>
                                   <%
                                 }//else End
                             }
                              %>
                   </div>
<!--                    <div class="card-footer">
                     <a href="#" class="btn btn-primary">Learn More</a>
                   </div> -->
                 </div>
               </div>
    <%
      }else {}
         }
    %>  
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
        <a class="page-link">1</a>
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
  
       <!-- 퀵메뉴  -->
   <aside class="site-quick-menu">
   <nav class="site-quick-menu__container">
        <ul class="site-quick-menu__list">
            <li class="site-quick-menu__item site-quick-menu__item--menu">
                <a class="site-quick-menu__link site-quick-menu__link--theme" href="/program/theme-list.php">
                    <span class="site-quick-menu__text">마을 여행</span>
                </a>
                <a class="site-quick-menu__link site-quick-menu__link--benefit" href="/curation/benefit.php">
                    <span class="site-quick-menu__text">핵심혜택</span>
                </a>
                <a class="site-quick-menu__link site-quick-menu__link--event" href="/event/ongoing-list.php">
                    <span class="site-quick-menu__text">이벤트</span>
                </a>
                <a class="site-quick-menu__link site-quick-menu__link--visitkorea" href="place.html" target="_blank">
                    <span class="site-quick-menu__text">지역별<br>여행지</span>
                </a>
            </li>
        </ul>
    </nav>
</aside>
    

   <aside class="site-quick-menu2">
   <nav class="site-quick-menu__container2">
        <ul class="site-quick-menu__list2">
            <li class="site-quick-menu__item site-quick-menu__item--menu2">
                    <span class="site-quick-menu__link site-quick-menu__link--theme2">최근본목록</span>
                    <div class="site-quick-menu__link site-quick-menu__link--benefit2">
                       <%
                     System.out.println("퀙 메뉴 작동");
                          ArrayList<TravelDTO> list2 = new ArrayList<TravelDTO>();
                       try{
                           list2 = (ArrayList<TravelDTO>)session.getAttribute("travel");
                           System.out.println("List2 : "+list2);
                       }catch(Exception e){
                       }
                     //제너릭도 써주어야 한다
                     int size = 0;
                     try{
                        size = list2.size();
                     }catch(Exception e){
                        size = 0;
                     }
                     
                     for(int i=0; i<size; i++){
                        TravelDTO dto2 = (TravelDTO)list2.get(i);
                        if(i>3) {
                           list2.remove(i-3);
                        }
                  %>
                        <img width="100" height="50" src=<%= dto2.getPicture() %>> <br> <%= dto2.getName() %><br>
                  <% 
                     }
                  %>
                    </div>
            </li>
        </ul>
    </nav>
</aside>

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
   
   <script type="text/javascript">
      //window.location.reload();
      //확인용 asd
   </script>
</body>
