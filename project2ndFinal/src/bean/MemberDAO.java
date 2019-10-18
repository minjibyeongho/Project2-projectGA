package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {
	DBConnectionMgr mgr;
	
	public MemberDAO(){
		mgr = DBConnectionMgr.getInstance();	//싱글톤으로 없으면 만들어주고 있으면 있는걸 당겨옴~
	}

	public MemberDTO FindPW(MemberDTO dto) throws Exception{
		//1, 2단계를 해주는 DBConnectionMgr객체 필요
		Connection con = mgr.getConnection();	//mgr객체는 connection이 10개 만들어져 있고 이중 1개를 가져온 것을 의미
		
		//3단계. SQL문 결정
		String sql = "select * from member where id=? and tel=? and year=? and month=? and day=? and email1=? and email2=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());
		ps.setString(2, dto.getTel());
		ps.setString(3, dto.getYear());
		ps.setString(4, dto.getMonth());
		ps.setString(5, dto.getDay());
		ps.setString(6, dto.getEmail1());
		ps.setString(7, dto.getEmail2());
		
		
		//4단계. SQL문 실행 요청
		ResultSet rs = ps.executeQuery();
		MemberDTO dto2 = null;
		
		
		while(rs.next()) {
			dto2 = new MemberDTO();
			String id = rs.getString(1);
			String pw = rs.getString(2);
			String name = rs.getString(3);
			String gender = rs.getString(4);
			String tel = rs.getString(5);
			String year = rs.getString(6);
			String month = rs.getString(7);
			String day = rs.getString(8);
			String email1 = rs.getString(9);
			String email2 = rs.getString(10);
			String addr = rs.getString(11);
			
			
			dto2.setId(id);
			dto2.setPw(pw);
			dto2.setName(name);
			dto2.setGender(gender);
			dto2.setTel(tel);
			dto2.setYear(year);
			dto2.setMonth(month);
			dto2.setDay(day);
			dto2.setEmail1(email1);
			dto2.setEmail2(email2);
			dto2.setAddr(addr);
			
		}
		
		mgr.freeConnection(con, ps, rs);
		return dto2;
		
	}	
	
	public MemberDTO FindID(MemberDTO dto) throws Exception{
		//1, 2단계를 해주는 DBConnectionMgr객체 필요
		Connection con = mgr.getConnection();	//mgr객체는 connection이 10개 만들어져 있고 이중 1개를 가져온 것을 의미
		
		//3단계. SQL문 결정
		String sql = "select * from member where name=? and tel=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getName());
		ps.setString(2, dto.getTel());
		
		
		//4단계. SQL문 실행 요청
		ResultSet rs = ps.executeQuery();
		MemberDTO dto2 = null;
		
		
		while(rs.next()) {
			dto2 = new MemberDTO();
			String id = rs.getString(1);
			String pw = rs.getString(2);
			String name = rs.getString(3);
			String gender = rs.getString(4);
			String tel = rs.getString(5);
			String year = rs.getString(6);
			String month = rs.getString(7);
			String day = rs.getString(8);
			String email1 = rs.getString(9);
			String email2 = rs.getString(10);
			String addr = rs.getString(11);
			
			
			dto2.setId(id);
			dto2.setPw(pw);
			dto2.setName(name);
			dto2.setGender(gender);
			dto2.setTel(tel);
			dto2.setYear(year);
			dto2.setMonth(month);
			dto2.setDay(day);
			dto2.setEmail1(email1);
			dto2.setEmail2(email2);
			dto2.setAddr(addr);
			
		}
		
		mgr.freeConnection(con, ps, rs);
		return dto2;
		
	}	

	public String SelectId(String idcheck) throws Exception{
		//1, 2단계를 해주는 DBConnectionMgr객체 필요
		Connection con = mgr.getConnection();	//mgr객체는 connection이 10개 만들어져 있고 이중 1개를 가져온 것을 의미
		
		//3단계. SQL문 결정
		String sql = "select * from member where id=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, idcheck);
		
		
		//4단계. SQL문 실행 요청
		ResultSet rs = ps.executeQuery();
		String id = null;
		
		if(rs.next()) {	//true
			id = rs.getString(1);
		}
		//false일땐 null로 반환됨
		
		mgr.freeConnection(con, ps, rs);
		return id;
		
	}	
	
	public ArrayList<MemberDTO> SelectAll() throws Exception{
		//arraylist 객체 생성
		ArrayList<MemberDTO> list = new ArrayList<>();
		
		//1, 2단계를 해주는 DBConnectionMgr객체 필요
		Connection con = mgr.getConnection();	//mgr객체는 connection이 10개 만들어져 있고 이중 1개를 가져온 것을 의미
		
		//3단계. SQL문 결정
		String sql = "select * from member";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		//4단계. SQL문 실행 요청
		ResultSet rs = ps.executeQuery();
		MemberDTO dto2 = null;
		
		while(rs.next()) {
			dto2 = new MemberDTO();
			String id = rs.getString(1);
			String pw = rs.getString(2);
			String name = rs.getString(3);
			String gender = rs.getString(4);
			String tel = rs.getString(5);
			String year = rs.getString(6);
			String month = rs.getString(7);
			String day = rs.getString(8);
			String email1 = rs.getString(9);
			String email2 = rs.getString(10);
			String addr = rs.getString(11);
			
			
			dto2.setId(id);
			dto2.setPw(pw);
			dto2.setName(name);
			dto2.setGender(gender);
			dto2.setTel(tel);
			dto2.setYear(year);
			dto2.setMonth(month);
			dto2.setDay(day);
			dto2.setEmail1(email1);
			dto2.setEmail2(email2);
			dto2.setAddr(addr);
			
			list.add(dto2);	//arraylist에 dto객체를 순차적으로 넣음
		}
		
		mgr.freeConnection(con, ps, rs);
		return list;
		
	}	
	
	public MemberDTO Select(MemberDTO dto) throws Exception{
		//1, 2단계를 해주는 DBConnectionMgr객체 필요
		Connection con = mgr.getConnection();	//mgr객체는 connection이 10개 만들어져 있고 이중 1개를 가져온 것을 의미
		
		//3단계. SQL문 결정
		String sql = "select * from member where id=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());
		
		
		//4단계. SQL문 실행 요청
		ResultSet rs = ps.executeQuery();
		MemberDTO dto2 = null;
		
		
		while(rs.next()) {
			dto2 = new MemberDTO();
			String id = rs.getString(1);
			String pw = rs.getString(2);
			String name = rs.getString(3);
			String gender = rs.getString(4);
			String tel = rs.getString(5);
			String year = rs.getString(6);
			String month = rs.getString(7);
			String day = rs.getString(8);
			String email1 = rs.getString(9);
			String email2 = rs.getString(10);
			String addr = rs.getString(11);
			
			
			dto2.setId(id);
			dto2.setPw(pw);
			dto2.setName(name);
			dto2.setGender(gender);
			dto2.setTel(tel);
			dto2.setYear(year);
			dto2.setMonth(month);
			dto2.setDay(day);
			dto2.setEmail1(email1);
			dto2.setEmail2(email2);
			dto2.setAddr(addr);
			
		}
		
		mgr.freeConnection(con, ps, rs);
		return dto2;
		
	}
	
	public void Delete(MemberDTO dto) throws Exception{
		//1, 2단계를 해주는 DBConnectionMgr객체 필요
		Connection con = mgr.getConnection();	//mgr객체는 connection이 10개 만들어져 있고 이중 1개를 가져온 것을 의미
		
		//3단계. SQL문 결정
		String sql = "delete from member where id=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());
		
		//4단계. SQL문 실행 요청
		ps.executeUpdate();
		mgr.freeConnection(con, ps);
	}
		
	public void Update(MemberDTO dto) throws Exception{
		//1, 2단계를 해주는 DBConnectionMgr객체 필요
		Connection con = mgr.getConnection();	//mgr객체는 connection이 10개 만들어져 있고 이중 1개를 가져온 것을 의미
		
		//3단계. SQL문 결정
		String sql = "update member set id=?,pw=?,name=?,gender=?,tel=?,year=?,month=?,day=?,email1=?,email2=?,addr=? where id=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());
		ps.setString(2, dto.getPw());
		ps.setString(3, dto.getName());
		ps.setString(4, dto.getGender());
		ps.setString(5, dto.getTel());
		ps.setString(6, dto.getYear());
		ps.setString(7, dto.getMonth());
		ps.setString(8, dto.getDay());
		ps.setString(9, dto.getEmail1());
		ps.setString(10, dto.getEmail2());
		ps.setString(11, dto.getAddr());
		ps.setString(12, dto.getId());
		
		//4단계. SQL문 실행 요청
		ps.executeUpdate();
		mgr.freeConnection(con, ps);
	}
	
	public void Insert(MemberDTO dto) throws Exception{
		//1, 2단계를 해주는 DBConnectionMgr객체 필요
		Connection con = mgr.getConnection();	//mgr객체는 connection이 10개 만들어져 있고 이중 1개를 가져온 것을 의미
		
		//3단계. SQL문 결정
		String sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());
		ps.setString(2, dto.getPw());
		ps.setString(3, dto.getName());
		ps.setString(4, dto.getGender());
		ps.setString(5, dto.getTel());
		ps.setString(6, dto.getYear());
		ps.setString(7, dto.getMonth());
		ps.setString(8, dto.getDay());
		ps.setString(9, dto.getEmail1());
		ps.setString(10, dto.getEmail2());
		ps.setString(11, dto.getAddr());

		//4단계. SQL문 실행 요청
		ps.executeUpdate();
		mgr.freeConnection(con, ps);
		
	}
}
