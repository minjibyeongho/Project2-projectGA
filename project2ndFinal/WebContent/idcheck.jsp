<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");

	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		
		String url = "jdbc:mysql://localhost:3306/projectga";
		String user = "root";
		String password = "1234";
		
		con = DriverManager.getConnection(url, user, password);
		
		String sql = "select id from member where id = ?";
		ps = con.prepareStatement(sql);
		ps.setString(1, id);	//sql문의 ?에  requset를 받아온 id를 넣음
		
		rs = ps.executeQuery();		
		
		String id2 = null;
		if(rs.next()){
			id2 = rs.getString(1);	// 있으면 가져 왔을 것
		}
		System.out.println("id2 =" +id2);
		
		if(id.equals(id2)){
			out.write("중복된 아이디입니다");
		}else if(id2 == null){
			out.write("사용가능한 아이디 입니다");
		}else{
			out.write("사용가능한 아이디 입니다");
		}
		
		ps.executeUpdate();
				
		
	}catch(Exception e){
		e.printStackTrace();
	}	


%>
