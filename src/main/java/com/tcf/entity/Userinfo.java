package com.tcf.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Userinfo entity. @author MyEclipse Persistence Tools
 */

public class Userinfo implements java.io.Serializable,Entity {

	// Fields

	private Integer id;
	private String username;
	private String password;
	private Integer isAdmin;
	private Boolean isDelete;
	private Set journals = new HashSet(0);

	// Constructors

	/** default constructor */
	public Userinfo() {
	}

	/** minimal constructor */
	public Userinfo(String username, String password) {
		this.username = username;
		this.password = password;
	}

	/** full constructor */
	public Userinfo(String username, String password, Integer isAdmin,
			Boolean isDelete, Set journals) {
		this.username = username;
		this.password = password;
		this.isAdmin = isAdmin;
		this.isDelete = isDelete;
		this.journals = journals;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getIsAdmin() {
		return this.isAdmin;
	}

	public void setIsAdmin(Integer isAdmin) {
		this.isAdmin = isAdmin;
	}

	public Boolean getIsDelete() {
		return this.isDelete;
	}

	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}

	public Set getJournals() {
		return this.journals;
	}

	public void setJournals(Set journals) {
		this.journals = journals;
	}

}