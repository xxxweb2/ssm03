package com.xxxweb.web;

import com.xxxweb.entity.QfUser;
import com.xxxweb.service.SignService;
import com.xxxweb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;

@Controller
@RequestMapping(value = "user")
public class UserController {

    @Autowired
    SignService signService;

    @Autowired
    UserService userService;


    @RequestMapping(value = "/list")
    public String list(ModelMap model) {
//        获取所有员工信息
        ArrayList<QfUser> userList = userService.getUserList();
        model.addAttribute("userList", userList);
        return "admin/user/list";
    }

    @RequestMapping(value = "/add")
    public String add(ModelMap model) {
        model.addAttribute("qfuser", new QfUser());
        return "admin/user/add";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(QfUser qfUser) {
        System.out.println("age: " + qfUser);
        userService.saveUser(qfUser);
        return "redirect:list";
    }

    @RequestMapping(value = "/del", method = RequestMethod.GET)
    @ResponseBody
    public int del(@RequestParam int id) {
        int res = userService.delteUserById(id);
        if (res > 0) {
            return 1;
        } else {
            return 0;
        }
    }

    @RequestMapping(value = "/edit")
    public String edit(@RequestParam int id, ModelMap model) {
        QfUser user = userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("qfuser", new QfUser());
        return "admin/user/edit";
    }


    @RequestMapping(value = "/update")
    public String update(QfUser qfUser, ModelMap model) {

        userService.updateUser(qfUser);
        return "redirect:list";
    }
}
