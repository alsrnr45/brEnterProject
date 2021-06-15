package com.brEnt.brFamily.mail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MailController {

	@RequestMapping("list.mail")
	public String mailListView() {
		return "mail/";
	}
}
