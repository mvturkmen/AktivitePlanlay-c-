package com.mehmetvasfi.exception;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {
	//Spting validation dan fırlatılan hataları alıp yonetmek
	
	private List<String> addMapValue(List<String> list, String newValue){
		list.add(newValue);
		return list;
	}
	
	@ExceptionHandler(value = MethodArgumentNotValidException.class)
	public ResponseEntity<ApiError> handleMethodArgumentNotValidException(MethodArgumentNotValidException ex) {
		Map<String, List<String>> errorsMap = new HashMap<>();
		for (ObjectError objectError : ex.getBindingResult().getAllErrors()) {
			String fieldName = ((FieldError)objectError).getField();
			if(errorsMap.containsKey(fieldName)) {
				errorsMap.put(fieldName, addMapValue(errorsMap.get(fieldName), objectError.getDefaultMessage()));
			}
			else {
				errorsMap.put(fieldName, addMapValue(new ArrayList<>(), objectError.getDefaultMessage()));
				
			}	
		}
		return ResponseEntity.badRequest().body(createApiError(errorsMap));
		
	}
	
	private <T> ApiError <T> createApiError(T  errors) {
		ApiError<T> apiError = new ApiError<T>();
		apiError.setId(UUID.randomUUID().toString());
		apiError.setErrors(errors);
		apiError.setErrorTimeDate(new Date());
		
		return apiError;
	}
	
	
	
}
