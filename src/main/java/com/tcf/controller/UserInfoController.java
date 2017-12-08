package com.tcf.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tcf.entity.Userinfo;
import com.tcf.service.UserInfoService;

@Controller
public class UserInfoController {
	
	@Autowired
	private UserInfoService userInfoService;
	
	@RequestMapping("login")
	public String login(Userinfo user,HttpSession session){
		Userinfo logined = userInfoService.login(user);
		session.setAttribute("user", logined);
		return "index";
	}
	
	@RequestMapping("checkUserName")
	public @ResponseBody String checkUserName(String username,HttpSession session){
		Userinfo user = userInfoService.getUserByName(username);
		return user == null?"false":"true";
	}
	@RequestMapping("getCurrentUserName")
	public @ResponseBody String getCurrentUserName(HttpSession session){
		Userinfo user = (Userinfo) session.getAttribute("user");
		return user == null?"null":user.getUsername();
	}
	@RequestMapping("login2")
	public @ResponseBody String login2(Userinfo user,HttpSession session){
		Userinfo logined = userInfoService.login(user);
		session.setAttribute("user", logined);
		return logined == null?"false":"true";
	}
}
