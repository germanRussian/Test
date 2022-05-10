package domain;
import java.sql.Timestamp;


public class BoardVO {
	
	private int num;
	private String title;
	private String content;
	private String writer;
	private Timestamp writeDate;
	
	
	
	public BoardVO(int num, String title, String content, String writer, Timestamp writeDate) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.writeDate = writeDate;
	}
	
	
	
	
	
	
	public BoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}






	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	
	
	
	

}
