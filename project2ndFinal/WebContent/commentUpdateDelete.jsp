<%@page import="bean.CommentDTO"%>
<%@page import="bean.CommentDAO"%>
<%@page import="javax.xml.stream.events.Comment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<%
	//boardView에서 댓글 수정, 삭제를 누르면 이페이지로 넘어옴
	// cnum, cid, message, bnum을 가져옴
	
	int input_bnum = Integer.parseInt(request.getParameter("bnum"));
	int input_cnum = Integer.parseInt(request.getParameter("cnum"));
	String sid = request.getParameter("sid");
	//sid는 현재 로그인한 아이디
	CommentDAO dao = new CommentDAO();
	CommentDTO dto = dao.Select(input_cnum, input_bnum);
	
	String message = request.getParameter("message");
%>

<%
	if(sid.equals(dto.getCid())){
		if(message.equals("Update")){
			System.out.println("Update!");
	
			%>
			<script type="text/javascript">
				//Jquery 시작
				$(function(){
					$("#success").click(function(){
						//ajax실행
						var comment = document.querySelector("#comment").value;
						console.log(comment);
						
						$.ajax({
							url: "commentUpdateOk.jsp",
							data: {
								"cnum": <%= input_cnum%>,
								"bnum": <%= input_bnum%>,
								"comment": comment
							},
							success: function(){
								alert("수정 완료!");
								location.href="boardView.jsp?num="+<%= input_bnum%>;
								//OK!!
							}
						})//ajax end
					});	//click end
				});	//Jquery end
			</script>
			
			<%
			
		}else if(message.equals("Delete")){
			System.out.println("Delete!");
			dao.Delete(input_cnum, input_bnum);
			%>
			<script type="text/javascript">
				location.href="boardView.jsp?num="+<%= input_bnum%>;
			</script>
			<%
		}else{
			System.out.println("?????");
		}
	}else{
		%>
		<script type="text/javascript">
			alert("ID불일치! 권한이 없습니다!!");
			location.href="boardView.jsp?num="+<%= input_bnum%>;
		</script>
		<%
	}
%>

</head>
<body>



<Table>
	<tr>
		<td>댓글 수정</td>
		<td><input type="text" id="comment" value="<%= dto.getComment() %>"></td>
		<td><button type="button" id="success">수정</button></td>
	</tr>

</Table>


</body>
</html>