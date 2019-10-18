<%@page import="javax.swing.text.Document"%>
<%@page import="bean.MemberDTO"%>
<%@page import="bean.TravelDTO"%>
<%@page import="bean.TravelDAO"%>
<%@page import="bean.ListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.ListDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
   String command = request.getParameter("command");
   String value = request.getParameter("value");
   String UserId = (String)session.getAttribute("id");
   
   System.out.println("------------value °ªÀº" + value);
   
   ListDAO dao = new ListDAO();
   ListDTO dto = new ListDTO();
   
   TravelDAO tdao = new TravelDAO();
   TravelDTO tdto = tdao.select2(value);
   dto.setId(UserId);
   dto.setName(value);
   dto.setRegion(tdto.getRegion());
   dto.setPlace(tdto.getPlace());
   dto.setTheme(tdto.getTheme());
   dto.setMember(tdto.getMember());
   dto.setPicture(tdto.getPicture());
   
   
   if(command.equals("insert")){
      System.out.println("------------INSERT----------------");
      dao.insert(dto);
   }else if(command.equals("delete")){
      System.out.println("------------DELETE-------------");
      dao.delete(dto.getName());
   }
   
   
%>