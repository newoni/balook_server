package entity;

import java.time.LocalDateTime;

public class Article {
	private int id;
	
	private int author;
	
	private String title;
	
	private String contents;
	
	private LocalDateTime boardTime;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAuthor() {
		return author;
	}
	public void setAuthor(int author) {
		this.author = author;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public LocalDateTime getBoardTime() {
		return boardTime;
	}
	public void setBoardTime(LocalDateTime boardTime) {
		this.boardTime = boardTime;
	}
	
}
