<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../common/header.jsp" %>
<style>
    header a, a:visited {
        color: #FFFFFF !important;
    }

    #schedule-box {
        width: 320px;
        margin: 0 auto;
        padding: 35px 20px;
        font-size: 13px;
    }

    .schedule-hd {
        display: flex;
        justify-content: space-between;
        padding: 0 15px;
    }

    .today {
        flex: 1;
        text-align: center;
    }

    .ul-box {
        overflow: hidden;
    }

    .ul-box > li {
        float: left;
        width: 14.28%;
        text-align: center;
        padding: 5px 0;
    }

    .other-month {
        color: #999999;
    }

    .current-month {
        color: #333333;
    }

    .today-style {
        border-radius: 50%;
        background: #58d321;
    }

    .arrow {
        cursor: pointer;
    }

    .dayStyle {
        display: inline-block;
        width: 35px;
        height: 35px;
        border-radius: 50%;
        text-align: center;
        line-height: 35px;
        cursor: pointer;
    }

    .current-month > .dayStyle:hover {
        background: #00BDFF;
        color: #ffffff;
    }

    .today-flag {
        background: #00C2B1;
        color: #fff;
    }

    .boxshaw {
        box-shadow: 2px 2px 15px 2px #e3e3e3;
        display: none;
    }

    .selected-style {
        background: #00BDFF;
        color: #ffffff;
    }

    #h3Ele {
        text-align: center;
        padding: 10px;
    }
</style>
<div class="right-detail">
    <h4 style="text-align: center">外出登记</h4>

    <form:form action="${pageContext.request.contextPath}/out/save" method="post" id="form1" modelAttribute="out">
        <div class="form-group">
            <label>被访人</label>
                <%--<form:input path="title"  size="35"/>--%>
            <input value="" name="bfr" type="text" class="form-control" placeholder="被访人">
        </div>
        <div class="form-group">
            <label>被访人电话</label>
                <%--<form:input path="title"  size="35"/>--%>
            <input value="" name="btel" type="number" class="form-control" placeholder="被访人电话">
        </div>
        <div class="form-group">
            <label>外出地址</label>
                <%--<form:input path="title"  size="35"/>--%>
            <input value="" name="addr" type="text" class="form-control" placeholder="外出地址">
        </div>

        <div class="form-group">
            <label>外出日期</label>
                <%--<form:input path="title"  size="35"/>--%>
            <input value="" name="wtime" type="text" class="form-control" placeholder="外出日期">
        </div>

        <div class="form-group">
            <label>外出原因</label>
                <%--<form:input path="title"  size="35"/>--%>
            <input value="" name="wrea" type="text" class="form-control" placeholder="外出原因">
        </div>

        <input type="submit" value="提交" class="btn btn-success">
        <input type="reset" value="重置" class="btn btn-submit">
    </form:form>

    <table class="table table-hover">

        <tr>
            <%--<th>提交时间</th>--%>
            <th>申请人</th>
            <th>被访人</th>
            <th>外出地址</th>
            <th>被访人电话</th>
            <th>外出时间</th>
            <th>外出原因</th>
            <th>经理签字</th>
            <th>返回时间</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${requestScope.get('list')}" var="item">
            <tr id="tr${item.id}">
                <%--<td>${item.comtime}</td>--%>
                <td>${item.name}</td>
                <td>${item.bfr}</td>
                <td>${item.addr}</td>
                <td>${item.btel}</td>
                <td>${item.wtime}</td>
                <td>${item.wrea}</td>
                <td class="jl${item.id}">${item.jlqz}</td>
                <td class="f${item.id}">${item.ftime}</td>
                <td>
<%--uid--%>

    <c:choose>


    <c:when test="${item.uid==userid}">
                    <span class="glyphicon glyphicon-pushpin back" data-index="${item.id}"></span>
    </c:when>
    </c:choose>
                    <c:choose>
                        <c:when test="${weight>1}">
                    <span class="glyphicon glyphicon-ok deal" data-index="${item.id}"></span>

                        </c:when>

                    </c:choose>
                    <span href="#" data-index="${item.id}" class="del glyphicon glyphicon-remove"></span>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<script type="text/javascript">
    /**
     *
     * Active Charts using Highcharts demonstration
     *
     * Licensed under the MIT license.
     * http://www.opensource.org/licenses/mit-license.php
     *
     * Copyright 2012, Script Tutorials
     * http://www.script-tutorials.com/
     */

// Change Chart type function


    var myDate = new Date();
    var year = myDate.getFullYear();
    var month = myDate.getMonth();
    var day = myDate.getDate();
    month += 1;

    var nowTimeVal = $("#nowTime").val();
    if (nowTimeVal == "") {
        $("#nowTime").val(year + "-" + month + "-" + day);
    }
    //
    $('.del').on('click', function () {
        var id = $(this).attr('data-index');

        $.get('${pageContext.request.contextPath}/out/del?id=' + id, function (data) {
            alert('删除成功');
            $("#tr" + id).remove();
        });
    });

    // 回来时间
    // back

    $('.back').on('click', function () {
        var id = $(this).attr('data-index');
        $.get('${pageContext.request.contextPath}/out/pback?id='+id, function () {
            alert('操作成功');
            var myDate = new Date();
            var year = myDate.getFullYear();
            var month = myDate.getMonth();
            var day = myDate.getDate();
            month += 1;

            var h = myDate.getHours();
            var m = myDate.getMinutes();
            var s = myDate.getSeconds();
            $(".f" + id).html(year + "-" + month + "-" + day + " " + h + ":" + m + ":" + s);
        });
    });



    $('.deal').on('click', function () {
        var id = $(this).attr('data-index');
        $.get('${pageContext.request.contextPath}/out/sign?id='+id, function () {
            alert('操作成功');
            $(".jl" + id).html("已签字");
        });
    });
    // 经理签字
    // deal

    <%--$('.sign').on('click', function () {--%>
        <%--var id = $(this).attr('data-index');--%>
        <%--$.get('${pageContext.request.contextPath}/out/<c:choose><c:when test="${isRen!=1}">sign</c:when><c:otherwise>pback</c:otherwise></c:choose>?id=' + id, function (data) {--%>
            <%--alert('操作成功');--%>
            <%--var where = ${weight};--%>

            <%--var myDate = new Date();--%>
            <%--var year = myDate.getFullYear();--%>
            <%--var month = myDate.getMonth();--%>
            <%--var day = myDate.getDate();--%>
            <%--month += 1;--%>

            <%--var h = myDate.getHours();--%>
            <%--var m = myDate.getMinutes();--%>
            <%--var s = myDate.getSeconds();--%>


            <%--if (where == 1) {--%>
                <%--$(".jl" + id).html("已签字");--%>
            <%--} else {--%>
                <%--$(".f" + id).html(year + "-" + month + "-" + day + " " + h + ":" + m + ":" + s);--%>
            <%--}--%>
        <%--});--%>
    <%--});--%>
</script>

<%@ include file="../common/footer.jsp" %>