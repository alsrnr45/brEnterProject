package com.brEnt.brFamily.mail.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.brEnt.brFamily.mail.model.service.MailService;
import com.brEnt.brFamily.mail.model.vo.ReceiveMail;
import com.brEnt.brFamily.mail.model.vo.SendMail;
import com.brEnt.brFamily.member.model.vo.Member;

@Controller
public class MailController {

	@Autowired
	private MailService mService;
	
	@RequestMapping("receive.mail")
	public ModelAndView receiveMailListView(HttpSession session, ModelAndView mv) {
		
		String email = ((Member)session.getAttribute("loginUser")).getOfficeEmail();
		ArrayList<ReceiveMail> list = mService.receiveMailListView(email);
		
		mv.addObject("list", list)
		  .setViewName("mail/receiveMailListView");
		
		return mv;
	}
	
	@RequestMapping("send.mail")
	public ModelAndView sendMailListView(HttpSession session, ModelAndView mv) {
		
		String email = ((Member)session.getAttribute("loginUser")).getOfficeEmail();
		ArrayList<SendMail> list = mService.sendMailListView(email);
		
		mv.addObject("list", list)
		  .setViewName("mail/sendMailListView");
		
		return mv;
	}
	
	@RequestMapping("temp.mail")
	public String mailTempBox() {
		return "mail/mailTempBox";
	}
	
	@RequestMapping("bin.mail")
	public String mailRecycleBin() {
		return "mail/mailRecycleBin";
	}
	
	@RequestMapping("enroll.mail")
	public String enrollMail() {
		return "mail/enrollMail";
	}
}
