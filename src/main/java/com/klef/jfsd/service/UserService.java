package com.klef.jfsd.service;

import java.util.List;

import com.klef.jfsd.model.Certificate;
import com.klef.jfsd.model.Contact;
import com.klef.jfsd.model.User;

public interface UserService {
	
	public String userRegistration(User u);
	public User checkUserLogin(String username, String password);
	public User displayUserByID(int uid);
	public String updateUserProfile(User user);
	public String updateUserPass(User user);
	public String addUserProfile(User user);
	
	public String addCertificate(Certificate c);
	public Certificate displayCertificate(int id);
	public List<Certificate> viewAllCertificates();
	public String updateCertificate(Certificate c);
	public List<Certificate> viewCertsByUser(String username);
	public String deleteCertificate(int id);
	public List<Certificate> viewCertsByUserandStatus(String username, String status);
	
	public void updatestatusfornextmonthitems();
	public void updateexpirystatus();
	
	public List<Certificate> viewCertsByFilter(String username,String filter);
	
	public String addContact(Contact c);
}
