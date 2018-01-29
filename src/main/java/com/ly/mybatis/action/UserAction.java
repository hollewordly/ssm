package com.ly.mybatis.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.ly.mybatis.model.Mail;
import com.ly.mybatis.model.User;
import com.ly.mybatis.model.Vacation;
import com.ly.mybatis.service.inter.IUserservice;

@Controller
public class UserAction {

	@Autowired
	IUserservice service;

	@RequestMapping("/tologin")
	public String toLogin() {
		return "login";
	}
	@RequestMapping("/login.do")
	@ResponseBody
	public String doLogin(User user,HttpSession session) {
		User user2 = service.selectByName(user);
		if (user2!=null) {
			
			if (user2.getPassword().equals(user.getPassword())) {
				//通过验证
				session.setAttribute("user2",user2);
				return "1";
			}else {
				return "0";
			}
		}else {
			return "0";
		}
	}

	
	//到首页
	@RequestMapping(value="/toindex")
	public String toindex() {
		return "index";
		
	}
	//点击编辑显示的信息
	@RequestMapping("/editinfo.do")
	public String editInfo() {
		return "userinfo";
	}
	//保存编辑的信息
	@RequestMapping("/saveinfo.do")
	
	public String userInfo(User user,HttpSession session) {
		service.updateUser(user);
		Integer id = user.getId();
		User user2 = service.getById(id);
		/*if (session!=null) {
			session.removeAttribute("user2");
		}*/
		session.setAttribute("user2",user2);
		
		return "index";
	}
	//发邮件页面数据源
	@RequestMapping("/sendEmail.do")
	public String sendEmail(HttpSession session) {
		List<User> userlist = service.getAllUser();
		session.setAttribute("userlist",userlist);
		return "sendEmail";
	}
	//保存邮件
	@RequestMapping("/saveEmail.do")
	@ResponseBody
	public void saveEmail(String tittle,String content,@RequestParam(value="uid")Integer uid,Integer sender,@RequestParam(value="mailfile")MultipartFile file) throws IllegalStateException, IOException {
		System.out.println("1111");
		String mailfile = null;
		if (!file.isEmpty()) {
			mailfile = file.getOriginalFilename();
			file.transferTo(new File("F:/temp/"+mailfile));
		}
	Mail mail = new Mail();
	mail.setContent(content);
	mail.setMailfile(mailfile);
	mail.setSender(sender);
	mail.setTittle(tittle);
	mail.setUid(uid);
	System.out.println(mail.getContent());
		service.saveEmail(mail);	
	}

	//当前用户得邮件
	@RequestMapping("/receiveEmail.do/{userId}")
	public String getEmailById(@PathVariable(value="userId") Integer id,HttpSession session) {
		List<Mail> maillist = service.getEmailById(id);
		session.setAttribute("maillist",maillist);
		return "receiveEmail";
	}
	//查看邮件详情
	@RequestMapping("/emailDetail.do/{id}")
	public String emailDetail(@PathVariable(value="id")Integer id,Model model,HttpSession session) {
		Mail mail = service.selectEmailById(id);
		service.updateRead(mail);
		int uid = mail.getSender();
		User user = service.getById(uid);
		model.addAttribute("user",user);
		session.setAttribute("mail",mail);
		return "emailDetail";
	}
	//下载附件
	@RequestMapping("/download.do/{id}")
	public void download(@PathVariable(value="id")Integer id,HttpServletResponse response) throws IOException{
		Mail mail = service.selectEmailById(id);
		//找到附件路径
		File file = new File("F:/temp/"+mail.getMailfile());
		//设置响应头，空竹浏览器下载该文件
		response.setHeader("content-disposition","attachment;filename="+URLEncoder.encode(mail.getMailfile(),"UTF-8"));
		FileInputStream ins = new FileInputStream(file);
		OutputStream out = response.getOutputStream();
		byte arr[] = new byte[1024];
		int len = 0;
		while ((len=ins.read(arr))>0) {
			out.write(arr,0,len);
			
		}
	ins.close();
	out.close();
	
	}
	
	//删到回收站
	@RequestMapping("/delEmailById.do/{mid}")
	@ResponseBody
	public void delEmailPlay(@PathVariable(value="mid") Integer id) {
	
		Mail mail = service.selectEmailById(id);
		service.saveEmailPlay(mail);
		service.deleteEmail(id);
		
	}
	//查看回收站
	@RequestMapping("/recycle.do/{id}")
	public String recycleMail(@PathVariable(value="id")Integer id,HttpSession session) {
		List<Mail> list = service.getEmailPlay(id);
		session.setAttribute("list",list);
		return "recycle";
	}
	//回收站得操作
	@RequestMapping("/reEmailPlay.do/{id}")
	@ResponseBody
	public void rebackEmail(@PathVariable(value="id") Integer id) {
		Mail mail = service.getEmailPlayById(id);
		service.saveBackEmail(mail);
		service.delEmailPlay(id);
		
	}
	//永久删除
	@RequestMapping("/delEmailPlay.do/{id}")
	@ResponseBody
	public void deEmailPlay(@PathVariable(value="id")Integer id) {
		service.delEmailPlay(id);
	}
	//休假列表
	@RequestMapping("/vacation.do/{id}")
	public String vacationList(@PathVariable(value="id") Integer id,HttpSession session) {
		User user = service.getById(id);
		List<Vacation> vacationlist = null;
		if (user.getIsadmin()==1) {
			//如果是经理就得返回她该审批得列表
			vacationlist = service.getAdminList(id);
			
		}else {
			//普通用户
			vacationlist = service.getVacationList(id);
			
		}
	
		session.setAttribute("vacationlist",vacationlist);
		return "vacation";
	}
	//申请休假
	@RequestMapping("/apply.do")
	public String applyVacation(HttpSession session) {
		List<User> adminUserlist= service.getAdminUser();
		session.setAttribute("adminUserlist",adminUserlist);
		return "apply";
	}
	//交请假条
	@RequestMapping("/applySubmit.do")
	@ResponseBody
	public void saveApply(Vacation vacation) {
		service.saveApply(vacation);
	}
	//审批请假提条
	@RequestMapping("/appr.do/{id}")
	public String approveVacation(@PathVariable(value="id")Integer id,HttpSession session) {
		Vacation vacation = service.selectVacaById(id);
		session.setAttribute("vacation",vacation);
		return "approve";
				
	}
	@RequestMapping("/pass.do/{id}")
	@ResponseBody
	public void updateVacation(@PathVariable(value="id")Integer id) {
		Vacation vacation = service.selectVacaById(id);
		vacation.setIsapprove(1);
		service.updateVacation(vacation);
		
		
	}
	@RequestMapping("/fail.do/{id}")
	@ResponseBody
	public void updateVacationf(@PathVariable(value="id")Integer id) {
		Vacation vacation = service.selectVacaById(id);
		vacation.setIsapprove(2);
		service.updateVacationf(vacation);
		
	}
	//个人账户
	@RequestMapping("/userAccount.do")
	public String userAccount() {
		return "userAccount";
	}
	//到编辑页面
	@RequestMapping("/userEdit.do")
	public String toEditJsp() {
		return "userEdit";
	}
	@RequestMapping("/saveuser.do")
	public String saveUser(User user,HttpSession session) {
		service.updateUserAccount(user);
		User user2 = service.getById(user.getId());
		session.setAttribute("user2",user2);
		return "userAccount";
		
	}
	//管理账户
 @RequestMapping("/manageAccount.do")
 public String manageAccount(HttpSession session) {
	 List<User> getuserlist = service.getUserList();
	 session.setAttribute("getuserlist", getuserlist);
	 return "manageAccount";
 }
	//管理账户
@RequestMapping("/bossAccount.do")
public String bossAccount(HttpSession session) {
	 List<User> getuserlist = service.getAdminUser();
	 session.setAttribute("getuserlist", getuserlist);
	 return "manageAccount";
}
 @RequestMapping("/adduser.do")
 public String adduser() {
	 return "adduser";
 }
 @RequestMapping("/saveManageUser.do")
 @ResponseBody
 public void saveManageUser(User user) {
	user.setIsadmin(0);
	 service.saveManageUser(user);
 }
 @RequestMapping("/toexit.do")
 public String toExit(HttpSession session) {
	 User user = new User();
	 session.setAttribute("user2",user);
	 return "login";
	 
 }
 @RequestMapping("/checkUser.do")
 @ResponseBody
 public void checkUser(HttpServletRequest request,HttpServletResponse response) throws IOException {
	 String username = request.getParameter("username");
	 User user = null;
	 try {
		user = service.checkUser(username);
	} catch (Exception e) {
		e.printStackTrace();
	}
	 Gson gson = new Gson();
	 String json = gson.toJson(user);
	 System.out.println(json);
	 if (json!=null) {
		response.getWriter().write(json);
	}
 }
 
}

