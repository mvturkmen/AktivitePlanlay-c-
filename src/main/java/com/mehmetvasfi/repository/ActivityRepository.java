package com.mehmetvasfi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mehmetvasfi.entites.Activity;

@Repository
public interface ActivityRepository  extends JpaRepository<Activity, Integer> {
	
}
