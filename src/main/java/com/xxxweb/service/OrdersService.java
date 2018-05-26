package com.xxxweb.service;

import com.xxxweb.entity.Orders;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface OrdersService {
   ArrayList<Orders> getAllOrders();
   Orders getOrdersById(int id);
   int saveOrders(Orders orders);
   int saveOrders2(Orders orders);
   int delOrdersById(int id);
   ArrayList<Orders> getAllOrderByUid(int uid);
   int updateOrderState(@Param("id")int id, @Param("state")int state);
}
