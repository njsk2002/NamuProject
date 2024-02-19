package board;

import java.sql.Date;

public class BoardCommentVO {
   private int cno,bno;
   private String writer,comment;
   private Date writedate;
   
   public BoardCommentVO() {
	 super();
   }

public BoardCommentVO(int cno, int bno, String writer, String comment, Date writedate) {
	super();
	this.cno = cno;
	this.bno = bno;
	this.writer = writer;
	this.comment = comment;
	this.writedate = writedate;
}

public int getCno() {
	return cno;
}

public void setCno(int cno) {
	this.cno = cno;
}

public int getBno() {
	return bno;
}

public void setBno(int bno) {
	this.bno = bno;
}

public String getWriter() {
	return writer;
}

public void setWriter(String writer) {
	this.writer = writer;
}

public String getComment() {
	return comment;
}

public void setComment(String comment) {
	this.comment = comment;
}

public Date getWritedate() {
	return writedate;
}

public void setWritedate(Date writedate) {
	this.writedate = writedate;
}
   
   
  
   

}
