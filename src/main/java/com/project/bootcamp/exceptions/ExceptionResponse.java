package com.project.bootcamp.exceptions;

import org.springframework.web.bind.annotation.ExceptionHandler;

public class ExceptionResponse {

    private String message;

    public ExceptionResponse(String message){
        this.message = message;
    }

    public String getMessage() {
        return message;
    }
}
