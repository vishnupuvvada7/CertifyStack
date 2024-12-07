package com.klef.jfsd.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.model.Admin;
import com.klef.jfsd.model.Certifications;
import com.klef.jfsd.model.Contact;
import com.klef.jfsd.model.Superadmin;
import com.klef.jfsd.model.User;
import com.klef.jfsd.service.AdminService;
import com.klef.jfsd.service.SuperAdminService;
import com.klef.jfsd.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private SuperAdminService superAdminService;
	
	@Autowired
	private UserService userService;

	@GetMapping("/")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView("home");
		return mv;
	}
	
	@GetMapping("/allcertifications")
	public ModelAndView allcertifications() {
		ModelAndView mv = new ModelAndView("allcertifications");
		
		List<Certifications> allCertifications = adminService.viewAllCerts();
        
        // Group certifications by provider
        Map<String, List<Certifications>> certificationsByProvider = allCertifications.stream()
            .collect(Collectors.groupingBy(Certifications::getProvider));
        System.out.println(certificationsByProvider);
        // Add levels for iteration
        List<String> levels = Arrays.asList("beginner", "intermediate", "advanced");
        
        mv.addObject("certificationsByProvider", certificationsByProvider);
        mv.addObject("levels", levels);
        
        return mv;
	}
	
	@GetMapping("/about")
	public ModelAndView about() {
		ModelAndView mv = new ModelAndView("about");
		return mv;
	}
	
	@GetMapping("/contact")
	public ModelAndView contact() {
		ModelAndView mv = new ModelAndView("contact");
		return mv;
	}
	
	@GetMapping("/forgot")
	public ModelAndView forgot() {
		ModelAndView mv = new ModelAndView("forgot");
		return mv;
	}
	
	@GetMapping("login")
	public ModelAndView userlogin() {
		ModelAndView mv = new ModelAndView("login");
		return mv;
	}
	
	@PostMapping("checklogin")
	public ModelAndView checkuserlogin(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		System.out.println(username + " " + password);

		Superadmin sa = superAdminService.checksuperadmin(username,password);
		
		if(sa!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("superadmin", sa);
			mv.setViewName("redirect:/superadmin");
			return mv; 
		}
		 

		Admin a = adminService.checkadminlogin(username, password);

		if (a != null) {
			HttpSession session = request.getSession();
			session.setAttribute("admin", a);
			mv.setViewName("redirect:/adminhome");
			return mv;
		}

		User u = userService.checkUserLogin(username, password);

		if (u != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", u);
			System.out.println(username);
			mv.setViewName("redirect:/userhome");
			return mv;
		}
		
		mv.setViewName("login");
		mv.addObject("message", "Login Failed");
		
		return mv;
	}
	
	@GetMapping("/sessionexpiry")
	public ModelAndView sessionexpired() {
		ModelAndView mv = new ModelAndView("sessionexpiry");
		return mv;
	}
	
	@PostMapping("/contactsubmit")
	public ModelAndView contactsubmit(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView("contact");

	    String name = request.getParameter("fullName");
	    String email = request.getParameter("email");
	    String message = request.getParameter("message");

	    Contact c = new Contact();
	    c.setName(name);
	    c.setEmail(email);
	    c.setMessage(message);

	    String msg = adminService.addContact(c);
	    if (msg!=null) {
	        mv.addObject("message", "Message sent successfully!");
	        mv.addObject("toastType", "success");
	    } else {
	        mv.addObject("message", "Failed to send message. Try again later.");
	        mv.addObject("toastType", "error");
	    }

	    return mv;
	}

	
	
}
