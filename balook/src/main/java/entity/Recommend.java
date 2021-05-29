package entity;

import java.time.LocalDateTime;

public class Recommend {
	private int id;
	
	private int author;
	
	private int targetArticle;
	
	private LocalDateTime date;

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

	public int getTargetArticle() {
		return targetArticle;
	}

	public void setTargetArticle(int targetArticle) {
		this.targetArticle = targetArticle;
	}

	public LocalDateTime getDate() {
		return date;
	}

	public void setDate(LocalDateTime date) {
		this.date = date;
	}
	
	
}
