package com.xxxweb.web;

import com.xxxweb.entity.Sign;
import com.xxxweb.service.SignService;
import com.xxxweb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Calendar;

@Controller
@RequestMapping(value = "attend")
public class AttendController {
    @Autowired
    SignService signService;

    @Autowired
    UserService userService;

    @RequestMapping(value = "index")
    public String index(ModelMap model, @RequestParam(value = "time", defaultValue = "") String paramTime,
                        @RequestParam(value = "type", defaultValue = "-1") int paramType,
                        @RequestParam(value = "typeDa", defaultValue = "-1") int paramTypeDa,
                        @RequestParam(value = "name", defaultValue = "") String paramName) {
        ArrayList<Sign> signs = null;
        if (!paramTime.equals("")) {

            model.addAttribute("indexTime", paramTime);
            model.addAttribute("indexType", paramType);
            model.addAttribute("indexTypeDa", paramTypeDa);
            model.addAttribute("indexName", paramName);

            String[] split = paramTime.split("-");
            int paramY = Integer.parseInt(split[0]);
            int paramM = Integer.parseInt(split[1]);
            int paramD = Integer.parseInt(split[2]);
//   <option value="0">所有(上班+下班)</option>
//                <option value="1">上班</option>
//                <option value="2">下班</option>

//  <option value="0">所有(迟到+未迟到)</option>
//                <option value="1">迟到</option>
//                <option value="2">未迟到</option>

            int left = 0;
            int right = 24;

            if (paramType == 2) {
                left = 18;
                right = 24;
            }

            if (paramType == 1) {
                if (paramTypeDa == 0) {
                    left = 0;
                    right = 18;
                }
                if (paramTypeDa == 1) {
                    left = 8;
                    right = 18;
                }
                if (paramTypeDa == 2) {
                    left = 0;
                    right = 8;
                }
            }

            if (paramType == 0) {
                if (paramTypeDa == 0) {
                    left = 0;
                    right = 24;
                }
                if (paramTypeDa == 1) {
                    left = 8;
                    right = 18;
                }
                if (paramTypeDa == 2) {
                    left = 0;
                    right = 8;
                }
            }
            int uid = 0;
//        如果name为空uid=0
//                否则通过模糊查询 查出姓名的id
            if (paramName.equals("")) {
                uid = 0;
            } else {
                uid = userService.getIdByName(paramName);
            }


//        getSignByFilter(@Param("year")int year,@Param("month")int month,@Param("day")int day,@Param("left")int left,@Param("right")int right,@Param("uid")int uid);
            signs = signService.getSignByFilter(paramY, paramM, paramD, left, right, uid);


            /*
             *     18 24
             *
             *       类型为下班
             *       查询 6点之后的所有信息
             *
             *       类型为上班
             *
             *       0-18
             *       类目为迟到 + 未迟到 查询 8点之前到 晚6之前
             *      8-18
             *       类目为迟到 查询8点之后到晚6之前
             *       0-8
             *       类目为未迟到 查询8点之前
             *
             *       类型为上下班
             *       类目为迟到加未迟到 0-24
             *
             *       迟到
             *       8-18
             *       未0-8
             *
             * */
        } else {

//        获取今天所有打卡情况
            Calendar calendar = Calendar.getInstance();
            int year = calendar.get(Calendar.YEAR);
            int month = calendar.get(Calendar.MONTH);
            int day = calendar.get(Calendar.DAY_OF_MONTH);
            month += 1;
            signs = signService.todayDaList(year, month, day);
        }
//        合并同一分钟内打卡的人数

        int len = signs.size();
        ArrayList<String> minList = new ArrayList<String>();
        ArrayList<Integer> countList = new ArrayList<Integer>();
        int index = 0;
        int minIndex = 0;


        for (int i = 0; i < len; i++) {
            Sign sign = signs.get(i);
            String time = sign.getTime();
//            2018-05-07 17:02:19

            time = time.substring(0, 16);

            String shortTime = time.substring(11, 16);


            if (i == 0) {
                countList.add(1);
                minList.add(shortTime);
                continue;
            }
            String nowTime = minList.get(minIndex);

            if (nowTime.equals(shortTime)) {
                int count = countList.get(index);
                count += 1;
                countList.set(index, count);
            } else {
                index += 1;
                minIndex += 1;
                countList.add(1);
                minList.add(shortTime);
            }
        }

        model.addAttribute("count", countList);
        model.addAttribute("min", minList);

        return "admin/attend/index";
    }

}
