package com.mehmetvasfi.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mehmetvasfi.dto.RequestDTO;
import com.mehmetvasfi.entites.Activity;
import com.mehmetvasfi.entites.Request;
import com.mehmetvasfi.entites.User;
import com.mehmetvasfi.repository.ActivityRepository;
import com.mehmetvasfi.repository.RequestRepository;
import com.mehmetvasfi.repository.UserRepository;
import com.mehmetvasfi.service.IRequestService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RequestServiceImpl implements IRequestService {

    @Autowired
    private RequestRepository requestRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ActivityRepository activityRepository;

    @Autowired
    private ActivityServiceImpl activityService;

    @Override
    public Request sendRequest(Integer senderId, Integer activityId) {
        
        User sender=userRepository.findById(senderId).orElseThrow(()-> new RuntimeException("User not found"));
        Activity activity=activityRepository.findById(activityId).orElseThrow(()->new RuntimeException("Acticity not found"));

        Request request=new Request();
        request.setSender(sender);
        request.setActivity(activity);
        request.setRequestDate(new Date());
        request.setIsAccepted(false);

        return requestRepository.save(request);

    }
    @Override
    public void updateRequestStatus(Integer requestId, Boolean isAccepted) {
        Request request = requestRepository.findById(requestId)
                .orElseThrow(() -> new RuntimeException("Request not found"));

        request.setIsAccepted(isAccepted);
        requestRepository.save(request);
    }


   /*  @Override
    public Activity getRequestById(Integer id){

      
        Optional<Activity>optional=activityRepository.findById(id);
        if(optional.isEmpty()){

            throw new RuntimeException("user not found with if id:"+id);
        }

        Activity dbActivity=optional.get();
        List<Request>dbRequest=optional.get().getRequests();

        if(dbRequest !=null && dbRequest.isEmpty()){
            for (Request request : dbRequest) {

                Request request2=new Request();
                dbActivity.getRequests().add(request2);
                
            }
        }

        return dbActivity;
    }*/

    @Override
    public List<RequestDTO> getRequestById(Integer id) {
        Activity activity = activityRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Activity not found with id: " + id));

        List<RequestDTO> requestDTOs = activity.getRequests().stream().map(request -> {
            RequestDTO dto = new RequestDTO();
            dto.setRequestId(request.getId());
            dto.setSenderId(request.getSender().getId());
            
            dto.setAccepted(request.getIsAccepted());
            dto.setRequestDate(request.getRequestDate());
            return dto;
        }).toList();

        return requestDTOs;
    }

    @Override
    public List<RequestDTO>getAcceptedRequestById(Integer id){
        Activity activity=activityRepository.findById(id).orElseThrow(()-> new RuntimeException("Activity not found with id:"+id));
        List<RequestDTO>requestDTOs=activity.getRequests().stream().filter(request->request.getIsAccepted()).map(request->
        {
            RequestDTO dto=new RequestDTO();
            dto.setRequestId(request.getId());
            dto.setSenderId(request.getSender().getId());
            dto.setAccepted(request.getIsAccepted());
            dto.setRequestDate(request.getRequestDate());
            return dto;

        }).toList();

        return requestDTOs;

    }

    

}
