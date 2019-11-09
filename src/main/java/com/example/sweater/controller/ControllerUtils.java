package com.example.sweater.controller;

import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import java.util.Map;
import java.util.stream.Collector;
import java.util.stream.Collectors;

public class ControllerUtils {


    static Map getErrors(BindingResult bindingResult) {
        return bindingResult.getFieldErrors().stream().collect(getFieldErrorMapCollector());
    }

    static Collector<FieldError, ?, Map<String, String>> getFieldErrorMapCollector() {
        return Collectors.toMap(x -> x.getField() + "Error", x -> x.getDefaultMessage());
    }
}
