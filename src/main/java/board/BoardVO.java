package board;

import java.sql.Date;

public class BoardVO {
	private int bno,readcnt;
	private String bid,title, content, writer, filename, filepath;
	private Date writedate;
	
	public BoardVO() {
		super();
	}

	public BoardVO(int bno, int readcnt, String bid, String title, String content, String writer, String filename,
			String filepath, Date writedate) {
		super();
		this.bno = bno;
		this.readcnt = readcnt;
		this.bid = bid;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.filename = filename;
		this.filepath = filepath;
		this.writedate = writedate;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	public String getBid() {
		return bid;
	}

	public void setBid(String bid) {
		this.bid = bid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	
	
	

	
	
}
