package com.mehmetvasfi.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;

import com.mehmetvasfi.DTO.RequestDTO;

import com.mehmetvasfi.entites.Request;

public interface IRequestController {

     ResponseEntity<String> acceptRequest(@PathVariable Integer id);

    // İsteği reddetme
    ResponseEntity<String> rejectRequest(@PathVariable Integer id);

    // İstek gönderme
    ResponseEntity<Request> sendRequest(@PathVariable Integer senderId, @PathVariable Integer activityId);

    ResponseEntity<List<RequestDTO>>getRequestById(Integer id);

    ResponseEntity<List<RequestDTO>>getAcceptedRequestById(Integer id);

}
