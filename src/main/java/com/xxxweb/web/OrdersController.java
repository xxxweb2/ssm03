package com.xxxweb.web;

import com.xxxweb.entity.Orders;
import com.xxxweb.entity.QfUser;
import com.xxxweb.service.OrdersService;
import com.xxxweb.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
@RequestMapping(value = "orders")
public class OrdersController {
    @Autowired
    OrdersService ordersService;
    @Autowired
    UserService userService;

    @RequestMapping(value = "/index")
    public String list(ModelMap model) {
        ArrayList<Orders> allOrders = ordersService.getAllOrders();
        model.addAttribute("list", allOrders);
        return "admin/order/list";
    }

    @RequestMapping(value = "/edit")
    public String edit(ModelMap model, @RequestParam(value = "id") int id) {
        Orders order = ordersService.getOrdersById(id);
        model.addAttribute("order", order);
        model.addAttribute("qfuser", null);

        ArrayList<QfUser> allUserByWeight = userService.getAllUserByWeight(1);
        model.addAttribute("users", allUserByWeight);

        return "admin/order/edit";
    }

    @RequestMapping(value = "/update")
    public String update(Orders orders) {
        ordersService.saveOrders(orders);
        return "redirect:index";
    }

    @RequestMapping(value = "/add")
    public String add(ModelMap model) {
        model.addAttribute("qfuser", null);

//        获取所有员工
        ArrayList<QfUser> allUserByWeight = userService.getAllUserByWeight(1);
        model.addAttribute("users", allUserByWeight);
        return "admin/order/add";
    }

    @RequestMapping(value = "/save")
    public String save(Orders orders) {
        ordersService.saveOrders2(orders);
        return "redirect:index";
    }

    //    comm
    @RequestMapping(value = "comm")
    public String comm(ModelMap model, HttpSession session) {
        QfUser user = (QfUser) session.getAttribute("user");
        int weight = user.getWeight();
        int id = user.getId();


        if (weight == 1) {
//        普通员工
            ArrayList<Orders> allOrderByUid = ordersService.getAllOrderByUid(id);
            model.addAttribute("list", allOrderByUid);
        } else {
//        总经理
            ArrayList<Orders> allOrders = ordersService.getAllOrders();
            model.addAttribute("list", allOrders);
        }

        return "/admin/order/comm";
    }


    @ResponseBody
    @RequestMapping(value = "/del")
    public int del(@Param(value = "id") int id) {
        int res = ordersService.delOrdersById(id);
        if (res != 0) {
            return 0;
        } else {
            return 1;
        }
    }

    @ResponseBody
    @RequestMapping(value = "/rec")
    public int rec(@Param(value = "id") int id, @Param(value = "state") int state) {
        int res = ordersService.updateOrderState(id, state);
        if (res != 0) {
            return 0;
        } else {
            return 1;
        }
    }
}
