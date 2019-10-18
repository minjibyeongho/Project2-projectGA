package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ListDAO {
   DBConnectionMgr mgr;
   private String table = "list";
   
   
   public ListDAO() {
   mgr = DBConnectionMgr.getInstance();
   }
   
   

   public ArrayList<ListDTO> selectAll(String pid) throws Exception{
      ArrayList<ListDTO> list = new ArrayList();
      Connection con = mgr.getConnection();
      
      ListDTO dto = null; //변수의 생존범위 = 선언의 위치
      
         //3. SQL문 결정(객체화)
         String sql = "select * from "+table+" where id =?";
         PreparedStatement ps = con.prepareStatement(sql);
         //4. SQL문 전송
         ps.setString(1, pid);
         ResultSet rs = ps.executeQuery();
         System.out.println(sql);
         
         while(rs.next()) {
            dto = new ListDTO();
            String id = rs.getString(1);
            String name = rs.getString(2);
            String region = rs.getString(3);
            String place = rs.getString(4);
            String theme = rs.getString(5);
            String member = rs.getString(6);
            String picture = rs.getString(7);
            dto.setId(id);
            dto.setName(name);
            dto.setRegion(region);
            dto.setPlace(place);
            dto.setTheme(theme);
            dto.setMember(member);
            dto.setPicture(picture);
            
            list.add(dto);
         }
         
      mgr.freeConnection(con, ps, rs);
   return list;
}   

   public ArrayList<ListDTO> selectPart(String id,String column, String value) throws Exception{
      ArrayList<ListDTO> list = new ArrayList<ListDTO>();
      Connection con = mgr.getConnection();
      
      String str[] = new String[7];
      ListDTO dto = null; //변수의 생존범위 = 선언의 위치
      
         //3. SQL문 결정(객체화)
         String sql = "select * from "+table;
         PreparedStatement ps = con.prepareStatement(sql);
         //4. SQL문 전송
         ResultSet rs = ps.executeQuery();
         boolean same = false;
         while(rs.next()) {
            dto = new ListDTO();
            str[0] = rs.getString(1);
            str[1] = rs.getString(2);
            str[2] = rs.getString(3);
            str[3] = rs.getString(4);
            str[4] = rs.getString(5);
            str[5] = rs.getString(6);
            str[6] = rs.getString(7);
            dto.setId(str[0]);
            dto.setName(str[1]);
            dto.setRegion(str[2]);
            dto.setPlace(str[3]);
            dto.setTheme(str[4]);
            dto.setMember(str[5]);
            dto.setPicture(str[6]);
            if(column.equals("id")) {
               same = str[0].equals(value);
            }
            if(column.equals("name")) {
               same = str[1].equals(value);
            }
            if(column.equals("region")) {
               same = str[2].equals(value);
            }
            if(column.equals("place")) {
               same = str[3].equals(value);
            }
            if(column.equals("theme")) {
               same = str[4].equals(value);
            }
            if(column.equals("member")) {
               same = str[5].equals(value);
            }
            if(same == true) {
               list.add(dto);               
            }
         }
         
      mgr.freeConnection(con, ps, rs);
   return list;
}   

   public ArrayList<ListDTO> selectpart(String id,String column, String value) throws Exception{
      ArrayList<ListDTO> list = new ArrayList<ListDTO>();
      Connection con = mgr.getConnection();
      
      String str[] = new String[7];
      ListDTO dto = null; //변수의 생존범위 = 선언의 위치
      
         //3. SQL문 결정(객체화)
         String sql = "select * from "+table+" where "+column+" = ?and id=?";
         PreparedStatement ps = con.prepareStatement(sql);
         ps.setString(1, column);
         ps.setString(2, id);
         //4. SQL문 전송
         ResultSet rs = ps.executeQuery();
         boolean same = false;
         while(rs.next()) {
            dto = new ListDTO();
            str[0] = rs.getString(1);
            str[1] = rs.getString(2);
            str[2] = rs.getString(3);
            str[3] = rs.getString(4);
            str[4] = rs.getString(5);
            str[5] = rs.getString(6);
            str[6] = rs.getString(7);
            dto.setId(str[0]);
            dto.setName(str[1]);
            dto.setRegion(str[2]);
            dto.setPlace(str[3]);
            dto.setTheme(str[4]);
            dto.setMember(str[5]);
            dto.setPicture(str[6]);
            
            list.add(dto);               
         }
         
      mgr.freeConnection(con, ps, rs);
   return list;
}   
   
      public ListDTO select(String pname) throws Exception{
         //1.2 단계를 해주는 DBConni 드라이버 설정
         Connection con = mgr.getConnection();
         
         
         String sql = "select * from "+table+" where name = ?";
         PreparedStatement ps = con.prepareStatement(sql);
         ps.setString(1, pname);
         ListDTO dto = null;
         
         ResultSet rs = ps.executeQuery();
         while(rs.next()) {
            dto = new ListDTO();
            String id = rs.getString(1);
            String name = rs.getString(2);
            String region = rs.getString(3);
            String place = rs.getString(4);
            String theme = rs.getString(5);
            String member = rs.getString(6);
            String picture = rs.getString(7);
            dto.setId(id);
            dto.setName(name);
            dto.setRegion(region);
            dto.setPlace(place);
            dto.setTheme(theme);
            dto.setMember(member);
            dto.setPicture(picture);
            
         }
         mgr.freeConnection(con, ps, rs);
         return dto;
      }
      public void insert(ListDTO dto) throws Exception{
      //1.2 단계를 해주는 DBConni 드라이버 설정
   
      Connection con = mgr.getConnection();
      
      
      String sql = "insert into "+table+" values(?,?,?,?,?,?,?)";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1, dto.getId());
      ps.setString(2, dto.getName());
      ps.setString(3, dto.getRegion());
      ps.setString(4, dto.getPlace());
      ps.setString(5, dto.getTheme());
      ps.setString(6, dto.getMember());
      ps.setString(7, dto.getPicture());

      ps.executeUpdate();
      //  
      }
      public void update(ListDTO dto) throws Exception{
         //1.2 단계를 해주는 DBConni 드라이버 설정
      
         Connection con = mgr.getConnection();
         
         
         String sql = "update "+table+" set id =?, name = ?, region=?,place=?,theme=?,member=? where id = ?";
         PreparedStatement ps = con.prepareStatement(sql);
         ps.setString(1, dto.getId());
         ps.setString(2, dto.getName());
         ps.setString(3, dto.getRegion());
         ps.setString(4, dto.getPlace());
         ps.setString(5, dto.getTheme());
         ps.setString(6, dto.getMember());
         ps.setString(7, dto.getPicture());
         ps.setString(8, dto.getId());
         //  
         ps.executeUpdate();
         mgr.freeConnection(con, ps);
         }
      public void delete(String name) throws Exception{

         Connection con = mgr.getConnection();
         
         String sql = "delete from "+table+" where name = ?";
         PreparedStatement ps = con.prepareStatement(sql);
         ps.setString(1, name);
         ps.executeUpdate();
         mgr.freeConnection(con, ps);
      }
      
      public ArrayList<ListDTO> search(String id,String region, String place,String member) throws Exception{
          ArrayList<ListDTO> list = new ArrayList<ListDTO>();
          Connection con = mgr.getConnection();
          
          String str[] = new String[7];
          ListDTO dto = null; //변수의 생존범위 = 선언의 위치

          System.out.println("palce : "+place);  
             //3. SQL문 결정(객체화)
             String sql = "select * from list where region = ?and id=?";
             PreparedStatement ps = con.prepareStatement(sql);
             ps.setString(1, region);
             ps.setString(2, id);
             //4. SQL문 전송
             System.out.println(sql);
             ResultSet rs = ps.executeQuery();
             boolean same = false;
             while(rs.next()) {
                dto = new ListDTO();
                str[0] = rs.getString(1);
                str[1] = rs.getString(2);
                str[2] = rs.getString(3);
                str[3] = rs.getString(4);
                str[4] = rs.getString(5);
                str[5] = rs.getString(6);
                str[6] = rs.getString(7);
                dto.setId(str[0]);
                dto.setName(str[1]);
                dto.setRegion(str[2]);
                dto.setPlace(str[3]);
                dto.setTheme(str[4]);
                dto.setMember(str[5]);
                dto.setPicture(str[6]);
                
                System.out.println("palce : "+place);
                System.out.println("getplace : "+dto.getPlace());
                if( (! place.equals("전체") )){

                    System.out.println("값 있음");
                   if( place.equals(dto.getPlace()) ) {
                      System.out.println("if 문");
                      list.add(dto);
                   }
                      
                   
                }else {
                   System.out.println("전체 작동");
                   list.add(dto);        
                }
             }
             
          mgr.freeConnection(con, ps, rs);
       return list;
    }   
       
}