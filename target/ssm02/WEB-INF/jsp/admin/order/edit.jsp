<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../common/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="right-detail row">

    <form:form action="${pageContext.request.contextPath}/orders/update" method="post" id="form1" modelAttribute="qfuser">
        <input name="id" type="hidden" value="${order.id}"/>
        <div class="form-group">
            <label>客户姓名</label>
                <%--<form:input path="title"  size="35"/>--%>
            <input value="${order.name}" name="name" type="text" class="form-control" placeholder="客户姓名">
        </div>
        <div class="form-group">
            <label>手机号</label>
            <input value="${order.tel}" name="tel" type="text" class="form-control" placeholder="手机号">
        </div>
        <div class="form-group">
            <label>签约时间</label>
            <input value="${order.time}" name="time" type="text" class="form-control" placeholder="签约时间">
        </div>

        <div class="form-group">
            <label>状态</label>
            <select name="state" class="form-control" style="width: 50%;">
                <option value="0"  <c:choose><c:when test="${order.state==0}">selected</c:when></c:choose>>已提单</option>
                <option value="1"  <c:choose><c:when test="${order.state==1}">selected</c:when></c:choose>>接单</option>
                <option value="2"  <c:choose><c:when test="${order.state==2}">selected</c:when></c:choose>>完成</option>
            </select>
        </div>

        <div class="form-group">
            <label>接受订单的员工</label>
            <select name="uid" class="form-control" style="width: 50%;">
                <c:forEach items="${requestScope.get('users')}" var="item">
                    <option  <c:choose><c:when test="${order.uid==item.id}">selected</c:when></c:choose>   value="${item.id}">${item.name}</option>
                </c:forEach>

            </select>
        </div>


        <input type="submit" class="btn btn-success" value="提交">
        <input type="reset" class="btn btn-warning" value="重置">
    </form:form>
</div>
<%@ include file="../common/footer.jsp" %>