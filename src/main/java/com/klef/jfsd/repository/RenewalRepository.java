package com.klef.jfsd.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.klef.jfsd.model.Renewal;

public interface RenewalRepository extends JpaRepository<Renewal, Integer> {

}
