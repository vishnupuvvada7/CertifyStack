package com.klef.jfsd.service;

import java.util.List;

import com.klef.jfsd.model.Admin;
import com.klef.jfsd.model.Certificate;
import com.klef.jfsd.model.Certifications;
import com.klef.jfsd.model.Contact;
import com.klef.jfsd.model.User;

public interface AdminService {
	
	public String addContact(Contact c);
	public List<Contact> viewContacts();
	
	
	public Admin checkadminlogin(String username, String password);
	
	public List<User> viewAllUsers();
	public String updateUser(User user);
	public String deleteUser(int id);
	
	public String approveGlobal(int id, String status);
	public String approveRenewal(int id, String status);
	public String AddCertification(Certifications cert);
	public List<Certificate> viewSubmittedCerts(String isglobal);
	public List<Certificate> viewRenewalCerts(String status);
	public List<Certifications> viewAllCerts();
	public List<String> viewAllProviders();
	public List<String> viewAllLevels();
	public String deleteCertification(int id);
	
	public List<Admin> viewAllAdmins();
	public String insertadmin(Admin a);
	public String updateadmin(Admin a);
	public String deleteadmin(String username);
	public Admin displayAdminByID(String username);
	public String updateAdminPass(Admin a);
	public String updateadminprofile(Admin a);
	
	
	public long userscount();
	public long adminscount();
	public long activecertificates();
	public long pendingcertificates();
}
