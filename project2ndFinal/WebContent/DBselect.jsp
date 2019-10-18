<%@page import="java.util.HashSet"%>
<%@page import="java.util.TreeSet"%>
<%@page import="com.mysql.cj.xdevapi.JsonString"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.TravelDAO"%>
<%@page import="bean.TravelDTO"%>
<%@taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

   
<% 
   
   
   String id = request.getParameter("val");
   String UserId = (String)session.getAttribute("id");
   out.write("ajax 작동 성공");
   out.write("아이디값은" + id);
   
   TravelDAO dao = new TravelDAO();
   ArrayList<TravelDTO> list = dao.selectpart("region",id);
   ArrayList listDum =new ArrayList<>();

   ArrayList write = new ArrayList();
      
   
   for(int i=0; i<list.size();i++){
      TravelDTO dto = list.get(i);
      String place = dto.getPlace();
      boolean same = true;
      
      for(int j=0;j<write.size();j++){
         if(place.equals(write.get(j) )){

            same= false;
         }   
      }
      if(same=true){
         write.add(place);
      }
   }
   
   try{
      ArrayList result = new ArrayList(new HashSet(write));
      session.setAttribute("place",result);
      session.setAttribute("region",id);
   }catch(Exception e){
       System.out.println("세션 값 설정 터짐");
   }
   
   
   
%>
   
   
   
   
   