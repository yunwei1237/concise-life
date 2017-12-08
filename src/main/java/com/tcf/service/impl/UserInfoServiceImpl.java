package com.tcf.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tcf.dao.Dao;
import com.tcf.entity.Userinfo;
import com.tcf.service.UserInfoService;

@Service
public class UserInfoServiceImpl implements UserInfoService {

	@Autowired
	private Dao dao;
	public Serializable regist(Userinfo user) {
		// TODO Auto-generated method stub
		return dao.save(user);
	}

	@SuppressWarnings("unchecked")
	public Userinfo login(Userinfo user) {
		// TODO Auto-generated method stub
		List<Userinfo> list = dao.find(user);
		return list.size()>0?list.get(0):null;
	}

	public Userinfo logout(Userinfo user) {
		// TODO Auto-generated method stub
		return null;
	}

	public Userinfo updateFreeze(Userinfo user) {
		// TODO Auto-generated method stub
		dao.delete(user);
		return user;
	}

	public Userinfo updateUnfreeze(Userinfo user) {
		// TODO Auto-generated method stub
		user.setIsDelete(false);
		dao.update(user);
		return user;
	}

	public Userinfo getUserById(int id) {
		// TODO Auto-generated method stub
		return (Userinfo) dao.get(Userinfo.class, id);
	}

	public Userinfo getUserByName(String name) {
		// TODO Auto-generated method stub
		List<Userinfo> list = dao.find(new Userinfo(name,null));
		return list.size()>0?list.get(0):null;
	}
}
