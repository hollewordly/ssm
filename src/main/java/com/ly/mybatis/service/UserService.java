package com.ly.mybatis.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ly.mybatis.mapper.UserMapper;
import com.ly.mybatis.model.Mail;
import com.ly.mybatis.model.User;
import com.ly.mybatis.model.Vacation;
import com.ly.mybatis.service.inter.IUserservice;

@Service
public class UserService implements IUserservice{

	@Autowired
	UserMapper userMapper;
	public User selectByName(User user) {
		return userMapper.selectByName(user);
	}
	public void updateUser(User user) {
		userMapper.updateUser(user);
		
	}
	public User getById(Integer id) {
		return userMapper.getById(id);
	}
	public List<User> getAllUser(){
		return userMapper.getAllUser();
	}
	public void saveEmail(Mail mail) {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String time = format.format(date);
		mail.setIsread(0);
		mail.setTime(time);
	userMapper.saveEmail(mail);
	}
	public List<Mail> getEmailById(Integer id) {
		List<Mail> maillist = userMapper.getEmailById(id);
		return maillist;
	}
	public Mail selectEmailById(Integer id) {
		Mail mail = userMapper.selectEmailById(id);
		return mail;
	}
	
	public void updateRead(Mail mail) {
		mail.setIsread(1);
		userMapper.updateRead(mail);
		
	}
	public void saveEmailPlay(Mail mail) {
		userMapper.saveEmailPlay(mail);
		
	}
	public void deleteEmail(Integer id) {
		userMapper.deleteEmail(id);
		
	}
	public List<Mail> getEmailPlay(Integer id) {
		List<Mail> list = userMapper.getEmailPlay(id);
		
		return list;
	}
	public Mail getEmailPlayById(Integer id) {
		Mail mail = userMapper.getEmailPlayById(id);
		
		return mail;
	}
	public void saveBackEmail(Mail mail) {
		userMapper.saveBackEmail(mail);
		
		
	}
	public void delEmailPlay(Integer id) {
		userMapper.delEmailPlay(id);
		
	}
	public List<Vacation> getAdminList(Integer id) {
		List<Vacation> list = userMapper.getAdminList(id);
		return list;
	}
	public List<Vacation> getVacationList(Integer id) {
		List<Vacation> list = userMapper.getVacationList(id);
		return list;
	}
	public List<User> getAdminUser() {
		List<User> adminUserlist = userMapper.getAdminUser();
		return adminUserlist;
	}
	public void saveApply(Vacation vacation) {
		vacation.setIsapprove(0);
		userMapper.saveApply(vacation);
		
	}
	public Vacation selectVacaById(Integer id) {
		Vacation vacation = userMapper.selectVacaById(id);
		
		return vacation;
	}
	public void updateVacation(Vacation vacation) {
		userMapper.updateVacation(vacation);
		
	}
	public void updateVacationf(Vacation vacation) {
		userMapper.updateVacation(vacation);
		
	}
	public void updateUserAccount(User user) {
		userMapper.updateUserAccount(user);
		
		
	}
	public List<User> getUserList() {
		List<User> getuserList = userMapper.getUserList();
		return getuserList;
	}
	public void saveManageUser(User user) {
	
		userMapper.saveManageUser(user);
		
		
	}
	public User checkUser(String name) {
		User user = userMapper.checkUser(name);
		
		return user;
	}
	
}
