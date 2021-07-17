package com.brEnt.brFamily.mail.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.brEnt.brFamily.mail.model.service.MailService;
import com.brEnt.brFamily.mail.model.vo.InfoMail;
import com.brEnt.brFamily.mail.model.vo.MailFile;
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
	
	
	
	// 받은 메일 메일쓰기, 답장, 전달, 즐겨찾기, 삭제하기 
	@RequestMapping("doReply.mail")
	public void doReply(int mailNo, HttpSession session) {
		System.out.println(mailNo);
	}
	
	@RequestMapping("send.mail")
	public ModelAndView sendMailListView(HttpSession session, ModelAndView mv) {
		
		String email = ((Member)session.getAttribute("loginUser")).getOfficeEmail();
		ArrayList<SendMail> slist = mService.sendMailListView(email);
		ArrayList<ReceiveMail> rlist = mService.receiverList(email); 
		
		mv.addObject("slist", slist)
		  .addObject("rlist", rlist)
		  .setViewName("mail/sendMailListView");
		
		return mv;
	}
	
	@RequestMapping("temp.mail")
	public ModelAndView TempboxListView(HttpSession session, ModelAndView mv) {
		
		String email = ((Member)session.getAttribute("loginUser")).getOfficeEmail();
		ArrayList<SendMail> slist = mService.TempboxListView(email);
		
		mv.addObject("slist", slist)
		  .setViewName("mail/mailTempBox");
		
		return mv;
	}
	
	@RequestMapping("bin.mail")
	public ModelAndView mailRecycleBin(HttpSession session, ModelAndView mv) {
		
		String email = ((Member)session.getAttribute("loginUser")).getOfficeEmail();
		//ArrayList<SendMail> slist = mService.recycleBinList(email);
		ArrayList<ReceiveMail> rlist = mService.recycleBinRList(email); 
		
		mv.addObject("rlist", rlist)
		  .setViewName("mail/mailRecycleBin");
		
		return mv;
	}
	
	@RequestMapping("enroll.mail")
	public String enrollMail() {
		return "mail/enrollMail";
	}
	
	@RequestMapping("insert.mail")
	public String insertMail(SendMail s , MultipartFile[] upfile, HttpSession session, ModelAndView mv) {
		
		int result1 = mService.insertSMail(s);
		
		if(result1 > 0) {
			String[] values = s.getMailReceiver().split(",", 0);
			
			ArrayList<ReceiveMail> rlist = new ArrayList<>();
			
			for(int i=0; i<values.length; i++) {
				
				ReceiveMail r = new ReceiveMail();
				r.setMailWriter(s.getMailWriter());
				r.setMailReceiver(values[i]);
				rlist.add(r);
			} 
			
			int result2 = mService.insertRMail(rlist);
			
			
			
			for( MultipartFile multif : upfile) {
				if(!multif.getOriginalFilename().isEmpty()) {
					
					String changeName = saveFile( multif , session);
					
					MailFile mf = new MailFile();
					mf.setMailOrigin(multif.getOriginalFilename());
					mf.setMailUpdate(changeName);
					mf.setMailFPath(("/resources/mailUpfiles") + changeName);
					mf.setMailFSize(String.valueOf(multif.getSize()));
					
					String ext = multif.getOriginalFilename().substring(multif.getOriginalFilename().lastIndexOf("."));
					mf.setMailFType(ext);
					
					int result3 = mService.insertMFMail(mf);
					
					ArrayList<MailFile> mflist = new ArrayList<>();
					mflist.add(mf);
					
				}else {
					break;
				}
			}
			mv.addObject("s", s)
			  .addObject("rlist", rlist);
			return "redirect:send.mail";
		} else {
			mv.addObject("errorPage", "메일 전송 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("sendTemp.mail")
	public String tempMail(SendMail s , MultipartFile[] upfile, HttpSession session, ModelAndView mv) {
		int result1 = mService.tempSMail(s);
		
		if(result1 > 0) {
			String[] values = s.getMailReceiver().split(",", 0);
			
			ArrayList<ReceiveMail> rlist = new ArrayList<>();
			
			for(int i=0; i<values.length; i++) {
				
				ReceiveMail r = new ReceiveMail();
				r.setMailWriter(s.getMailWriter());
				r.setMailReceiver(values[i]);
				rlist.add(r);
			} 
			
			int result2 = mService.tempRMail(rlist);
			
			
			
			for( MultipartFile multif : upfile) {
				if(!multif.getOriginalFilename().isEmpty()) {
					
					String changeName = saveFile( multif , session);
					
					MailFile mf = new MailFile();
					mf.setMailOrigin(multif.getOriginalFilename());
					mf.setMailUpdate(changeName);
					mf.setMailFPath(("/resources/mailUpfiles") + changeName);
					mf.setMailFSize(String.valueOf(multif.getSize()));
					
					String ext = multif.getOriginalFilename().substring(multif.getOriginalFilename().lastIndexOf("."));
					mf.setMailFType(ext);
					
					int result3 = mService.tempMFMail(mf);
					
					ArrayList<MailFile> mflist = new ArrayList<>();
					mflist.add(mf);
					
				}else {
					break;
				}
			}
			mv.addObject("s", s)
			  .addObject("rlist", rlist);
			return "redirect:temp.mail";
		} else {
			mv.addObject("errorPage", "메일 전송 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("detail.mail")
	public String detailRMail(ReceiveMail rmail, HttpSession session, Model model) {
		
		int result = mService.readMail(rmail);
		
		if(result>0) {
			InfoMail im = mService.detailRMail(rmail);
			
			model.addAttribute("im", im);
			
			return "mail/mailDetailView";
		} else {
			model.addAttribute("errorMsg", "게시글 조회 실패!");
			return "common/errorPage";
		}
		
		
	}	
	
	@ResponseBody
	@RequestMapping(value="delete.mail", produces="application/json; charset=utf-8")
	public String deleteMail(HttpServletRequest request, HttpSession session, Model model) { 
		
		String[] mail_arr = request.getParameterValues("mail_arr");
		String email = ((Member)session.getAttribute("loginUser")).getOfficeEmail();
		
		int result = mService.deleteMail(mail_arr, email);
		
		if(result>0) {
			return null;
		} else {
			return "fail";
		}
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
			String savePath = session.getServletContext().getRealPath("/resources/mailUpfiles/");
			
			String originName = upfile.getOriginalFilename(); // 파일의 원본명("aaa.jpg")
			
			// 수정명 이름 만들기
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmsss").format(new Date());
			int ranNum = (int)(Math.random() * 90000 + 10000);
			String ext = originName.substring(originName.lastIndexOf("."));
			
			String changeName = currentTime + ranNum + ext;
			
			try {
				upfile.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			return changeName;
	}
}
