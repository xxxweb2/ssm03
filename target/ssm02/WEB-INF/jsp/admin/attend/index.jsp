<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/header.jsp" %>

<div class="right-detail">
    <h3>打卡记录</h3>
    <form class="form-inline" action="${pageContext.request.contextPath}/attend/index" method="post">
        <div class="form-group">
            <label>时间:</label>
            <input class="form-control" type="text" name="time" value="2018-05-07">
        </div>
        <div class="form-group">
            <label>类目:</label>
            <select name="typeDa" class="form-control">
                <option value="0">所有(上班+下班)</option>
                <option value="1">迟到</option>
                <option value="2">未迟到</option>
            </select>
        </div>
        <div class="form-group">
            <label>类型:</label>
            <select name="type" class="form-control">
                <option value="0">所有(上班+下班)</option>
                <option value="1">上班</option>
                <option value="2">下班</option>
            </select>
        </div>
        <div class="form-group">
            <label>部门:</label>
            <select name="department" class="form-control">
                <option value="0">所有</option>
            </select>
        </div>
        <div class="form-group" style="width: 80px;">
            <label>姓名:</label>
            <input class="form-control" type="text" name="name" placeholder="姓名">
        </div>
        <input type="submit" value="搜索" class="btn btn-success" style="margin-top: 24px;">
    </form>
    <h3>2018-02-05 全天签到打卡延迟分析</h3>
    <div id="chart_1" class="chart"></div>
</div>
<%@ include file="../common/footer.jsp" %>