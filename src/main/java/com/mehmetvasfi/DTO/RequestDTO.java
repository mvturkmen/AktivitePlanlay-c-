package com.mehmetvasfi.dto;



import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RequestDTO {

    private Integer requestId;
    private Integer senderId;
    private Date requestDate;
    private boolean Accepted;

    

 
}
