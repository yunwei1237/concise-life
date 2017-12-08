package com.tcf.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tcf.entity.Journal;
import com.tcf.entity.Userinfo;
import com.tcf.service.JournalService;
import com.tcf.service.UserInfoService;

@Controller
public class CommonController {
	@Autowired
	private UserInfoService userInfoService;
	
	@RequestMapping("{username}/index")
	public String index(@PathVariable("username") String username,HttpSession session){
		System.out.println("index:\t"+username);
		session.setAttribute("username", username);
		Userinfo user = userInfoService.login(new Userinfo("admin", "admin"));
		return "index";
	}
	@RequestMapping("{username}/photo")
	public String photo(@PathVariable("username") String username,HttpSession session){
		System.out.println("photo:\t"+username);
		session.setAttribute("username", username);
		return "photo";
	}
	@RequestMapping("{username}/message")
	public String message(@PathVariable("username") String username,HttpSession session){
		System.out.println("message:\t"+username);
		session.setAttribute("username", username);
		return "message";
	}
	@Autowired
	private JournalService journalService;
	
	@RequestMapping("{username}/journal")
	public String journal(@PathVariable("username") String username,HttpSession session){
		System.out.println("index:\t"+username);
		session.setAttribute("username", username);
		List<Journal> journals = journalService.getJournalForUser(username, 1, 15);
		for (int i = 0; i < journals.size(); i++) {
			Journal journal = journals.get(i);
			journal.setContent(guoHtml(journal.getContent()));
		}
		session.setAttribute("journals", journals);
		return "journal";
	}
	@RequestMapping("{username}/contact")
	public String contact(@PathVariable("username") String username,HttpSession session){
		System.out.println("contact:\t"+username);
		session.setAttribute("username", username);
		return "contact";
	}
	@RequestMapping("{username}/talk")
	public String talk(@PathVariable("username") String username,HttpSession session){
		System.out.println("talk:\t"+username);
		session.setAttribute("username", username);
		return "talk";
	}
	@RequestMapping("{username}/editJournal")
	public String editJournal(@PathVariable("username") String username,HttpSession session){
		System.out.println("editJournal:\t"+username);
		session.setAttribute("username", username);
		return "addJournal";
	}
	@RequestMapping("{username}/addJournal")
	public String addJournal(@PathVariable("username") String username,Journal journal,HttpSession session){
		System.out.println("addJournal:\t"+username);
		session.setAttribute("username", username);
		journal.setPublishDate(new Timestamp(System.currentTimeMillis()));
		journal.setUpdateDate(new Timestamp(System.currentTimeMillis()));
		journal.setUserinfo(userInfoService.getUserByName("archer"));
		journalService.addJournal(journal);
		return String.format("redirect:%s/journal", username);
	}
	@RequestMapping("{username}/viewJournal")
	public String viewJournal(@PathVariable("username") String username, @RequestParam("id") int id,HttpSession session){
		System.out.println("viewJournal:\t"+username);
		session.setAttribute("username", username);
		Journal journal = journalService.getJournalById(id);
		session.setAttribute("journal", journal);
		return "viewJournal";    
	}
	
	public static String guoHtml(String s) {
		if (s != null && !s.equals("")) {
			String str = s.replaceAll("<[.[^<]]*>", "");
			return str;
		}
		return s;
	}
	
}
