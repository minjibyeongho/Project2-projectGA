<%@page import="bean.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	int cnum = Integer.parseInt(request.getParameter("cnum"));
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	String comment = request.getParameter("comment");
	
	
	CommentDAO dao = new CommentDAO();
	dao.Update(comment, cnum, bnum);

%>