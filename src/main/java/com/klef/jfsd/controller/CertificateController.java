package com.klef.jfsd.controller;

import java.sql.Blob;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.model.Certificate;
import com.klef.jfsd.model.Renewal;
import com.klef.jfsd.model.User;
import com.klef.jfsd.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CertificateController {

	@Autowired
	private UserService userService;
	
	@GetMapping("certifications")
	public ModelAndView certifications(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
	    User u = (User) session.getAttribute("user");
	    if(u==null) {
	    	mv.setViewName("sessionexpiry");
	    	return mv;
	    }
		
		List<Certificate> certificates = userService.viewCertsByUser(u.getUsername());
		System.out.println();
		mv.setViewName("user/certifications");
		mv.addObject("certificates", certificates);
		return mv;
		
	}
	
	@GetMapping("addcertificate")
	public ModelAndView addcertification() {
		ModelAndView mv = new ModelAndView("user/addcertificate");
		return mv;
	}
	
	@PostMapping("savecertificate")
	public ModelAndView saveCertificate(HttpServletRequest request, @RequestParam("certificateFile") MultipartFile file) throws Exception{
		String name = request.getParameter("name");
	    String issuingOrganization = request.getParameter("issuingOrganization");
	    LocalDate issueDate = LocalDate.parse(request.getParameter("issueDate"));
	    LocalDate expiryDate = LocalDate.parse(request.getParameter("expiryDate"));
	    String certificationNumber = request.getParameter("certificationNumber");
	    byte[] bytes = file.getBytes();
		Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
	    String isglobal = request.getParameter("isglobal");
	    String notes = request.getParameter("notes");
	    String status = "ACTIVE";
	    HttpSession session = request.getSession();
	    User u = (User) session.getAttribute("user");
	    
	    Certificate c = new Certificate();
	    
	    c.setName(name);
	    c.setOrganization(issuingOrganization);
	    c.setIssuedate(issueDate);
	    c.setExpirydate(expiryDate);
	    c.setValidationid(certificationNumber);
	    c.setCdoc(blob);
	    c.setIsglobal(isglobal);
	    c.setCinfo(notes);
	    c.setUsername(u.getUsername());
	    c.setStatus(status);
	    

	    String msg = userService.addCertificate(c);
	    
	    List<Certificate> certificates = userService.viewCertsByUser(u.getUsername());
		ModelAndView mv = new ModelAndView("user/certifications");
		mv.addObject("certificates", certificates);
		mv.addObject("addedmessage", msg);
	    
	    return mv;
	}
	
	@GetMapping("viewcertificate/{id}")
	public ModelAndView displayCertificate(HttpServletRequest request,@PathVariable int id)
	{
		ModelAndView mv = new ModelAndView();
		Certificate c =  userService.displayCertificate(id);
		
		HttpSession session = request.getSession();
	    User u = (User) session.getAttribute("user");
	    
	    if(u==null) {
	    	mv.setViewName("sessionexpiry");
	    	return mv;
	    }
	    
	  	mv.addObject("certification", c);
	  	mv.setViewName("user/viewcertificate");
	  	return mv;
	}
	
	@GetMapping("displaycertpdf")
	public ResponseEntity<byte[]> displaycertPdf(@RequestParam int id) throws Exception {
		Certificate product = userService.displayCertificate(id);
       
       // Assuming the PDF file is stored as a Blob in the database
		byte[] pdfBytes = product.getCdoc().getBytes(1, (int) product.getCdoc().length());
       
		return ResponseEntity.ok()
               .contentType(MediaType.APPLICATION_PDF)
               .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"certificate.pdf\"") // Inline view in browser
               .body(pdfBytes);
	}
	
	@PostMapping("deletecertificate/{id}")
	public ModelAndView deletecertificate(HttpServletRequest request, @PathVariable int id) {
		String msg = userService.deleteCertificate(id);
		HttpSession session = request.getSession();
	    User u = (User) session.getAttribute("user");
	    
		List<Certificate> certificates = userService.viewCertsByUser(u.getUsername());
		ModelAndView mv = new ModelAndView("user/certifications");
		mv.addObject("certificates", certificates);
		mv.addObject("deletedmessage", msg);
		return mv;
	}
	
	@GetMapping("renewals")
	public ModelAndView renewals(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
	    User u = (User) session.getAttribute("user");
	    
	    if(u==null) {
	    	mv.setViewName("sessionexpiry");
	    	return mv;
	    }
	    
		List<Certificate> certificates = userService.viewCertsByUserandStatus(u.getUsername(),"EXPIRINGSOON");
		mv.addObject("renewals", certificates);
		mv.setViewName("user/renewals");
		return mv;
	}
	
	@GetMapping("renewalcertification/{id}")
	public ModelAndView renewalcertification(HttpServletRequest request, @PathVariable int id) {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
	    User u = (User) session.getAttribute("user");
	    
	    if(u==null) {
	    	mv.setViewName("sessionexpiry");
	    	return mv;
	    }
	    
	    Certificate c =  userService.displayCertificate(id);
	    mv.addObject("certification", c);
		mv.setViewName("user/renewalcertification");
		return mv;
	}
	
	@PostMapping("renewalcertificate/{id}")
	public ModelAndView renewalcertificate(HttpServletRequest request,@RequestParam int id, @RequestParam("certificateFile") MultipartFile file) throws Exception{
		
		String name = request.getParameter("name");
	    String issuingOrganization = request.getParameter("issuingOrganization");
	    LocalDate issueDate = LocalDate.parse(request.getParameter("issueDate"));
	    LocalDate expiryDate = LocalDate.parse(request.getParameter("expiryDate"));
	    String certificationNumber = request.getParameter("certificationNumber");
	    byte[] bytes = file.getBytes();
		Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
	    String isglobal = request.getParameter("isglobal");
	    String notes = request.getParameter("notes");
	    String status = "RENEWAL";
	    HttpSession session = request.getSession();
	    User u = (User) session.getAttribute("user");
	    
	    Renewal r = new Renewal();
	    
	    r.setCid(id);
	    r.setName(name);
	    r.setOrganization(issuingOrganization);
	    r.setIssuedate(issueDate);
	    r.setExpirydate(expiryDate);
	    r.setValidationid(certificationNumber);
	    r.setCdoc(blob);
	    r.setIsglobal(isglobal);
	    r.setCinfo(notes);
	    r.setUsername(u.getUsername());
	    r.setStatus(status);
	    

	    userService.addRenewal(r);
	    
		ModelAndView mv = new ModelAndView();
		List<Certificate> certificates = userService.viewCertsByUserandStatus(u.getUsername(),"EXPIRINGSOON");
		mv.addObject("renewals", certificates);
		mv.setViewName("user/renewals");
	    
	    return mv;
	}
	
	
	/*filters*/
	@GetMapping("certifications/filter")
	public ModelAndView filterCert(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		String filter = request.getParameter("filter");
		HttpSession session = request.getSession();
	    User u = (User) session.getAttribute("user");
	    if(u==null) {
	    	mv.setViewName("sessionexpiry");
	    	return mv;
	    }
	    System.out.println(u.getUsername());
	    System.out.println(filter);
        List<Certificate> certificates=userService.viewCertsByFilter(u.getUsername(),filter);
        System.out.println(certificates.size());
        mv.addObject("selectedFilter",filter);
        mv.setViewName("user/certifications");
        mv.addObject("certificates",certificates);
        return mv;
	}
	
	

}
