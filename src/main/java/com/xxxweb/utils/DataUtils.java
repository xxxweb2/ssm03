package com.xxxweb.utils;

import org.springframework.stereotype.Component;

import java.util.LinkedHashMap;
import java.util.UUID;

@Component
public class DataUtils {
   static LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();
    public  String getUUidFileName(String fileName){
        int lastIndexOf = fileName.lastIndexOf(".");
        String lastName = fileName.substring(lastIndexOf,fileName.length());
        String uuid=UUID.randomUUID().toString().replace("-", "");
        return uuid+lastName;
    }
}
