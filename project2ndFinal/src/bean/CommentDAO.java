package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class CommentDAO {

	DBConnectionMgr mgr;
	
	public CommentDAO(){
		mgr = DBConnectionMgr.getInstance();	//싱글톤으로 없으면 만들어주고 있으면 있는걸 당겨옴~
	}
	// selectAll 미완성
	public ArrayList<CommentDTO> SelectBnum(int idx) throws Exception{
		ArrayList<CommentDTO> list = new ArrayList<>();
		//1, 2단계를 해주는 DBConnectionMgr객체 필요
		Connection con = mgr.getConnection();	//mgr객체는 connection이 10개 만들어져 있고 이중 1개를 가져온 것을 의미
		ResultSet rs =null;
		
		
		//3단계. SQL문 결정
		String sql = "select * from comment where bnum = ? order by cnum desc";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, idx);
		// 게시글 번호는 auto_increment로 자동으로 들어가니까 넣지 않는다.
		

		//4단계. SQL문 실행 요청
		rs = ps.executeQuery();
		
		//5단계. SQL문 실행 결과 Resultset에 가져오기
		
		CommentDTO dto = null;
		
		while(rs.next()) {
			dto = new CommentDTO();
			
			int cnum = rs.getInt(1);
			String cid = rs.getString(2);
			String comment = rs.getString(3);
			Date date1 = rs.getTimestamp(4);
			// date1 포맷 맞추기
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = sdf.format(date1);
			//
			int bnum = rs.getInt(5);
			
			dto.setCnum(cnum);
			dto.setCid(cid);
			dto.setComment(comment);
			dto.setDate(date);
			dto.setBnum(bnum);
			
			
			list.add(dto);	//dto를 완성해서 arraylist에 넣어줌
		}
		
		mgr.freeConnection(con, ps, rs);
		return list;
	}
	
	//select로 bnum값에 따른 댓글들을 모조리 가져와서 cnum 내림차순으로 조회해서 띄우게끔 구현
	
	//select = 댓글 수정을 위한 게시물 가져오는 메소드
	public CommentDTO Select(int input_cnum, int input_bnum) throws Exception{
		//1, 2단계를 해주는 DBConnectionMgr객체 필요
		Connection con = mgr.getConnection();	//mgr객체는 connection이 10개 만들어져 있고 이중 1개를 가져온 것을 의미
		ResultSet rs =null;
		
		
		//3단계. SQL문 결정
		String sql = "select * from comment where cnum = ? and bnum=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, input_cnum);
		ps.setInt(2, input_bnum);
		// 게시글 번호는 auto_increment로 자동으로 들어가니까 넣지 않는다.
		

		//4단계. SQL문 실행 요청
		rs = ps.executeQuery();
		
		//5단계. SQL문 실행 결과 Resultset에 가져오기
		
		CommentDTO dto = null;
		
		if(rs.next()) {
			dto = new CommentDTO();
			
			int cnum = rs.getInt(1);
			String cid = rs.getString(2);
			String comment = rs.getString(3);
			Date date1 = rs.getTimestamp(4);
			// date1 포맷 맞추기
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = sdf.format(date1);
			//
			int bnum = rs.getInt(5);
			
			dto.setCnum(cnum);
			dto.setCid(cid);
			dto.setComment(comment);
			dto.setDate(date);
			dto.setBnum(bnum);
		}
		
		mgr.freeConnection(con, ps, rs);
		return dto;
	}
	
	// insert
	public void Insert(CommentDTO dto) throws Exception{
		//1, 2단계를 해주는 DBConnectionMgr객체 필요
		Connection con = mgr.getConnection();	//mgr객체는 connection이 10개 만들어져 있고 이중 1개를 가져온 것을 의미
		
		//3단계. SQL문 결정
		String sql = "insert into comment(cid, comment, date, bnum)  values(?,?,now(),?)";
		
		//cnum은 auto_increment로  자동으로 들어가고, bnum은 게시글 번호
		PreparedStatement ps = con.prepareStatement(sql);
		// 게시글 번호는 auto_increment로 자동으로 들어가니까 넣지 않는다.
		ps.setString(1, dto.getCid());
		ps.setString(2, dto.getComment());
		ps.setInt(3, dto.getBnum());
		
		//4단계. SQL문 실행 요청
		ps.executeUpdate();
		mgr.freeConnection(con, ps);
		
	}
	
	public void Update(String comment, int cnum, int bnum) throws Exception{
		//1, 2단계를 해주는 DBConnectionMgr객체 필요
		Connection con = mgr.getConnection();	//mgr객체는 connection이 10개 만들어져 있고 이중 1개를 가져온 것을 의미
		
		//3단계. SQL문 결정
		String sql = "update comment set comment=? where cnum=? and bnum=?";
		
		//cnum은 auto_increment로  자동으로 들어가고, bnum은 게시글 번호
		PreparedStatement ps = con.prepareStatement(sql);
		// 게시글 번호는 auto_increment로 자동으로 들어가니까 넣지 않는다.
		ps.setString(1, comment);
		ps.setInt(2, cnum);
		ps.setInt(3, bnum);
		
		//4단계. SQL문 실행 요청
		ps.executeUpdate();
		mgr.freeConnection(con, ps);
		
	}
	
	public void Delete(int cnum, int bnum) throws Exception{
		//1, 2단계를 해주는 DBConnectionMgr객체 필요
		Connection con = mgr.getConnection();	//mgr객체는 connection이 10개 만들어져 있고 이중 1개를 가져온 것을 의미
		
		//3단계. SQL문 결정
		String sql = "delete from comment where cnum=? and bnum=?";
		
		//cnum은 auto_increment로  자동으로 들어가고, bnum은 게시글 번호
		PreparedStatement ps = con.prepareStatement(sql);
		// 게시글 번호는 auto_increment로 자동으로 들어가니까 넣지 않는다.
		ps.setInt(1, cnum);
		ps.setInt(2, bnum);
		
		//4단계. SQL문 실행 요청
		ps.executeUpdate();
		mgr.freeConnection(con, ps);
		
	}
	
	
}
