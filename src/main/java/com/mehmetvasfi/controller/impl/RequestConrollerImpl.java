package com.mehmetvasfi.controller.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mehmetvasfi.DTO.RequestDTO;
import com.mehmetvasfi.controller.IRequestController;
import com.mehmetvasfi.entites.Activity;
import com.mehmetvasfi.entites.Request;
import com.mehmetvasfi.service.impl.RequestServiceImpl;

import lombok.RequiredArgsConstructor;



@RestController
@RequestMapping("rest/api/request")
@RequiredArgsConstructor
public class RequestConrollerImpl  implements IRequestController{

    @Autowired
   private RequestServiceImpl requestService;

   @PostMapping("/{id}/accept")
    public ResponseEntity<String>acceptRequest(@PathVariable Integer id){
           

        requestService.updateRequestStatus(id,true);
        return ResponseEntity.ok("Request accepted");
    }

    @Override
    @PostMapping("/{id}/reject")
    public ResponseEntity<String> rejectRequest(@PathVariable Integer id) {
        requestService.updateRequestStatus(id, false);
        return ResponseEntity.ok("Request rejected");
    }

    @Override
    @PostMapping(path="/{senderId}/send/{activityId}")
    public ResponseEntity<Request> sendRequest(@PathVariable Integer senderId, @PathVariable Integer activityId) {
        Request request = requestService.sendRequest(senderId, activityId);
        return ResponseEntity.ok(request);
    }

    @Override
    @GetMapping(path="/list/{id}")
    public ResponseEntity<List<RequestDTO>> getRequestById(@PathVariable(name = "id") Integer id){

        List<RequestDTO>requestDTOs=requestService.getRequestById(id);
        return ResponseEntity.ok(requestDTOs);
    }

    @Override
    @GetMapping(path = "/accepted/list/{id}")
    public ResponseEntity<List<RequestDTO>> getAcceptedRequestById(@PathVariable(name = "id") Integer id) {
        List<RequestDTO> requestDTOs = requestService.getAcceptedRequestById(id);
        return ResponseEntity.ok(requestDTOs);
    }
    

}
