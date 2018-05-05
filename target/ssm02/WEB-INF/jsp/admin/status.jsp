<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/29 0029
  Time: 下午 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>

</head>
<body class="main">
<div class="subTit">
    <div class="tit">
        <a href="javascript:;">系统</a>&gt;<a href="javascript:;">系统设置</a>
    </div>
</div>
<div class="tableMod">
    <table>
        <thead>
        <tr>
            <th colspan="3">网站统计</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td align="center" width='10%'>文章发布</td>
            <td>已发布文章共{$total.article}个</td>
            <td width='30%'><a href="__GROUP__/Article" >查看详情</a></td>
        </tr>
        <tr>
            <td align="center">产品发布:</td>
            <td>已发布产品共{$total.goods}个</td>
            <td><a href="__GROUP__/Goods" >查看详情</a></td>
        </tr>
        <tr>
            <td align="center">招聘发布:</td>
            <td>已发布招聘信息共{$total.jobs}个</td>
            <td><a href="__GROUP__/Jobs" >查看详情</a></td>
        </tr>
        <tr>
            <td align="center">申请应聘:</td>
            <td>申请应聘信息共{$total.apply}个</td>
            <td><a href="__GROUP__/Apply" >查看详情</a></td>
        </tr>
        <tr>
            <td align="center">网络订单:</td>
            <td>网络订单共有{$total.order}个</td>
            <td><a href="__GROUP__/Order" >查看详情</a></td>
        </tr>
        <tr>
            <td align="center">网站留言:</td>
            <td>网站留言共{$total.message}个</td>
            <td><a href="__GROUP__/Message" >查看详情</a></td>
        </tr>
        </tbody>
    </table>
</div> <!-- /.tableMod -->
<if condition="$config.web_url neq ''">
    <div class="tableMod">
        <table>
            <thead>
            <tr>
                <th colspan="3">系统参数</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td  align="center" >二维码:</td>
                <td><img src="http://qr.liantu.com/api.php?text={$config.web_url}" width="150"></td>
            </tr>
            </tbody>
        </table>
    </div> <!-- /.tableMod -->
</if>
<div class="tableMod">
    <table>
        <thead>
        <tr>
            <th colspan="3">登陆日志</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td  align="center" >用户名</td>
            <td  align="center" >IP</td>
            <td  align="center" >时间</td>
        </tr>
       <c:forEach items="${requestScope.get('list')}" var="vo">
            <tr>
                <td align="center">${vo.user}</td>
                <td align="center">${vo.ip}</td>
                <td align="center">${vo.timeStr}</td>
            </tr>
       </c:forEach>
        </tbody>
    </table>
</div><!-- /.tableMod -->
</body>
</html>
