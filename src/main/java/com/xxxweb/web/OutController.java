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
//        获取所有外出记录
        ArrayList<Out> outList = outService.getOutList();

        int len = outList.size();
        for (int i = 0; i < len; i++) {
            Out item = outList.get(i);
            QfUser userById = userService.getUserById(item.getUid());
            item.setName(userById.getName());
        }
        model.addAttribute("list", outList);


        QfUser user = (QfUser) session.getAttribute("user");
        int id = user.getId();
        int positionId = user.getPosition_id();
        if (positionId == 0) {
//            人事
            model.addAttribute("isRen", 1);
        } else {
//            其他员工
            model.addAttribute("isRen", 0);
        }
        return "admin/out/index";
    }

    @RequestMapping(value = "save")
    public String save(ModelMap model, Out out, HttpSession session) {
        model.addAttribute("out", null);
        QfUser user = (QfUser) session.getAttribute("user");
        int id = user.getId();
        out.setUid(id);
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
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = df.format(new Date());
        outService.updateBack(id, time);
        return 0;
    }
}
