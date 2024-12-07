package com.klef.jfsd.service;

import java.time.LocalDate;
import java.time.YearMonth;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.klef.jfsd.model.Certificate;
import com.klef.jfsd.model.Contact;
import com.klef.jfsd.model.Renewal;
import com.klef.jfsd.model.User;
import com.klef.jfsd.repository.CertificateRepository;
import com.klef.jfsd.repository.ContactRepository;
import com.klef.jfsd.repository.RenewalRepository;
import com.klef.jfsd.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private CertificateRepository certificateRepository;
	
	@Autowired
	private ContactRepository contactRepository;
	
	@Autowired
	private RenewalRepository renewalRepository;


	@Override
	public String userRegistration(User u) {
		userRepository.save(u);
		return "User Added Successfully";
	}

	@Override
	public User checkUserLogin(String username, String password) {
		return userRepository.checkuserlogin(username, password);
	}

	@Override
	public User displayUserByID(int eid) {
		return userRepository.findById(eid);
	}

	@Override
	public String updateUserProfile(User user) {
		User u = userRepository.findById(user.getId());
	    
		u.setName(user.getName());
		u.setGender(user.getGender());
	    u.setContact(user.getContact());
	    userRepository.save(u);
	    
	    return "User Updated Successfully";
	}
	
	@Override
	public String addUserProfile(User user) {
		User u = userRepository.findById(user.getId());
	    
		u.setId(user.getId());
	    u.setProfilepic(user.getProfilepic());
	    userRepository.save(u);
	    
	    return "User Profile added Successfully";
	}
	
	@Override
	public String updateUserPass(User user) {
		User u = userRepository.findById(user.getId());
	    
		u.setPassword(user.getPassword());
	    userRepository.save(u);
	    
	    return "User Password Updated Successfully";
	}


	@Override
	public String addCertificate( Certificate c) {
		certificateRepository.save(c);
		return "Certificate Added Successfully";
	}

	@Override
	public List<Certificate> viewAllCertificates() {
		return (List<Certificate>) certificateRepository.findAll();
	}

	@Override
	public String updateCertificate(Certificate c) {
		Certificate cert = certificateRepository.findById(c.getId());
	    
		cert.setName(c.getName());
		cert.setOrganization(c.getOrganization());
		cert.setIssuedate(c.getIssuedate());
		cert.setExpirydate(c.getExpirydate());
		cert.setValidationid(c.getValidationid());
		cert.setCdoc(c.getCdoc());
		cert.setIsglobal(c.getIsglobal());
		cert.setCinfo(c.getCinfo());
		cert.setStatus(c.getStatus());
		cert.setUsername(c.getUsername());

	    certificateRepository.save(cert);
	    
	    return "Certificate Updated successfully";
	}
	
	@Override
	public List<Certificate> viewCertsByUser(String username) {
		return (List<Certificate>) certificateRepository.findByUsername(username);
	}

	@Override
	public Certificate displayCertificate(int id) {
		return certificateRepository.findById(id);
	}

	@Override
	public String deleteCertificate(int id) {
		renewalRepository.deleteById(id);
		
		return "Certificate Deleted Successfully";
	}
	
	@Override
	public List<Certificate> viewCertsByUserandStatus(String username, String status) {
		return certificateRepository.findByStatus(username,status);
	}

	@Override
	public List<Certificate> viewCertsByFilter(String username, String filter) {
		if(filter.equals("ALL")) {
			return certificateRepository.findByUsername(username);
		}else if(filter.equals("GLOBAL") || filter.equals("SUBMITTED")) {
			return certificateRepository.findAllGlobal(username,filter);
		}else {
			return certificateRepository.findByStatus(username,filter);
		}
	}

	@Override
	@Scheduled(cron = "0 0 0 * * ?")
	public void updatestatusfornextmonthitems() {
		YearMonth nextMonth = YearMonth.now().plusMonths(1);
        LocalDate startOfNextMonth = nextMonth.atDay(1);
        LocalDate endOfNextMonth = nextMonth.atEndOfMonth();
        
		/*
		 * System.out.println("Start of Next Month: " + startOfNextMonth);
		 * System.out.println("End of Next Month: " + endOfNextMonth);
		 */
        
        String newStatus = "EXPIRINGSOON";
		/* int updatedCount = */
        certificateRepository.updateStatusForNextMonthItems(newStatus, startOfNextMonth, endOfNextMonth);
        
		/*
		 * System.out.println("Updated " + updatedCount + " items to status '" +
		 * newStatus + "'");
		 */
	}
	
	@Override
	@Scheduled(cron = "0 0 0 * * ?")
	public void updateexpirystatus() {
		LocalDate currentDate = LocalDate.now();
		/* System.out.println(currentDate); */
        String expiredStatus = "EXPIRED";
		/* int updatedCount = */
        certificateRepository.updateStatusForExpiredItems(expiredStatus, currentDate);

	}

	@Override
	public String addContact(Contact c) {
		contactRepository.save(c);
		return "Message Sent Successfully";
	}

	@Override
	public String addRenewal(Renewal r) {
		renewalRepository.save(r);
		return "Certificate added as renewal";
	}

	@Override
	public long activeCertificationscount() {
		long count = certificateRepository.activecertificates();
		return count;
	}

	@Override
	public long expiringCertificationscount() {
		return certificateRepository.expiringcertificates();
	}

	@Override
	public long globalCertificationscount() {
		return certificateRepository.globalcertificatescount();
	}
	

}
