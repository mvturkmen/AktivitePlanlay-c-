package com.mehmetvasfi.service;

import java.util.List;

import com.mehmetvasfi.dto.RequestDTO;
import com.mehmetvasfi.entites.Activity;
import com.mehmetvasfi.entites.Request;

public interface IRequestService {

    public Request sendRequest(Integer senderId,Integer activityId);

    void updateRequestStatus(Integer requestId, Boolean isAccepted);

    public List<RequestDTO>getRequestById(Integer id);

    public List<RequestDTO>getAcceptedRequestById(Integer id);

}
