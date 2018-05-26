package com.xxxweb.service.impl;

import com.xxxweb.dao.OrdersDao;
import com.xxxweb.entity.Orders;
import com.xxxweb.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class OrdersServiceImpl implements OrdersService {
    @Autowired
    private OrdersDao ordersDao;

    public ArrayList<Orders> getAllOrders() {
        return ordersDao.getAllOrders();
    }

    public Orders getOrdersById(int id) {
        return ordersDao.getOrdersById(id);
    }

    public int saveOrders(Orders orders) {
        return ordersDao.saveOrders(orders);
    }

    public int saveOrders2(Orders orders) {
        return ordersDao.saveOrders2(orders);
    }

    public int delOrdersById(int id) {
        return ordersDao.delOrdersById(id);
    }

    public ArrayList<Orders> getAllOrderByUid(int uid) {
        return ordersDao.getAllOrderByUid(uid);
    }

    public int updateOrderState(int id, int state) {
        return ordersDao.updateOrderState(id, state);
    }

}
