package entity;

import java.time.LocalDateTime;

public class Follow {
	private int id;
	
	private int followerID;
	
	private int followedId;
	
	private LocalDateTime date;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getFollowerID() {
		return followerID;
	}

	public void setFollowerID(int followerID) {
		this.followerID = followerID;
	}

	public int getFollowedId() {
		return followedId;
	}

	public void setFollowedId(int followedId) {
		this.followedId = followedId;
	}

	public LocalDateTime getDate() {
		return date;
	}

	public void setDate(LocalDateTime date) {
		this.date = date;
	}
	
	
}
