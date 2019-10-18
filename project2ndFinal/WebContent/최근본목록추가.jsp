<%@page import="bean.TravelDAO"%>
<%@page import="bean.TravelDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      
      
      
      <%
      TravelDAO dao = new TravelDAO();
      String name = request.getParameter("text");
      TravelDTO dto = dao.select2(name);
      
         /* 장바구니 세션이 이미 있는지 없는지 체크 */
         ArrayList<TravelDTO> list = (ArrayList<TravelDTO>)session.getAttribute("travel");
         if(list==null) {
            /* 장바구니로 사용 할 arraylist생성 */
            list = new ArrayList<>();
            list.add(dto);
            
            session.setAttribute("travel", list);
                
         } else {
            list.add(dto);
            session.setAttribute("travel", list);
                if(list.size()>4){
                   list.remove(0);
                }
         }
      %>
      
<!--       <a href="basketView.jsp">장바구니 보러가기</a> -->