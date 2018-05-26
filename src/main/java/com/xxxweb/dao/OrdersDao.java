package com.xxxweb.dao;

import com.xxxweb.entity.Orders;
import com.xxxweb.entity.QfUser;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface OrdersDao {
    ArrayList<Orders> getAllOrders();

    Orders getOrdersById(int id);

    int saveOrders(Orders orders);

    int saveOrders2(Orders orders);

    int delOrdersById(int id);
    ArrayList<QfUser> getAllUserByWeight(int weight);
   ArrayList<Orders> getAllOrderByUid(int uid);
   int updateOrderState(@Param("id")int id,@Param("state")int state);
}
