package com.ly.mybatis.model;

public class Mail {
	private int mid;
	private int isread;
	public int getIsread() {
		return isread;
	}

	private String tittle;
	private String content;
	private String mailfile;
	public void setIsread(int isread) {
		this.isread = isread;
	}

	public String getMailfile() {
		return mailfile;
	}

	public void setMailfile(String mailfile) {
		this.mailfile = mailfile;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public String getTittle() {
		return tittle;
	}

	public void setTittle(String tittle) {
		this.tittle = tittle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getSender() {
		return sender;
	}

	public void setSender(int sender) {
		this.sender = sender;
	}

	private String time;
	private int uid;
	private int sender;
	
	public Mail() {
			}

}
