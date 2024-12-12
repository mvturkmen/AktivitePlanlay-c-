package com.mehmetvasfi.exception;

import java.util.Date;
import java.util.List;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //Getter Setteer ekler
@NoArgsConstructor
@AllArgsConstructor
public class ApiError <T> {
	private String id;
	
	private Date errorTimeDate;
	
	private T errors;
	
	
}
