package com.ly.mybatis.service.inter;

import java.util.List;

import com.ly.mybatis.model.Mail;
import com.ly.mybatis.model.User;
import com.ly.mybatis.model.Vacation;

public interface IUserservice {
	User selectByName(User user);
	void updateUser(User user);
	User getById(Integer id);
	List<User> getAllUser();
	void saveEmail(Mail mail);
	List<Mail> getEmailById(Integer id);
	Mail selectEmailById(Integer id);
	void updateRead(Mail mail);
	void saveEmailPlay(Mail mail);
	void deleteEmail(Integer id);
	List<Mail> getEmailPlay(Integer id);
	Mail getEmailPlayById(Integer id);
	void saveBackEmail(Mail mail);
	void delEmailPlay(Integer id);
	List<Vacation> getAdminList(Integer id);
	List<Vacation> getVacationList(Integer id);
	List<User> getAdminUser();
	void saveApply(Vacation vacation);
	Vacation selectVacaById(Integer id);
	void updateVacation(Vacation vacation);
	void updateVacationf(Vacation vacation);
	void updateUserAccount(User user);
	List<User> getUserList();
	void saveManageUser(User user);
	User checkUser(String name);
}
