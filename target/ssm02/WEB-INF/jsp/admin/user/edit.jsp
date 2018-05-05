<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../common/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="right-detail row">

    <form:form action="${pageContext.request.contextPath}/user/update" method="post" id="form1" modelAttribute="qfuser">

        <input name="id" type="hidden" value="${user.id}"/>

        <div class="form-group">
            <label>账号</label>
                <%--<form:input path="title"  size="35"/>--%>
            <input value="${user.username}" name="username" type="text" class="form-control" placeholder="账号">
        </div>
        <div class="form-group">
            <label>密码</label>
            <input value="${user.password}" name="password" type="text" class="form-control" placeholder="密码">
        </div>
        <div class="form-group">
            <label>姓名</label>
            <input value="${user.name}" name="name" type="text" class="form-control" placeholder="姓名">
        </div>

        <div class="form-group">
            <label>学历</label>
            <input value="${user.edu}" name="edu" type="text" class="form-control" placeholder="学历">
        </div>

        <div class="checkbox">
            <label>性别</label>
            <label> <input type="radio" name="sex" value="1"  <c:choose>
            <c:when test="${user.sex==1}">
                           checked
            </c:when>
            </c:choose>  > 男</label>

            <label> <input type="radio" name="sex" value="0"<c:choose>
            <c:when test="${user.sex==0}">
                           checked
            </c:when>
            </c:choose>  > 女 </label>
        </div>

        <div class="form-group">
            <label>专业</label>
            <input value="${user.professional}" name="professional" type="text" class="form-control" placeholder="专业">
        </div>


        <div class="form-group">
            <label>年龄</label>
            <input value="${user.age}" name="age" type="text" class="form-control" placeholder="年龄">
        </div>


        <div class="form-group">
            <label>婚姻</label>
            <select name="marriage" class="form-control" style="width: 50%;">
                <option  <c:choose>
                    <c:when test="${user.sex==0}">
                        checked
                    </c:when>
                </c:choose>  value="0">未婚</option>
                <option value="1" <c:choose>
                    <c:when test="${user.sex==1}">
                        checked
                    </c:when>
                </c:choose> >已婚</option>
            </select>
        </div>

        <div class="form-group">
            <label>电话</label>
            <input  value="${user.tel}" name="tel" type="text" class="form-control" placeholder="电话">
        </div>
        <div class="form-group">
            <label>身份证号</label>
            <input value="${user.cardid}" name="cardid" type="text" class="form-control" placeholder="专业">
        </div>
        <h2>岗位信息</h2>
        <div class="form-group">
            <label for="exampleInputEmail1">部门</label>
            <select name="position_id" class="form-control" style="width: 50%;">
                <option
                        <c:choose>
                            <c:when test="${user.position_id==0}">
                                selected
                            </c:when>
                        </c:choose>
                        value="0">人事</option>
                <option value="1"
                        <c:choose>
                            <c:when test="${user.position_id==1}">
                                selected
                            </c:when>
                        </c:choose>>设计</option>
            </select>
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1">职位</label>
            <input value="${user.job}" name="job" type="text" class="form-control" id="" placeholder="专业">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1">入职时间</label>
            <input value="${user.intime}" name="intime" type="text" class="form-control" id="exampleInputEmail1" placeholder="入职时间">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1">状态</label>
            <select name="state" class="form-control" style="width: 50%;">
                <option   <c:choose>
                    <c:when test="${user.state==0}">
                        selected
                    </c:when>
                </c:choose>
                        value="0">实习</option>
                <option  <c:choose>
                    <c:when test="${user.state==1}">
                        selected
                    </c:when>
                </c:choose>  value="1">正式</option>
                <option
                        <c:choose>
                            <c:when test="${user.state==2}">
                                selected
                            </c:when>
                        </c:choose>
                        value="2">离职</option>
            </select>
        </div>


        <input type="submit" class="btn btn-success" value="提交">
        <input type="reset" class="btn btn-warning" value="重置">
    </form:form>
</div>
<%@ include file="../common/footer.jsp" %>