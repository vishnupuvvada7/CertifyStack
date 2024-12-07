package com.klef.jfsd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.klef.jfsd.model.Contact;

import jakarta.transaction.Transactional;

public interface ContactRepository extends JpaRepository<Contact, Integer> {
	
	@Query("update Contact c set c.status=?1 where  c.id=?2 ")
	@Modifying
	@Transactional
	public int setStatus(String status, int id);
	
	@Query("select c from Contact c where c.status=?1")
	public List<Contact> findByStatus(String status);
}
