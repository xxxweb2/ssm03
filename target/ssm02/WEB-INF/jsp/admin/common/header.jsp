<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>


    <%--柱状图--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sign.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/calendar.js"></script>


    <script type="text/javascript" src="${pageContext.request.contextPath}/js/highcharts.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/gray.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/schedule.js"></script>
</head>
<body>
<div class="header" style="min-width: 1200px;">
    <div class="w1200">
        <a style="float: left;margin-top: 15px" href="${pageContext.request.contextPath}/login/logout">退出登陆</a>
        <ul>
            <li id="myd"></li>
            <li id="xq"></li>
            <li id="hm"></li>
        </ul>
    </div>
</div>

<div class="main w1200 clearfloat">
    <div class="left-menu">
        <img class="top-img" src="${pageContext.request.contextPath}/images/top.jpg" alt=""/>
        <p class="name">
            <c:choose>
                <c:when test="${name==null}">
                    未命名
                </c:when>
                <c:otherwise>
                    ${name}
                </c:otherwise>
            </c:choose>
        </p>
        <p class="job">
            职务： <c:choose><c:when test="${job==null}">
            无
        </c:when>
            <c:otherwise>
                ${job}
            </c:otherwise>
        </c:choose>
        </p>

        <ul>
            <li>
                <a href="${pageContext.request.contextPath}/admin/index"><img
                        src="${pageContext.request.contextPath}/images/index.png">首页</a>
            </li>

            <c:choose>
                <c:when test="${weight==3}">
                    <li>
                        <a href="${pageContext.request.contextPath}/user/list"><img
                                src="${pageContext.request.contextPath}/images/da.png">员工信息</a>
                    </li>
                </c:when>
            </c:choose>
            <li>
                <a href="${pageContext.request.contextPath}/user/detail"><img
                        src="${pageContext.request.contextPath}/images/da.png">自己信息</a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/attend/index"><img
                        src="${pageContext.request.contextPath}/images/kq.png">员工考勤</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/out/index"><img
                        src="${pageContext.request.contextPath}/images/wc.png">外出登记</a>
            </li>

            <c:choose>
                <c:when test="${weight==2}">
                    <li>
                        <a href="${pageContext.request.contextPath}/orders/index"><img
                                src="${pageContext.request.contextPath}/images/da.png">订单管理</a>
                    </li>
                </c:when>
            </c:choose>

            <c:choose>
                <c:when test="${weight==1}">
                    <li>
                        <a href="${pageContext.request.contextPath}/orders/comm"><img
                                src="${pageContext.request.contextPath}/images/da.png">订单管理</a>
                    </li>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${weight==4}">
                    <li>
                        <a href="${pageContext.request.contextPath}/orders/comm"><img
                                src="${pageContext.request.contextPath}/images/da.png">订单管理</a>
                    </li>
                </c:when>
            </c:choose>

            <li>
                <a href="${pageContext.request.contextPath}/user/comm"><img
                        src="${pageContext.request.contextPath}/images/da.png">通讯录</a>
            </li>



        </ul>
    </div>
    <script type="text/javascript">
        var myDate = new Date();
        var year = myDate.getFullYear();
        var month = myDate.getMonth();
        var day = myDate.getDate();
        month += 1;
        $("#myd").html(year + "年" + month + "月" + day + "日");
        var xq = myDate.getDay();
        xq += 1;
        $("#xq").html("星期" + xq);
        var hour = myDate.getHours();
        var min = myDate.getMinutes();
        $("#hm").html(hour + ":" + min);
    </script>