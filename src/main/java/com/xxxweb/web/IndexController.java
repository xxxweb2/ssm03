package com.xxxweb.web;

import com.xxxweb.service.SignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "index")
public class IndexController {

    @Autowired
    SignService signService;


    @RequestMapping(value = "/index")
    public String index() {
        return "redirect:login/index";
    }
}
