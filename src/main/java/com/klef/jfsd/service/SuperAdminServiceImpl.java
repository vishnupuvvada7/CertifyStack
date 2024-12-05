package com.klef.jfsd.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.model.Superadmin;
import com.klef.jfsd.repository.SuperAdminRepository;

@Service
public class SuperAdminServiceImpl implements SuperAdminService{
	
	@Autowired
	private SuperAdminRepository superAdminRepository;

	@Override
	public Superadmin checksuperadmin(String username, String password) {
		if(username.equals("admin")||username.equals("admin@gmail.com")) {
			return superAdminRepository.checksuperadminlogin(username,password);
		}
		return null;
	}
}
