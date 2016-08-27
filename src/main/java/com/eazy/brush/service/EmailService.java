package com.eazy.brush.service;

import java.util.List;
import java.util.Map;

public interface EmailService {

    Map<String, Object> getEmailById(String id);

    void add(String name);

    void delete(String id);

    List<Map<String, Object>> selectEmail(String date);

    List<Map<String, Object>> selectEmail();
}
