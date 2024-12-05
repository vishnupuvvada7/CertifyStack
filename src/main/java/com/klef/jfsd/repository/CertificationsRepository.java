package com.klef.jfsd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.model.Certifications;

@Repository
public interface CertificationsRepository extends JpaRepository<Certifications, Integer> {
	
	@Query("SELECT distinct provider FROM Certifications")
	public List<String> viewallproviders();
	@Query("SELECT distinct level FROM Certifications")
	public List<String> viewalllevels();
}
