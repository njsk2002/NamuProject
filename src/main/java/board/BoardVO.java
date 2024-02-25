package board;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int bno,readcnt;
	private String bid,title, content, writer, filename, filepath , mfilepath , detail;
	private Date writedate;
	
	public BoardVO() {
		super();
	}

	public BoardVO(int bno, int readcnt, String bid, String title, String content, String writer, String filename,
			String filepath, String mfilepath, String detail, Date writedate) {
		super();
		this.bno = bno;
		this.readcnt = readcnt;
		this.bid = bid;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.filename = filename;
		this.filepath = filepath;
		this.mfilepath = mfilepath;
		this.detail = detail;
		this.writedate = writedate;
	}

	
	
}
