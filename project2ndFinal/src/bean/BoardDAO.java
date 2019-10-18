package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class BoardDAO {

	DBConnectionMgr mgr;
	
	public BoardDAO(){
		mgr = DBConnectionMgr.getInstance();	//싱글톤으로 없으면 만들어주고 있으면 있는걸 당겨옴~
	}
	
	public ArrayList<BoardDTO> SelectAll() throws Exception{
		ArrayList<BoardDTO> list = new ArrayList<>();
		//1, 2단계를 해주는 DBConnectionMgr객체 필요
		Connection con = mgr.getConnection();	//mgr객체는 connection이 10개 만들어져 있고 이중 1개를 가져온 것을 의미
		ResultSet rs =null;
		
		
		//3단계. SQL문 결정
		String sql = "select * from board order by num desc";
		
		PreparedStatement ps = con.prepareStatement(sql);
		// 게시글 번호는 auto_increment로 자동으로 들어가니까 넣지 않는다.
		

		//4단계. SQL문 실행 요청
		rs = ps.executeQuery();
		
		//5단계. SQL문 실행 결과 Resultset에 가져오기
		
		BoardDTO dto = null;
		
		while(rs.next()) {
			dto = new BoardDTO();
			
			int num = rs.getInt(1);
			String title = rs.getString(2);
			String content = rs.getString(3);
			Date date1 = rs.getTimestamp(4);
			// date1 포맷 맞추기
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = sdf.format(date1);
			//
			String bpw = rs.getString(5);
			String bid = rs.getString(6);
			int hit = rs.getInt(7);
			
			dto.setNum(num);
			dto.setTitle(title);
			dto.setContent(content);
			dto.setDate(date);
			dto.setBpw(bpw);
			dto.setBid(bid);
			dto.setHit(hit);
			
			list.add(dto);	//dto를 완성해서 arraylist에 넣어줌
		}
		
		mgr.freeConnection(con, ps, rs);
		return list;
	}
	
	public BoardDTO Select(int idx) throws Exception{
		//1, 2단계를 해주는 DBConnectionMgr객체 필요
		Connection con = mgr.getConnection();	//mgr객체는 connection이 10개 만들어져 있고 이중 1개를 가져온 것을 의미
		ResultSet rs =null;
		
		
		//3단계. SQL문 결정
		String sql = "select * from board where num=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, idx);
		// 게시글 번호는 auto_increment로 자동으로 들어가니까 넣지 않는다.
		

		//4단계. SQL문 실행 요청
		rs = ps.executeQuery();
		
		
		//5단계. SQL문 실행 결과 Resultset에 가져오기
		
		BoardDTO dto = null;
		
		if(rs.next()) {
			dto = new BoardDTO();
			
			int num = rs.getInt(1);
			String title = rs.getString(2);
			String content = rs.getString(3);
			Date date1 = rs.getTimestamp(4);
			// date1 포맷 맞추기
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = sdf.format(date1);
			//
			String bpw = rs.getString(5);
			String bid = rs.getString(6);
			int hit = rs.getInt(7);
			hit++;	// select될 때 애초에 hit를 1개 올리고 갈 수 있게 설계
			
			dto.setNum(num);
			dto.setTitle(title);
			dto.setContent(content);
			dto.setDate(date);
			dto.setBpw(bpw);
			dto.setBid(bid);
			dto.setHit(hit);
		}
		
		mgr.freeConnection(con, ps, rs);
		return dto;
	}	
		
	public void Insert(BoardDTO dto) throws Exception{
		//1, 2단계를 해주는 DBConnectionMgr객체 필요
		Connection con = mgr.getConnection();	//mgr객체는 connection이 10개 만들어져 있고 이중 1개를 가져온 것을 의미
		
		//3단계. SQL문 결정
		String sql = "insert into board(title, content, date, bpw, bid, hit)  values(?,?,now(),?,?,0)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		// 게시글 번호는 auto_increment로 자동으로 들어가니까 넣지 않는다.
		ps.setString(1, dto.getTitle());
		ps.setString(2, dto.getContent());
		ps.setString(3, dto.getBpw());
		ps.setString(4, dto.getBid());

		//4단계. SQL문 실행 요청
		ps.executeUpdate();
		mgr.freeConnection(con, ps);
		
	}
	
	public void UpdateHit(int hit, int num) throws Exception{	//조회수 업데이트 하는 DAO
		//1, 2단계를 해주는 DBConnectionMgr객체 필요
		Connection con = mgr.getConnection();	//mgr객체는 connection이 10개 만들어져 있고 이중 1개를 가져온 것을 의미
		
		//3단계. SQL문 결정
		String sql = "update board set hit = ? where num = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		// 게시글 번호는 auto_increment로 자동으로 들어가니까 넣지 않는다.
		ps.setInt(1, hit);
		ps.setInt(2, num);

		//4단계. SQL문 실행 요청
		ps.executeUpdate();
		mgr.freeConnection(con, ps);
		
	}
	
	//update 미완성
	public void Update(String title, String content, int num) throws Exception{
		//1, 2단계를 해주는 DBConnectionMgr객체 필요
		Connection con = mgr.getConnection();	//mgr객체는 connection이 10개 만들어져 있고 이중 1개를 가져온 것을 의미
		
		//3단계. SQL문 결정
		String sql = "update board set title=?,content=? where num = ?";
		// num값을 물고 content, title을 바꿀 수 있도록
		PreparedStatement ps = con.prepareStatement(sql);
		// 게시글 번호는 auto_increment로 자동으로 들어가니까 넣지 않는다.
		ps.setString(1, title);
		ps.setString(2, content);
		ps.setInt(3, num);

		//4단계. SQL문 실행 요청
		ps.executeUpdate();
		mgr.freeConnection(con, ps);
		
	}
	
	public void Delete(int num) throws Exception{
		//1, 2단계를 해주는 DBConnectionMgr객체 필요
		Connection con = mgr.getConnection();	//mgr객체는 connection이 10개 만들어져 있고 이중 1개를 가져온 것을 의미
		
		//3단계. SQL문 결정
		String sql = "delete from board where num = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		// 게시글 번호는 auto_increment로 자동으로 들어가니까 넣지 않는다.
		ps.setInt(1, num);

		//4단계. SQL문 실행 요청
		ps.executeUpdate();
		mgr.freeConnection(con, ps);
		
	}
	
	
	
}
