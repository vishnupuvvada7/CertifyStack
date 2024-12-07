package com.klef.jfsd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.klef.jfsd.model.Admin;
import com.klef.jfsd.model.Certificate;
import com.klef.jfsd.model.Certifications;
import com.klef.jfsd.model.Contact;
import com.klef.jfsd.model.Renewal;
import com.klef.jfsd.model.User;
import com.klef.jfsd.service.AdminService;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	 private JavaMailSender mailSender;
	
	@GetMapping("adminhome")
	public ModelAndView adminhome() {
		ModelAndView mv = new ModelAndView("admin/adminhome");
		long usercount = adminService.userscount();
		mv.addObject("totalUsers",usercount);
		long adminscount = adminService.adminscount();
		mv.addObject("totalAdmins",adminscount);
		long activeCertifications = adminService.activecertificates();
		mv.addObject("activeCertifications",activeCertifications);
		long pendingApprovals = adminService.pendingcertificates();
		mv.addObject("pendingApprovals",pendingApprovals);
		long pendingRenewals = adminService.pendingRenewals();
		mv.addObject("pendingRenewals",pendingRenewals);
		return mv;
	}
	
	@GetMapping("admins")
	public ModelAndView admins() {
		
		ModelAndView mv = new ModelAndView("admin/admins");
		List<Admin> adminlist = adminService.viewAllAdmins();
		System.out.println(adminlist);
		mv.addObject("adminlist",adminlist);
		
		return mv;
	}
	
	
	@GetMapping("viewusers")
	public ModelAndView viewusers() {
		ModelAndView mv = new ModelAndView("admin/viewusers");
		List<User> users = adminService.viewAllUsers();
		mv.addObject("users", users);
		return mv;
	}
	
	@GetMapping("edituser")
	public ModelAndView edituser() {
		ModelAndView mv = new ModelAndView("admin/edituser");
		return mv;
	}
	
	@PostMapping("updateuser")
	public ModelAndView updateuser(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
	     
		try{
			int id = Integer.parseInt(request.getParameter("userId"));
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String gender = request.getParameter("gender");
			String contact = request.getParameter("contact");
      
			User u = new User();
			u.setId(id);	
			u.setName(name);
			u.setEmail(email);
			u.setGender(gender);
			u.setContact(contact);
    
			String msg = adminService.updateUser(u);
    
			System.out.println(id);
			List<User> users = adminService.viewAllUsers();
			mv.addObject("users", users);
			
			mv.setViewName("admin/viewusers");
			mv.addObject("smessage", msg);
      
		}
		catch(Exception e){
			mv.setViewName("updateerror");
			mv.addObject("fmessage", e);
		}
		return mv;
	}
	
	@GetMapping("deleteuser/{id}")
	public ModelAndView deleteuser(HttpServletRequest request, @PathVariable int id) {
		ModelAndView mv = new ModelAndView("admin/viewusers");
		adminService.deleteUser(id);
		List<User> users = adminService.viewAllUsers();
		mv.addObject("users", users);
		return mv;
	}
	
	@GetMapping("verifyglobalcerts")
	public ModelAndView verifyglobalcerts() {
		ModelAndView mv = new ModelAndView("admin/globalcertifications");
		List<Certificate> certs = adminService.viewSubmittedCerts("SUBMITTED");
		mv.addObject("certifications", certs);
		return mv;
	}
	
	@GetMapping("approveglobal")
	public String approveglobal(@RequestParam int id, @RequestParam String isglobal) {
		adminService.approveGlobal(id,isglobal);
		return "redirect:/verifyglobalcerts";
	}
	
	@GetMapping("approverenewals")
	public ModelAndView approverenewals() {
		ModelAndView mv = new ModelAndView("admin/renewals");
		List<Renewal> certs = adminService.viewRenewals();
		mv.addObject("renewals", certs);
		return mv;
	}
	
	@GetMapping("approverenewal")
	public String approverenewal(@RequestParam int id) {
		adminService.approveRenewal(id);
		System.out.println(id);
		return "redirect:/approverenewals";
	}
	
	@GetMapping("addcert")
	public ModelAndView addcert() {
		ModelAndView mv = new ModelAndView("admin/addcertification");
		return mv;
	}
	
	@PostMapping("insertcert")
	public ModelAndView insertcert(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		ModelAndView mv = new ModelAndView("redirect:/certs");
		
		String name = request.getParameter("certName");
		String provider = request.getParameter("provider");
		String level = request.getParameter("level");
		int duration = Integer.parseInt(request.getParameter("duration"));
		int questions = Integer.parseInt(request.getParameter("questions"));
		double cost = Double.parseDouble(request.getParameter("cost"));
		int validity = Integer.parseInt(request.getParameter("validity"));
		String link = request.getParameter("link");
		String description = request.getParameter("description");
		
		Certifications cert = new Certifications();
		
		cert.setName(name);
		cert.setProvider(provider);
		cert.setLevel(level);
		cert.setDuration(duration);
		cert.setQuestions(questions);
		cert.setCost(cost);
		cert.setValidity(validity);
		cert.setLink(link);
		cert.setDescription(description);
		
		adminService.AddCertification(cert);
		
		List<Certifications> certs = adminService.viewAllCerts();
		redirectAttributes.addFlashAttribute("certifications", certs);
		
		List<String> providers = adminService.viewAllProviders();
		redirectAttributes.addFlashAttribute("providers", providers);
		
		return mv;
	}
	
	@GetMapping("certs")
	public ModelAndView certs() {
		ModelAndView mv = new ModelAndView("admin/viewcertifications");
		List<Certifications> certs = adminService.viewAllCerts();
		mv.addObject("certifications", certs);
		List<String> providers = adminService.viewAllProviders();
		System.out.println(providers);
		mv.addObject("providers", providers);
		return mv;
	}
	
	@GetMapping("deletecertification/{id}")
	public ModelAndView deleteCertification(@PathVariable int id, RedirectAttributes redirectAttributes) {
	    ModelAndView mv = new ModelAndView("redirect:/certs");
	    
	    // Delete the certification
	    adminService.deleteCertification(id);
	    
	    // Fetch certifications and providers
	    List<Certifications> certs = adminService.viewAllCerts();
	    List<String> providers = adminService.viewAllProviders();
	    
	    // Pass objects via redirect attributes instead of ModelAndView to avoid query parameters
	    redirectAttributes.addFlashAttribute("certifications", certs);
	    redirectAttributes.addFlashAttribute("providers", providers);
	    
	    return mv;
	}
	
	@GetMapping("viewcontacts")
	public ModelAndView viewcontacts() {
		ModelAndView mv = new ModelAndView();
		List<Contact> contacts = adminService.viewContacts("REPLY");
		mv.addObject("contacts", contacts);
		mv.setViewName("admin/viewcontacts");
		return mv;
	}
	
	@PostMapping("sendContactReply")
	 public ModelAndView sendEmail(HttpServletRequest request) throws Exception {
		 int id = Integer.parseInt(request.getParameter("contactId"));
		 String toemail = request.getParameter("replyTo");
		 String subject = request.getParameter("subject");
		 String msg = request.getParameter("message");
		 MimeMessage mimeMessage = mailSender.createMimeMessage();
		 MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
		 System.out.println(msg);
		 
		 helper.setTo(toemail);
		 helper.setSubject(subject);
		 helper.setFrom("certifystackproject@gmail.com");
		 String htmlContent =
		 "<h3>Reply from CertisyStack regarding your Message</h3>" +
		 "<p><strong>Subject:</strong> " + subject + "</p>" +
		 "<p><strong>Message:</strong> " + msg + "</p>";
		 helper.setText(htmlContent, true);
		 mailSender.send(mimeMessage);
		 adminService.updateContactStatus(id);
		 ModelAndView mv = new ModelAndView("admin/viewcontacts");
		 mv.addObject("message", "Email Sent Successfully");
		 return mv;
	 }

	
	@GetMapping("adminprofile")
	public ModelAndView adminprofile() {
		ModelAndView mv = new ModelAndView("admin/adminprofile");
		return mv;
	}
	
	@PostMapping("updateadminprofile")
	public ModelAndView updateadminprofile(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		try {
			String name = request.getParameter("fullName");
			String username = request.getParameter("username");

			Admin a = new Admin();
			a.setName(name);
			a.setUsername(username);

			String msg = adminService.updateadminprofile(a);
			System.out.println(msg);
			System.out.println(username);
			Admin admin = adminService.displayAdminByID(username);
			System.out.println(admin.getName()+" "+admin.getEmail());
			HttpSession session = request.getSession();
			session.setAttribute("admin", admin);
			mv.setViewName("admin/adminprofile");
			mv.addObject("smessage", msg);

		} catch (Exception e) {
			mv.setViewName("updateerror");
			mv.addObject("fmessage", e);
		}
		return mv;
	}
	
	@PostMapping("updateadminpassword")
	public ModelAndView updateadminpassword(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("admin/adminprofile");
		try {

			HttpSession session = request.getSession();
			Admin a = (Admin) session.getAttribute("admin");

			String password = a.getPassword();
			String currentpassword = request.getParameter("currentPassword");
			String newpassword = request.getParameter("newPassword");
			String confirmpassword = request.getParameter("confirmPassword");

			String msg;
			if (!(password.equals(currentpassword))) {
				mv.addObject("Current password is incorrect");
				return mv;
			} else if (!(newpassword.equals(confirmpassword))) {
				mv.addObject("Password Doesn't Match");
				return mv;
			} else {
				Admin ad = new Admin();
				ad.setUsername(a.getUsername());
				ad.setPassword(newpassword);

				msg = adminService.updateAdminPass(ad);
				Admin admin = adminService.displayAdminByID(a.getUsername());
				session.setAttribute("admin", admin);

				mv.addObject("message", msg);
			}
		} catch (Exception e) {
			mv.setViewName("admin/adminprofile");
			mv.addObject("message", e);
		}
		return mv;
	}
	
	@GetMapping("adminlogout")
	public ModelAndView adminlogout(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("login");
		HttpSession session = request.getSession();
		session.removeAttribute("admin");
		return mv;
	}
}
