package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TravelDAO {
   DBConnectionMgr mgr;

   public TravelDAO() {
   mgr = DBConnectionMgr.getInstance();
   }
   // dao의 단계를 조금 효율적으로 변경
   
   // insert
   public void insert(TravelDTO dto) throws Exception {
      Class.forName("com.mysql.jdbc.Driver");
      String url = "jdbc:mysql://localhost:3306/projectga";
      String user = "root";
      String password ="1234";
      
      Connection con;
      PreparedStatement ps;
      
      try {
         Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection(url, user, password);
         String sql = "insert into travel values(?,?,?,?,?)";
         ps = con.prepareStatement(sql);
         ps.setString(1, dto.getName());
         ps.setString(2, dto.getRegion());
         ps.setString(3, dto.getPlace());
         ps.setString(4, dto.getTheme());
         ps.setString(5, dto.getMember());
         ps.executeUpdate();
      } catch (Exception e) {
      } // catch

      System.out.println("insert :"+dto.getName());
   } // insert
   
   // select - 여행지 정보 불러와서 각 지역 페이지에 삽입
   public void select(String inputName) throws Exception{
      TravelDTO dto = null;
      Class.forName("com.mysql.jdbc.Driver");
      String url = "jdbc:mysql://localhost:3306/projectga";
      String user = "root";
      String password ="1234";
      
      Connection con;
      PreparedStatement ps;
      ResultSet rs;
      
      try {
         Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection(url, user, password);
         String sql = "select * from travel";
         ps = con.prepareStatement(sql);
         ps.setString(1, inputName);
         rs = ps.executeQuery();
         
         if (rs.next()) { 
            dto = new TravelDTO();
            
            String name = rs.getString(1);  
            String region = rs.getString(2);  
            String place = rs.getString(3);  
            String theme = rs.getString(4);  
            String member = rs.getString(5);  
            
            dto.setName(name);
            dto.setRegion(region);
            dto.setPlace(place);
            dto.setTheme(theme);
            dto.setMember(member);
            ps.executeUpdate();
            
            mgr.freeConnection(con, ps);
            } // if
         } catch (Exception e) {
         } // catch
      } // select

   public ArrayList selectAll() throws Exception{
         ArrayList list = new ArrayList();
         Connection con = mgr.getConnection();
         TravelDTO dto = null; //변수의 생존범위 = 선언의 위치
         
            //3. SQL문 결정(객체화)
            String sql = "select * from travel";
            PreparedStatement ps = con.prepareStatement(sql);
            System.out.println("SQL문 객체화 OK");
            //4. SQL문 전송
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
               dto = new TravelDTO();
               String name = rs.getString(1);
               String region = rs.getString(2);
               String place = rs.getString(3);
               String theme = rs.getString(4);
               String member = rs.getString(5);
               String picture = rs.getString(6);
               
               dto.setName(name);
               dto.setRegion(region);
               dto.setPlace(place);
               dto.setTheme(theme);
               dto.setMember(member);
               dto.setPicture(picture);
               
               list.add(dto);
            }
            System.out.println("SQL문 전송 OK");
            
            try {
               rs.close();
               ps.close();
               con.close();
            } catch (SQLException e) {
               //e.printStackTrace();
               System.out.println("자운 해제 중 에러 발생!!");
            }
      return list;
   }   
   

   public TravelDTO select2(String pname) throws Exception{
      //1.2 단계를 해주는 DBConni 드라이버 설정
      Connection con = mgr.getConnection();
      
      
      String sql = "select * from travel where name = ?";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1, pname);
      TravelDTO dto = null;
      
      ResultSet rs = ps.executeQuery();
      while(rs.next()) {
         dto = new TravelDTO();
            String name = rs.getString(1);
            String region = rs.getString(2);
            String place = rs.getString(3);
            String theme = rs.getString(4);
            String member = rs.getString(5);
            String picture = rs.getString(6);
            
            dto.setName(name);
            dto.setRegion(region);
            dto.setPlace(place);
            dto.setTheme(theme);
            dto.setMember(member);
            dto.setPicture(picture);
            System.out.println("dto region 값 :"+region);
      }
      mgr.freeConnection(con, ps, rs);
      return dto;
   }

   public ArrayList<TravelDTO> selectpart(String column, String value) throws Exception{
      ArrayList<TravelDTO> list = new ArrayList<TravelDTO>();
      Connection con = mgr.getConnection();
      
      String str[] = new String[7];
      TravelDTO dto = null; //변수의 생존범위 = 선언의 위치
      
         //3. SQL문 결정(객체화)
            String sql = "select * from travel where region = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, value);
            //ps.setString(2, value);
         //4. SQL문 전송
         ResultSet rs = ps.executeQuery();
         while(rs.next()) {
            dto = new TravelDTO();
            str[0] = rs.getString(1);
            str[1] = rs.getString(2);
            str[2] = rs.getString(3);
            str[3] = rs.getString(4);
            str[4] = rs.getString(5);
            str[5] = rs.getString(6);
            dto.setName(str[0]);
            dto.setRegion(str[1]);
            dto.setPlace(str[2]);
            dto.setTheme(str[3]);
            dto.setMember(str[4]);
            dto.setPicture(str[5]);
            list.add(dto);               
         }
         
      mgr.freeConnection(con, ps, rs);
   return list;
}      
   
   
   
   
   
} // class