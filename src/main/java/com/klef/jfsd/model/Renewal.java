package com.klef.jfsd.model;

import java.sql.Blob;
import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "renewal_table")
public class Renewal {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="rid")
	private int id;
	@Column(name="rname",nullable=false,length = 50)
	private String name;
	@Column(name="rorganization",nullable=false,length = 50)
	private String organization;
	@Column(name="rissue")
	private LocalDate issuedate;
	@Column(name="rexpiry")
	private LocalDate expirydate;
	@Column(name="rvalidationid",nullable=false, unique = true,length = 50)
	private String validationid;
	@Column(name="risglobal",length=10)
	private String isglobal;
	@Column(name="rdoc")
	private Blob cdoc;
	@Column(name="info")
	private String cinfo;
	@Column(name="rstatus")
	private String status;
	@Column(name="username")
	private String username;
	@Column(name = "cid")
	private int cid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOrganization() {
		return organization;
	}
	public void setOrganization(String organization) {
		this.organization = organization;
	}
	public LocalDate getIssuedate() {
		return issuedate;
	}
	public void setIssuedate(LocalDate issuedate) {
		this.issuedate = issuedate;
	}
	public LocalDate getExpirydate() {
		return expirydate;
	}
	public void setExpirydate(LocalDate expirydate) {
		this.expirydate = expirydate;
	}
	public String getValidationid() {
		return validationid;
	}
	public void setValidationid(String validationid) {
		this.validationid = validationid;
	}
	public String getIsglobal() {
		return isglobal;
	}
	public void setIsglobal(String isglobal) {
		this.isglobal = isglobal;
	}
	public Blob getCdoc() {
		return cdoc;
	}
	public void setCdoc(Blob cdoc) {
		this.cdoc = cdoc;
	}
	public String getCinfo() {
		return cinfo;
	}
	public void setCinfo(String cinfo) {
		this.cinfo = cinfo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
}
