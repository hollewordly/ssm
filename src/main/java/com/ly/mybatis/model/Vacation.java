package com.ly.mybatis.model;

public class Vacation {
	private Integer vid;
	private Integer uid;
	private String username;
	private String begin;
	private String end;
	private String day;
	private String reason;
	private Integer approver;
	private Integer isapprove;
	public Integer getVid() {
		return vid;
	}
	public void setVid(Integer vid) {
		this.vid = vid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getBegin() {
		return begin;
	}
	public void setBegin(String begin) {
		this.begin = begin;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}

	public Integer getApprover() {
		return approver;
	}
	public void setApprover(Integer approver) {
		this.approver = approver;
	}
	public Integer getIsapprove() {
		return isapprove;
	}
	public void setIsapprove(Integer isapprove) {
		this.isapprove = isapprove;
	}

	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Vacation() {
		
	}

}
