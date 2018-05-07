package com.xxxweb.web;

import com.xxxweb.entity.QfUser;
import com.xxxweb.entity.Sign;
import com.xxxweb.service.SignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

@Controller
@RequestMapping(value = "admin")
public class AdminController {

    @Autowired
    SignService signService;


    @RequestMapping(value = "/index")
    public String index(ModelMap model, HttpSession session) {

//        查询未打卡次数
        Calendar calendar = Calendar.getInstance();
        int month = calendar.get(Calendar.MONTH) + 1;

//        QfUser user = (QfUser)session.getAttribute("user");
//        int userId = user.getId();
        int noClockCount = signService.noClockCountByMonth(1, month, 1);
//        查询迟到次数
        int laterCount = signService.noClockCountByMonth(1, month, 2);

        //        查询早退次数
        int leaveCount = signService.noClockCountByMonth(1, month, 3);

//        查询外出次数

        model.addAttribute("leaveCount", leaveCount);
        model.addAttribute("laterCount", laterCount);
//        model.addAttribute("noClockCount", noClockCount);


//        查看打卡情况 在首页显示
        Calendar calendar1 = Calendar.getInstance();
        int day = calendar.get(Calendar.DAY_OF_MONTH);

        QfUser user = (QfUser) session.getAttribute("user");


        ArrayList<Sign> signListDetail = signService.getSignListDetail(user.getId(), day);
        model.addAttribute("signList", signListDetail);


//        统计本月 未打卡次数
//        情况1 不是本月上班
//        情况2: 是本月上班
        String inTime = user.getIntime();
//        2018-05-01 22:13:15
//        分隔字符串 获取年月日

        String[] splits = inTime.split(" ");
        String nyrStr = splits[0];
        String[] nyrArr = nyrStr.split("-");

        int inY = Integer.parseInt(nyrArr[0]);
        int inM = Integer.parseInt(nyrArr[1]);
        int inD = Integer.parseInt(nyrArr[2]);

        int nowY = calendar.get(Calendar.YEAR);
        int nowM = calendar.get(Calendar.MONTH);
        int nowD = calendar.get(Calendar.DAY_OF_MONTH);
        int count = 0;
//        本月入职
        if (inY == nowY && inM == (nowM + 1)) {

//            计算入职到现在的应该打卡的次数

//            calendar.set(Calendar.DAY_OF_MONTH, -1);
//            calendar.set(Calendar.MONTH, inM + 1);
            Calendar calendar2 = Calendar.getInstance();
            while (inD < calendar2.get(Calendar.DAY_OF_MONTH)) {
                calendar.set(Calendar.DAY_OF_MONTH, inD);
                int dayWeek = calendar.get(Calendar.DAY_OF_WEEK);


                if (dayWeek != Calendar.SUNDAY && dayWeek != Calendar.SATURDAY) {
                    count++;
                }
                inD++;
            }


        } else {
//            不是本月入职

            int nowDay = 1;
            Calendar calendar2 = Calendar.getInstance();
            while (nowDay < calendar2.get(Calendar.DAY_OF_MONTH)) {
                calendar.set(Calendar.DAY_OF_MONTH, nowDay);
                int dayWeek = calendar.get(Calendar.DAY_OF_WEEK);
                if (dayWeek != Calendar.SUNDAY && dayWeek != Calendar.SATURDAY) {
                    count++;
                }
                nowDay += 1;
            }
        }

//        查询打了多少次卡
        nowM += 1;
        int daCount = signService.countDa(user.getId(), nowY, nowM);
        count *= 2;
        int weiDa = count - daCount;
        model.addAttribute("noClockCount", weiDa);
        return "admin/index";
    }

    @RequestMapping(value = "/da")
    @ResponseBody
    public int da(HttpSession session) {
        int res = 0;
//        8 点之前打卡 正常

//        8点之后 到 6点之前 第一次打卡迟到 第二次打卡算早退
//        6点之后打卡正常
        Calendar instance = Calendar.getInstance();
        int hour = instance.get(Calendar.HOUR_OF_DAY);

        Sign sign = new Sign();
//            session.setAttribute("user", userByName);
        QfUser user = (QfUser) session.getAttribute("user");
        hour = 9;
        if (hour < 8) {
            //            正常早到打卡
            sign.setState(0);
            res = 1;
        }
        //        8点之后 到 6点之前 第一次打卡迟到 第二次打卡算早退
        if (hour >= 8 && hour < 18) {

//            查询数据库今天是否打卡
            int day = instance.get(Calendar.DAY_OF_MONTH);
            int isDa = signService.isDa(day);
            if (isDa > 0) {
//                打过卡 早退
                res = 2;
                sign.setState(3);
            } else {
//                迟到
                res = 1;
                sign.setState(2);
            }
        }
        if (hour > 18) {
            sign.setState(0);
            res = 2;
        }

        sign.setUid(user.getId());
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sign.setTime(df.format(new Date()));
        signService.insertSign(sign);
        return res;
    }

    @RequestMapping(value = "/daDetail")
    @ResponseBody
    public ArrayList<Integer> daDetail(HttpSession session) {

        ArrayList<Integer> res = new ArrayList<Integer>();

        QfUser user = (QfUser) session.getAttribute("user");
        Calendar calendar = Calendar.getInstance();
        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH) + 1;

        ArrayList<Sign> signList = signService.daDetail(user.getId(), year, month);

        int[] list = new int[signList.size()];


        int len = signList.size();

        if (len != 0) {


            for (int i = 0; i < len; i++) {
                Sign sign = signList.get(i);
                String inTime = sign.getTime();
//            获取日期
                String[] split = inTime.split(" ");
                String[] split1 = split[0].split("-");
                int day = Integer.parseInt(split1[2]);
                list[i] = day;
            }
        }
        int nowDay = 1;
        int listIndex = 0;

        Calendar calendar1 = Calendar.getInstance();

        String inTime = user.getIntime();
//        2018-05-01 22:13:15
//        分隔字符串 获取年月日

        String[] splits = inTime.split(" ");
        String nyrStr = splits[0];
        String[] nyrArr = nyrStr.split("-");

        int inY = Integer.parseInt(nyrArr[0]);
        int inM = Integer.parseInt(nyrArr[1]);
        int inD = Integer.parseInt(nyrArr[2]);

        int nowD = calendar1.get(Calendar.MONTH);
        nowD++;
        if (nowD == inM) {
            nowDay = inD;
        }


        while (nowDay < calendar1.get(Calendar.DAY_OF_MONTH)) {

            calendar.set(Calendar.DAY_OF_MONTH, nowDay);
            int dayWeek = calendar.get(Calendar.DAY_OF_WEEK);

            if (dayWeek != Calendar.SUNDAY && dayWeek != Calendar.SATURDAY) {

                if (list.length == 0) {
                    res.add(nowDay);
                    nowDay += 1;
                    continue;
                }
                if (nowDay == list[listIndex]) {
                    listIndex++;
                    if (list.length == listIndex) {
                        listIndex = listIndex - 1;
                    }
                } else {
                    res.add(nowDay);
                }
            }
            nowDay += 1;
        }
        System.out.println("lsit: " + res);
        return res;

    }
}
