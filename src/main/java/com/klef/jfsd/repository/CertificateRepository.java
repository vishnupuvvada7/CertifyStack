package com.klef.jfsd.repository;


import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.model.Certificate;

import jakarta.transaction.Transactional;

@Repository
public interface CertificateRepository extends JpaRepository<Certificate, Integer> {
	@Query("select c from Certificate c where c.username=?1 and c.status <> 'RENEWAL' ")
	public List<Certificate> findByUsername(String username);
	public Certificate findById(int id);
	
	@Query("select c from Certificate c where c.username=?1 and c.isglobal=?2")
	public List<Certificate> findAllGlobal(String username,String status);
	
	@Query("select c from Certificate c where c.username=?1 and c.status=?2")
	public List<Certificate> findByStatus(String username,String status);
	
	@Query("select c from Certificate c where c.isglobal=?1")
	public List<Certificate> viewSubmittedCerts(String isglobal);
	
	@Query("select c from Certificate c where c.status=?1")
	public List<Certificate> viewRenewalCerts(String status);
	
	@Query("update Certificate c set c.isglobal=?1 where  c.id=?2 ")
	@Modifying
	@Transactional
	public int approveGlobal(String status, int id);
	
	@Query("update Certificate c set c.status=?1 where  c.id=?2 ")
	@Modifying
	@Transactional
	public int approveRenewal(String status, int id);
	
	@Modifying
    @Transactional
    @Query("UPDATE Certificate c SET c.status = :status WHERE c.expirydate BETWEEN :startOfNextMonth AND :endOfNextMonth")
	int updateStatusForNextMonthItems(String status, LocalDate startOfNextMonth, LocalDate endOfNextMonth);
	
	@Modifying
    @Transactional
    @Query("UPDATE Certificate c SET c.status = :status WHERE c.expirydate < :currentDate")
    int updateStatusForExpiredItems(String status, LocalDate currentDate);
	
	@Query("select count(c) from Certificate c where c.status='ACTIVE'")
	public long activecertificates();
	
	@Query("select count(c) from Certificate c where c.status='EXPIRINGSOON'")
	public long expiringcertificates();
	
	@Query("select count(c) from Certificate c where c.status='SUBMITTED'")
	public long pendingcertificates();
	
	@Query("select count(c) from Certificate c where c.isglobal='GLOBAL'")
	public long globalcertificatescount();
}


