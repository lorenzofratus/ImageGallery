package it.polimi.tiw.lf.gallery.beans;

import java.util.Date;

public class Album {
	private int id;
	private String title;
	private Date date;
	
	public int getId() { return id; }
	public void setId(int id) { this.id = id; }
	
	public String getTitle() { return title; }
	public void setTitle(String title) { this.title = title; }
	
	public Date getDate() { return date; }
	public void setDate(Date date) { this.date = date; }
}
