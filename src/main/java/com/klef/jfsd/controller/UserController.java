package com.klef.jfsd.controller;

import java.sql.Blob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.model.Contact;
import com.klef.jfsd.model.User;
import com.klef.jfsd.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@GetMapping("userreg")
	public ModelAndView userreg(Model m) {
		ModelAndView mv = new ModelAndView("userreg");
		return mv;
	}

	@PostMapping("insertuser")
	public ModelAndView insertuser(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("login");

		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String year = request.getParameter("year");
		String dob = year + "-" + month + "-" + day;
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String contact = request.getParameter("contact");

		User u = new User();

		u.setName(name);
		u.setGender(gender);
		u.setDateofbirth(dob);
		u.setUsername(username);
		u.setEmail(email);
		u.setPassword(password);
		u.setContact(contact);

		HttpSession session = request.getSession();
		session.setAttribute("user", u);

		String msg = userService.userRegistration(u);
		mv.addObject("regsuccessmessage", msg);
		return mv;
	}


	@GetMapping("userhome")
	public ModelAndView userhome() {
		ModelAndView mv = new ModelAndView("user/userhome");
		return mv;
	}

	@GetMapping("userprofile")
	public ModelAndView empprofile() {
		ModelAndView mv = new ModelAndView("user/userprofile");
		return mv;
	}

	@PostMapping("/updateprofile")
	public ModelAndView updateuserprofile(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("fullName");
			String gender = request.getParameter("gender");
			String contact = request.getParameter("phone");

			User u = new User();
			u.setId(id);
			u.setName(name);
			u.setGender(gender);
			u.setContact(contact);

			String msg = userService.updateUserProfile(u);

			System.out.println(id);
			User user = userService.displayUserByID(id);
			HttpSession session = request.getSession();
			session.setAttribute("user", user);

			mv.setViewName("user/userprofile");
			mv.addObject("smessage", msg);

		} catch (Exception e) {
			mv.setViewName("updateerror");
			mv.addObject("fmessage", e);
		}
		return mv;
	}

	@PostMapping("/addprofilepic")
	public ModelAndView adduserprofile(HttpServletRequest request, @RequestParam("profile") MultipartFile file)
			throws Exception {
		ModelAndView mv = new ModelAndView();
		try {
			HttpSession session = request.getSession();
			User u = (User) session.getAttribute("user");

			byte[] bytes = file.getBytes();
			Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

			User us = new User();
			us.setId(u.getId());
			us.setProfilepic(blob);

			String msg = userService.addUserProfile(us);

			User user = userService.displayUserByID(u.getId());
			session.setAttribute("user", user);

			mv.setViewName("user/userprofile");
			mv.addObject("smessage", msg);

		} catch (Exception e) {
			mv.setViewName("user/userprofile");
			mv.addObject("fmessage", e);
		}
		return mv;
	}

	@GetMapping("displayprofilepic")
	public ResponseEntity<byte[]> displayprofilepic(@RequestParam int id) throws Exception {

		User user = userService.displayUserByID(id);
		byte[] imageBytes = null;
		imageBytes = user.getProfilepic().getBytes(1, (int) user.getProfilepic().length());

		return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);

	}

	@PostMapping("updatepassword")
	public ModelAndView updateuserpassword(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("user/userprofile");
		try {

			HttpSession session = request.getSession();
			User u = (User) session.getAttribute("user");

			String password = u.getPassword();
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
				User us = new User();
				us.setId(u.getId());
				us.setPassword(newpassword);

				msg = userService.updateUserPass(us);
				User user = userService.displayUserByID(u.getId());
				session.setAttribute("user", user);

				mv.addObject("message", msg);
			}
		} catch (Exception e) {
			mv.setViewName("user/userprofile");
			mv.addObject("message", e);
		}
		return mv;
	}

	@GetMapping("/userhelp")
	public ModelAndView help() {
		ModelAndView mv = new ModelAndView("user/help");
		return mv;
	}
	
	@GetMapping("/usercontact")
	public ModelAndView usercontact() {
		ModelAndView mv = new ModelAndView("user/usercontact");
		return mv;
	}
	
	@PostMapping("/usercontactsubmit")
	public ModelAndView usercontactsubmit(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:/usercontact");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String message = request.getParameter("message");
		
		Contact c = new Contact();
		c.setName(name);
		c.setEmail(email);
		c.setMessage(message);
		
		String msg = userService.addContact(c);
		
		mv.addObject("contactmsg", msg);
		
		return mv;
	}

	@GetMapping("userlogout")
	public ModelAndView userlogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		ModelAndView mv = new ModelAndView("login");
		return mv;
	}

}
