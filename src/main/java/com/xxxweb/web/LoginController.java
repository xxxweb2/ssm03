package com.xxxweb.web;

import com.xxxweb.entity.QfUser;
import com.xxxweb.service.LoginService;
import com.xxxweb.service.UserService;
import com.xxxweb.utils.EmaielUtils;
import com.xxxweb.utils.RandomValidateCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/login")
public class LoginController {

    @Autowired
    LoginService loginService;
    // 随机产生的图片
    @Resource
    RandomValidateCode randomValidateCode;
    @Autowired
    UserService userService;


//    发送邮件

    @Resource
    EmaielUtils emaielUtils;

    @RequestMapping(value = "/index")
    public String index() {
        return "admin/login";
    }

//    @RequestMapping("/pcode")
//    public void pcode(HttpServletRequest request, HttpServletResponse response) {
//        randomValidateCode.getRandcode(request, response);
//    }

    @RequestMapping(value = "/check", method = RequestMethod.POST)
//
    public String check(

            @RequestParam(value = "username") String username,
            @RequestParam(value = "password") String password,
            HttpServletRequest request,
            ModelMap model,
            HttpSession session) {
        QfUser user = new QfUser();
        user.setId(1);
        user.setUsername("admin");
        user.setIntime("2018-05-01 22:13:15");
        session.setAttribute("user", user);
            return "redirect:/admin/index";

//
//        //判断密码是否正确
//        String pwd = loginService.getPassword(username);
//        if (pwd.equals(password)) {
////            登陆成功
//            session.setAttribute("name", username);
//            model.addAttribute("username", username);
//
////            跳转到邮件验证码界面
//
//            return "redirect:email";
////            return "admin/index";
//        } else {
//            model.addAttribute("error", "账号或者密码错误");
//            return "admin/login";
//        }

    }

    //    @RequestParam(value = "username") String username,
    @RequestMapping(value = "/email", method = RequestMethod.GET)
    public String email(HttpSession session) {
//        发送验证码 并且存入session中 用于验证时用

        try {
//            "13221296662@163.com", "系统登陆验证码", "验证码为: 1234"
            int code = (int) (Math.random() * 10);
            code = code * 10 + (int) (Math.random() * 10);
            code = code * 10 + (int) (Math.random() * 10);
            code = code * 10 + (int) (Math.random() * 10);
            session.setAttribute("email", code);
            emaielUtils.sendEmail2("1070529431@qq.com", "系统登陆验证码", "验证码为: " + code);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "admin/email";
    }

    @RequestMapping(value = "/checkEmail", method = RequestMethod.POST)
    public String checkEmail(@RequestParam(value = "email") String email, ModelMap model, HttpServletRequest request, HttpSession session) {
        String realEmail = ""+session.getAttribute("email");
        System.out.println("email: " + email);
        System.out.println("realemail: " + realEmail);
        if (realEmail.equals(email)) {
            System.out.println("true");
            String username = (String) session.getAttribute("name");

            QfUser userByName = userService.getUserByName(username);
            session.setAttribute("user", userByName);

            return "redirect:/admin/index";
        }
        System.out.println("false");
        model.addAttribute("error", "邮箱验证码错误");

        return "redirect:email";
    }

    //    安全退出
    @RequestMapping(value = "/logout")
    public String logOut(HttpSession session) {
        session.setAttribute("username", null);
        return "redirect:index";
    }
}
