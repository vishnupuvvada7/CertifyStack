package com.klef.jfsd.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.klef.jfsd.model.Contact;

public interface ContactRepository extends JpaRepository<Contact, Integer> {

}
