package entity;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Article {
	private int id;
	
	private int author;
	
	private String title;
	
	private String contents;
	
	private LocalDate boardTime;
	
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
	public LocalDate getBoardTime() {
		return boardTime;
	}
	public void setBoardTime(LocalDate localDate) {
		this.boardTime = localDate;
	}
	
}
