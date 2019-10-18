<%@page import="bean.MemberDTO"%>
<%@page import="bean.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- bootstrap CDN -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>	<!-- jquery이용하기 위한 -->
	<script type="text/javascript">
		$(function(){
			$("#b1").click(function(){
				//var message = log.form.command.value;	//command에서 누른 버튼에 대하여 value값을 가져오도록
				$.ajax({
					url: "signup.jsp",
					type: "get",
					data: {
						"id" : document.log.id.value,
						"pw" : document.log.pw.value,
						"name" : document.log.name.value,
						"gender" : document.log.gender.value,
						"tel" : document.log.tel.value,
						"year" : document.log.year.value,
						"month" : document.log.month.value,
						"day" : document.log.day.value,
						"email1" : document.log.email1.value,
						"email2" : document.log.email2.value,
						"addr" : document.log.addr.value,
						"command" : document.log.command.value,
					},
					dataType: "text",
					success: function(){
						alert("정보 전송 완료!")
						//alert(document.log.command.value)
						if(document.log.command.value == "update"){
							alert(document.log.id.value+"님의 정보가 수정되었습니다.")
							location.href = "index.html";
						}else{
							alert(document.log.id.value+"님의 정보가 삭제되었습니다.")
							location.href = "index.html";
						}
					}
					
				});
				
				
			})//updateb click end
			
			var id = document.querySelector("#id").value;	//body의 id값을 가져옴
			console.log(id);
			$("#b2").click(function(){
				location.href = "index.html";
			})
			
			
		});	//jquery end
	
	</script>
</head>
<body>

<jsp:useBean id="dto" class="bean.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	MemberDAO dao = new MemberDAO();
	MemberDTO dbdto = dao.Select(dto);

	// memberinfo : 회원 정보 페이지
	// suignup page와 연동되어있음
%>

회원정보 페이지
<!-- 회원정보 테이블로 표시 및 정보 수정 가능하게끔 -->
<div class="container">
	
	    <h1 align="center">회원정보 페이지</h1>
		
		<!-- class : container > row > col-lg-4 > card h-100 > card-header or card-body or card-footer -->
		
	    <!-- Marketing Icons Section -->

<!-- 	    <div class="row" align="center"> -->
		<br>
		<br>


	    	<form action="signup.jsp" name="log" id="form">
		     <table>
		     	<tr>
		     		<th>아이디 : </th>
		     		<th colspan="3"><input type="text" name="id" id="id" class="btn btn-info" value=<%= dbdto.getId() %> readonly="readonly"></th>
		     	</tr>
		     	<tr>
		     		<th>비밀번호 : </th>
		     		<th colspan="3"><input type="text" name="pw" id="pw" class="btn btn-info" value=<%= dbdto.getPw() %> readonly="readonly"></th>
		     	</tr>
		     	<tr>
		     		<th>이름: </th>
		     		<th colspan="3"><input type="text" name="name" id="name" class="btn btn-info" value=<%= dbdto.getName() %>></th>
		     	</tr>
		     	<tr align="left">
		     		<!-- 성별 수정하는 것 radio값으로 할 수 있는 방법 확인, 일단은 text로 -->
		     		<th>성별 : </th>	
		     		<th colspan="3" align="center">
		     			<input type="text" name="gender" id="gender" class="btn btn-info" value=<%= dbdto.getGender() %>>
		     		</th>
		     	</tr>
		     	<tr>
		     		<th>연락처 : </th>
		     		<th colspan="3"><input type="text" name="tel" id="tel" class="btn btn-info" value=<%= dbdto.getTel() %>></th>
		     	</tr>
		     	<tr>
		     		<th>생년월일 : </th>
		     		<th>
			     		<input type="text" maxlength="10" name="year" id="year" value="<%=dbdto.getYear() %>" placeholder="년" class="btn btn-info">
			     		<input type="text" maxlength="10" name="month" id="month" value="<%= dbdto.getMonth() %>" placeholder="월" class="btn btn-info">
			     		 
			     		 <!-- <select name="month" class="btn btn-info" >
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
			     		</select> -->
			     		<!-- <input type="text" name="month" placeholder="월" class="btn btn-info"> -->
			     		<input type="text" name="day" id="day" value="<%= dbdto.getDay() %>" placeholder="일" class="btn btn-info">
		     		</th>
		     	</tr>
		     	<tr>
		     		<th>이메일 :</th>
		     		<th>
		     			<input type="text" name="email1" id="email1" value="<%= dbdto.getEmail1() %>" class="btn btn-info">@
		     			<input type="text" name="email2" id="email2" value="<%= dbdto.getEmail2() %>" class="btn btn-info">
                        
                        <!-- <select name="email2" class="btn btn-info">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>                        
                        </select> -->
		     		</th>
                </tr>
		     	<tr>
		     		<th>주소 : </th>
		     		<th colspan="3"><input type="text" name="addr" id="addr" class="btn btn-info" value="<%= dbdto.getAddr()%>"></th>
		     	</tr>
		     	
		     	
		     	
		     	<tr align="center">
		     		
		     		
		     		<th>
		     			<select name="command">
		     				<option value="update">수정<br>
		     				<option value="delete">삭제<br>
		     			</select>
		     			<button type="button" name="b1" id="b1">선택!</button>
		     			<!-- <button type="button" class="btn btn-outline-success" name="command" id="command" value="update">수정</button>
		    		</th>
		    		<th>
				     	<button type="button" class="btn btn-outline-success" id="command" value="delete">탈퇴</button> -->
			     	</th>
			     	<th>
				     	<button type="button" class="btn btn-outline-success" id="b2">메인 페이지로</button>

		     		</th>
		     	</tr>
		     </table>

	     	</form>	
	   </div>


<!-- 회원정보 테이블 및 수정 가능하게 -->

<!-- 수정, 삭제 기능 -->

</body>
</html>