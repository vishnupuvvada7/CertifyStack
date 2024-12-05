package com.klef.jfsd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.model.Admin;
import com.klef.jfsd.model.Certificate;
import com.klef.jfsd.model.Certifications;
import com.klef.jfsd.model.Contact;
import com.klef.jfsd.model.User;
import com.klef.jfsd.repository.AdminRepository;
import com.klef.jfsd.repository.CertificateRepository;
import com.klef.jfsd.repository.CertificationsRepository;
import com.klef.jfsd.repository.ContactRepository;
import com.klef.jfsd.repository.UserRepository;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private ContactRepository contactRepository;
	
	@Autowired
	private AdminRepository adminRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private CertificateRepository certificateRepository;
	
	@Autowired
	private CertificationsRepository certsRepository;
	
	@Override
	public String addContact(Contact c) {
		contactRepository.save(c);
		return "Message Sent Successfully";
	}
	
	@Override
	public List<Contact> viewContacts() {
		return contactRepository.findAll();
	}
	

	
	@Override
	public Admin checkadminlogin(String username, String password) {
		return adminRepository.checkadminlogin(username,password);
	}

	@Override
	public List<User> viewAllUsers() {
		return userRepository.findAll();
	}

	@Override
	public List<Certificate> viewSubmittedCerts(String isglobal) {
		return certificateRepository.viewSubmittedCerts(isglobal);
	}
	
	@Override
	public List<Certificate> viewRenewalCerts(String status) {
		return certificateRepository.viewRenewalCerts(status);
	}

	@Override
	public String updateUser(User user) {
		User u = userRepository.findById(user.getId());
	    
		u.setName(user.getName());
		u.setGender(user.getGender());
		u.setEmail(user.getEmail());
	    u.setContact(user.getContact());
	    userRepository.save(u);
	    
	    return "User Updated Successfully";
	}

	@Override
	public String deleteUser(int id) {
		userRepository.deleteById(id);
		return "User Deleted Successfully";
	}

	@Override
	public String approveGlobal(int id, String status) {
		certificateRepository.approveGlobal(status, id);
		return "Certificate Approved Successfully";
	}
	
	@Override
	public String approveRenewal(int id, String status) {
		certificateRepository.approveRenewal(status, id);
		return "Certificate Renewed Successfully";
	}

	@Override
	public String AddCertification(Certifications cert) {
		certsRepository.save(cert);
		return "Certification added successfully";
	}

	@Override
	public List<Certifications> viewAllCerts() {
		return certsRepository.findAll();
	}

	@Override
	public List<String> viewAllProviders() {
		return certsRepository.viewallproviders();
	}
	@Override
	public List<String> viewAllLevels() {
		return certsRepository.viewalllevels();
	}

	@Override
	public String deleteCertification(int id) {
		certsRepository.deleteById(id);
		return "Certification deleted Successfully";
	}

	@Override
	public List<Admin> viewAllAdmins() {
		return adminRepository.findAll();
	}

	@Override
	public String insertadmin(Admin a) {
		adminRepository.save(a);
		return "Admin Added Successfully";
	}

	@Override
	public String updateadmin(Admin a) {
		Admin ad = adminRepository.getReferenceById(a.getUsername());
		ad.setEmail(a.getEmail());
		ad.setName(a.getName());
		ad.setPassword(a.getPassword());
		adminRepository.save(ad);
		return "Admin Updated Successfully";
	}

	@Override
	public String deleteadmin(String username) {

		adminRepository.deleteById(username);
		return "Admin Deleted Successfully";
	}

	@Override
	public String updateadminprofile(Admin a) {
		Admin admin = adminRepository.getReferenceById(a.getUsername());
	    
		admin.setName(a.getName());
		admin.setUsername(a.getUsername());
	    adminRepository.save(admin);
		return "Admin Updated Successfully";
	}

	@Override
	public Admin displayAdminByID(String username) {
		return adminRepository.getReferenceById(username);
	}

	@Override
	public String updateAdminPass(Admin a) {
		Admin admin = adminRepository.getReferenceById(a.getUsername());
	    
		admin.setPassword(a.getPassword());
	    adminRepository.save(admin);
		return "Admin Password Updated Successfully";
	}

	@Override
	public long userscount() {
		return userRepository.count();
	}

	@Override
	public long adminscount() {
		return adminRepository.count();
	}

	@Override
	public long activecertificates() {
		return certificateRepository.activecertificates();
	}

	@Override
	public long pendingcertificates() {
		return certificateRepository.pendingcertificates();
	}

	

	
		
}
