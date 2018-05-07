package com.xxxweb.web;

import com.xxxweb.entity.Sign;
import com.xxxweb.service.SignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Calendar;

@Controller
@RequestMapping(value = "attend")
public class AttendController {
    @Autowired
    SignService signService;

    @RequestMapping(value = "index")
    public String index() {


//        获取今天所有打卡情况
        Calendar calendar = Calendar.getInstance();
        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH);
        int day = calendar.get(Calendar.DAY_OF_MONTH);
        month += 1;
        ArrayList<Sign> signs = signService.todayDaList(year, month, day);

        System.out.println("signs: " + signs);
        return "admin/attend/index";
    }

}
