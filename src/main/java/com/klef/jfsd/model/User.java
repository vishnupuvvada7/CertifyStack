package com.klef.jfsd.model;

import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "user_table")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="uid")
	private int id;
	@Column(name="uname",nullable=false,length = 50)
	private String name;
	@Column(name="ugender",nullable=false,length = 20)
	private String gender;
	@Column(name="udob",nullable=false,length = 20)
	private String dateofbirth;
	@Column(name = "uusername", length = 15, nullable = false, unique = true)
	private String username;
	@Column(name="uemail",nullable=false,unique = true,length = 50)
	private String email;
	@Column(name="upassword",nullable=false,length = 50)
	private String password;
	@Column(name="ucontact",nullable=false,unique = true,length = 20)
	private String contact;
	@Column(name = "uprofilepic")
	private Blob profilepic;
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDateofbirth() {
		return dateofbirth;
	}
	public void setDateofbirth(String dateofbirth) {
		this.dateofbirth = dateofbirth;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public Blob getProfilepic() {
		return profilepic;
	}
	public void setProfilepic(Blob profilepic) {
		this.profilepic = profilepic;
	}
	
}
