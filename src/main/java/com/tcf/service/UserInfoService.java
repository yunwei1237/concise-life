package com.tcf.service;

import java.io.Serializable;

import com.tcf.entity.Userinfo;

public interface UserInfoService {
	/**
	 * 注册用户
	 * @param user
	 * @return
	 */
	Serializable regist(Userinfo user);
	/**
	 * 登录用户
	 * @param user
	 * @return
	 */
	Userinfo login(Userinfo user);
	/**
	 * 注销用户
	 * @param user
	 * @return
	 */
	Userinfo logout(Userinfo user);
	/**
	 * 冻结用户
	 * @param user
	 * @return
	 */
	Userinfo updateFreeze(Userinfo user);
	/**
	 * 解冻用户
	 * @param user
	 * @return
	 */
	Userinfo updateUnfreeze(Userinfo user);
	
	Userinfo getUserById(int id);
	
	Userinfo getUserByName(String name);
}
