package com.mehmetvasfi.service;

import com.mehmetvasfi.entites.Activity;
import com.mehmetvasfi.entites.Request;

public interface IRequestService {

    public Request sendRequest(Integer senderId,Integer activityId);

    void updateRequestStatus(Integer requestId, Boolean isAccepted);

    public Activity getRequestById(Integer id);

}
