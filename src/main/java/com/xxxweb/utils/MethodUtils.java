package com.xxxweb.utils;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

@Component
public class MethodUtils {
    @Resource
    DataUtils dataUtils;
    public HashMap<String, String> uploadFile(MultipartFile file, HttpServletRequest request){
        HashMap<String, String> map = new HashMap<String, String>();
        String errorInfo = "";
        if (file != null) {// 判断上传的文件是否为空
            String path = null;// 文件路径
            String type = null;// 文件类型
            String fileName = file.getOriginalFilename();// 文件原名称

            // 判断文件类型
            type = fileName.indexOf(".") != -1 ? fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length()) : null;
            if (type != null) {// 判断文件类型是否为空
                if ("GIF".equals(type.toUpperCase()) || "PNG".equals(type.toUpperCase()) || "JPG".equals(type.toUpperCase())) {
                    // 项目在容器中实际发布运行的根路径
                    path = request.getSession().getServletContext().getRealPath("upload");
                    // 自定义的文件名称
                    fileName = dataUtils.getUUidFileName(fileName);
                    // 设置存放图片文件的路径
                    File dir = new File(path, fileName);
                    if (!dir.exists()) {
                        dir.mkdirs();
                    }
                    // 转存文件到指定的路径
                    //MultipartFile自带的解析方法
                    try {
                        file.transferTo(dir);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
//                    success
                    map.put("fileName", fileName);
                } else {
                    errorInfo = "不是我们想要的文件类型,请按要求重新上传";
                    map.put("errorInfo", errorInfo);
                }
            }
//            else {
//                errorInfo = "文件类型为空";
//                map.put("errorInfo", errorInfo);
//            }
        } else {
            errorInfo = "没有找到相对应的文件";
            map.put("errorInfo", errorInfo);
        }
        return map;
    }
}
