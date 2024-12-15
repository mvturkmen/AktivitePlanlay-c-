package com.mehmetvasfi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mehmetvasfi.entites.Request;

@Repository
public interface RequestRepository extends JpaRepository<Request,Integer>{

}
