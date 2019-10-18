package bean;

public class CommentDTO {

	int cnum;	// 댓글 번호
	String cid;	//댓글 쓰는 사람 id(현재 로그인한 사람의 id)
	String comment;	//댓글 내용
	String date;
	int bnum;	//댓글 달린 게시글의 번호
	
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	
	
	
}
