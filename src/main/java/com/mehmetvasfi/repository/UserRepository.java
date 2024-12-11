package com.mehmetvasfi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mehmetvasfi.entites.User;
@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
	
}
