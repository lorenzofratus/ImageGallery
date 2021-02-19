package it.polimi.tiw.lf.gallery.beans;

import java.util.Date;

public class Image {
	private int id;
	private String title;
	private String description;
	private Date date;
	private String src;
	private int album;
	
	public int getId() { return id; }
	public void setId(int id) { this.id = id; }
	
	public String getTitle() { return title; }
	public void setTitle(String title) { this.title = title; }
	
	public String getDescription() { return description; }
	public void setDescription(String description) { this.description = description; }
	
	public Date getDate() { return date; }
	public void setDate(Date date) { this.date = date; }
	
	public String getSrc() { return src; }
	public void setSrc(String src) { this.src = src; }
	
	public int getAlbum() { return album; }
	public void setAlbum(int album) { this.album = album; }		
}
