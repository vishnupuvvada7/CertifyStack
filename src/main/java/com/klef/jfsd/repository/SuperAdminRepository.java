package com.klef.jfsd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.model.Superadmin;

@Repository
public interface SuperAdminRepository extends JpaRepository<Superadmin, String> {
	
	@Query("select sa from Superadmin sa where sa.username=?1 and sa.password=?2 or sa.email=?1 and sa.password=?2")
	public Superadmin checksuperadminlogin(String username, String password);
}
