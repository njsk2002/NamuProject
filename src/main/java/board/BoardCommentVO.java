package board;

import java.sql.Date;

import lombok.Data;
@Data
public class BoardCommentVO {
   private int cno,bno;
   private String writer,comment, name;
   private Date writedate;
   
   public BoardCommentVO() {
	 super();
   }

public BoardCommentVO(int cno, int bno, String writer, String comment, String name, Date writedate) {
	super();
	this.cno = cno;
	this.bno = bno;
	this.writer = writer;
	this.comment = comment;
	this.name = name;
	this.writedate = writedate;
}




}
