package com.klef.jfsd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.model.Admin;
import com.klef.jfsd.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class SuperAdminController {
	
	@Autowired
	private AdminService adminService;

	@GetMapping("superadmin")
	public ModelAndView superadmin() {

		ModelAndView mv = new ModelAndView("admin/superadmin");
		List<Admin> adminlist = adminService.viewAllAdmins();
		mv.addObject("adminlist",adminlist);
		
		return mv;
	}
	
	@PostMapping("insertadmin")
	public ModelAndView insertadmin(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView("redirect:/superadmin");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Admin a = new Admin();
		a.setName(name);
		a.setEmail(email);
		a.setUsername(username);
		a.setPassword(password);
		String msg = adminService.insertadmin(a);
		
		mv.addObject("message",msg);
		return mv;
	}
	
	@PostMapping("updateadmin")
	public ModelAndView updateadmin(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView("redirect:/superadmin");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Admin a = new Admin();
		a.setUsername(username);
		a.setName(name);
		a.setEmail(email);
		a.setPassword(password);
		adminService.updateadmin(a);
		return mv;
	}
	
	@PostMapping("deleteadmin")
	public ModelAndView deleteadmin(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView("redirect:/superadmin");
		String username = request.getParameter("username");
		adminService.deleteadmin(username);
		return mv;
		
	}
	
	@GetMapping("superadminlogout")
	public String superadminlogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("superadmin");
		return "redirect:/login";
	}
}
