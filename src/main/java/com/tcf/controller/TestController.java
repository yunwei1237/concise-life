package com.tcf.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	@RequestMapping("viewJournal2")
	public String addJournal(String title,String content,HttpSession session){
		session.setAttribute("title", title);
		session.setAttribute("content", content);
		return "viewJournal2";
	}
}
