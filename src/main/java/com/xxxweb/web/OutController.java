package com.xxxweb.web;

import com.xxxweb.entity.Out;
import com.xxxweb.entity.QfUser;
import com.xxxweb.service.OutService;
import com.xxxweb.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@Controller
@RequestMapping(value = "out")
public class OutController {
    @Autowired
    OutService outService;
    @Autowired
    UserService userService;

    @RequestMapping(value = "index")
    public String index(ModelMap model, HttpSession session) {
        model.addAttribute("out", null);

//        如果用户权重为1只能查看自己的外出登记
//        如果用户的权重为2能查看权重《=2的外出登记

        QfUser user = (QfUser) session.getAttribute("user");

        int weight = user.getWeight();
        ArrayList<Out> outList;
        if (weight == 1) {
//            权重是1代表普通员工 只能查看自己的外出登记

            outList = outService.getMinmeOutList(user.getId());
        } else {
            weight++;
            outList = outService.getAllOutListByWeight(weight);
        }
//        获取所有外出记录
//        ArrayList<Out> outList = outService.getOutList();


        int len = outList.size();
        for (int i = 0; i < len; i++) {
            Out item = outList.get(i);
            QfUser userById = userService.getUserById(item.getUid());
            item.setName(userById.getName());
        }
        model.addAttribute("list", outList);

        int id = user.getId();
        int positionId = user.getPositionid();

        weight--;
        model.addAttribute("weight", weight);

        return "admin/out/index";
    }


    //    保存外出登记记录 权重为1 是员工的外出登记 权重为2是部门经理的外出登记 权重为3是认识 权重是4为总经理
    @RequestMapping(value = "save")
    public String save(ModelMap model, Out out, HttpSession session) {
        model.addAttribute("out", null);
        QfUser user = (QfUser) session.getAttribute("user");
        int id = user.getId();

//        获取权重
        int weight = user.getWeight();

        out.setUid(id);
        out.setWeight(weight);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        out.setComtime(df.format(new Date()));
        outService.saveOut(out);
        return "redirect:index";
    }

    @RequestMapping(value = "del")
    @ResponseBody
    public int del(@Param("id") int id) {
        outService.delOutById(id);
        return 0;
    }


    //    人事签字
    @RequestMapping(value = "sign")
    @ResponseBody
    public int sign(@Param("id") int id) {
        outService.updateJlqz(id);
        return 0;
    }

    @RequestMapping(value = "pback")
    @ResponseBody
    public int pback(@Param("id") int id) {
        System.out.println("id: " + id);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = df.format(new Date());
        System.out.println("time: " + time);
        outService.updateBack(id, time);
        return 0;
    }


}
