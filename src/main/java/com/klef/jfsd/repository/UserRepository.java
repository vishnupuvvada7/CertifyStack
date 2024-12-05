package com.klef.jfsd.repository;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.model.User;



@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
	
	@Query("select u from User u where u.username=?1 and u.password=?2 or u.email=?1 and u.password=?2")
	public User checkuserlogin(String username, String password);
	
	public User findById(int id);
	
	
}
