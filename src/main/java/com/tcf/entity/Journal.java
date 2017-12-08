package com.tcf.entity;

import java.sql.Timestamp;

/**
 * Journal entity. @author MyEclipse Persistence Tools
 */

public class Journal implements java.io.Serializable,Entity {

	// Fields

	private Integer id;
	private Userinfo userinfo;
	private String title;
	private String content;
	private Timestamp publishDate;
	private Timestamp updateDate;
	private Boolean isDelete;

	// Constructors

	/** default constructor */
	public Journal() {
	}

	/** minimal constructor */
	public Journal(String title) {
		this.title = title;
	}

	/** full constructor */
	public Journal(Userinfo userinfo, String title, String content,
			Timestamp publishDate, Timestamp updateDate, Boolean isDelete) {
		this.userinfo = userinfo;
		this.title = title;
		this.content = content;
		this.publishDate = publishDate;
		this.updateDate = updateDate;
		this.isDelete = isDelete;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Userinfo getUserinfo() {
		return this.userinfo;
	}

	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getPublishDate() {
		return this.publishDate;
	}

	public void setPublishDate(Timestamp publishDate) {
		this.publishDate = publishDate;
	}

	public Timestamp getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}

	public Boolean getIsDelete() {
		return this.isDelete;
	}

	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}

}