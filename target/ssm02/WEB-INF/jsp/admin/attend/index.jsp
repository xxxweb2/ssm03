<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/header.jsp" %>
<style>
    tr, td, th {
        text-align: center;
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
    <h3>打卡记录</h3>
    <form class="form-inline" action="${pageContext.request.contextPath}/attend/index" method="post">
        <div class="form-group" style="position: relative;">
            <label>时间:</label>
            <input class="form-control time" type="text" name="time"
                   value="<c:choose><c:when test="${indexTime!=null}">${indexTime}</c:when></c:choose>" id="nowTime">
            <div id='schedule-box' class="boxshaw" style=" position: absolute;z-index: 9;background: #ffffff">
            </div>
        </div>
        <div class="form-group">
            <label>类目:</label>
            <select name="typeDa" class="form-control">
                <option value="0"
                        <c:choose>
                            <c:when test="${indexTypeDa==0}">selected</c:when>
                        </c:choose> >所有(迟到+未迟到)
                </option>
                <option value="1"
                        <c:choose>
                            <c:when test="${indexTypeDa==1}">selected</c:when>
                        </c:choose>>迟到
                </option>
                <option value="2"
                        <c:choose>
                            <c:when test="${indexTypeDa==2}">selected</c:when>
                        </c:choose>>未迟到
                </option>

            </select>
        </div>
        <div class="form-group">
            <label>类型:</label>
            <select name="type" class="form-control">
                <option value="0"
                        <c:choose>
                            <c:when test="${indexType==0}">selected</c:when>
                        </c:choose>>所有(上班+下班)
                </option>
                <option value="1"
                        <c:choose>
                            <c:when test="${indexType==1}">selected</c:when>
                        </c:choose>>上班
                </option>
                <option value="2"
                        <c:choose>
                            <c:when test="${indexType==2}">selected</c:when>
                        </c:choose>>下班
                </option>
            </select>
        </div>
        <%--<div class="form-group">--%>
        <%--<label>部门:</label>--%>
        <%--<select name="department" class="form-control">--%>
        <%--<option value="0">所有</option>--%>
        <%--</select>--%>
        <%--</div>--%>
        <div class="form-group" style="width: 80px;">
            <label>姓名:</label>
            <input class="form-control" type="text" name="name" placeholder="姓名"
                   value="<c:choose><c:when test="${indexName!=null}">${indexName}</c:when></c:choose>">
        </div>
        <input type="submit" value="搜索" class="btn btn-success" style="margin-top: 24px;">
    </form>
    <h3><c:choose><c:when test="${indexTime!=null}">${indexTime}</c:when></c:choose> 全天签到打卡延迟分析</h3>


    <div id="chart_1" class="chart"></div>


    <table class="table table-striped">
        <tr>
            <th>部门</th>
            <th>姓名</th>
            <th>时间</th>
            <th>状态</th>
        </tr>


        <c:forEach items="${requestScope.get('sign')}" var="item">
            <tr  style="<c:choose>
                <c:when test="${item.state==2}">color: #ff0000;</c:when>

            </c:choose>
            ">
                <td>${item.posName}</td>
                <td>${item.name}</td>
                <td>${item.time}</td>
                <td>
                    <c:choose>
                        <c:when test="${item.state==0}">上班正常打卡</c:when>
                        <c:when test="${item.state==2}">迟到</c:when>
                        <c:when test="${item.state==3}">早退</c:when>
                        <c:when test="${item.state==4}">下班正常打卡</c:when>
                    </c:choose>
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
    function ChangeChartType(chart, series, newType) {
        newType = newType.toLowerCase();
        for (var i = 0; i < series.length; i++) {
            var srs = series[0];
            try {
                srs.chart.addSeries({
                        type: newType,
                        stack: srs.stack,
                        yaxis: srs.yaxis,
                        name: srs.name,
                        color: srs.color,
                        data: srs.options.data
                    },
                    false);
                series[0].remove();
            } catch (e) {
            }
        }
    }

    // Two charts definition
    var chart1, chart2;

    // Once DOM (document) is finished loading
    $(document).ready(function () {

        // First chart initialization
        chart1 = new Highcharts.Chart({
            chart: {
                renderTo: 'chart_1',
                type: 'column',
                height: 350,
            },
            title: {
                text: '全天签到打卡延迟分析'
            },
            xAxis: {
                categories: [
                    <c:forEach items="${requestScope.get('min')}" var="m">
                    '${m}',
                    </c:forEach>
                ]
            },
            yAxis: {
                title: {
                    text: 'Interviewed'
                }
            },
            series: [{
                name: 'Dev #1',

                data: [
                    <c:forEach items="${requestScope.get('count')}" var="item">
                    ${item},
                    </c:forEach>

                ]
            }],
            //     {
            //    name: 'Dev #2',
            //    data: [15, 15, 18, 40, 30, 25, 60, 60, 80, 70]
            // }, {
            //    name: 'Dev #3',
            //    data: [1, 3, 6, 0, 50, 25, 50, 60, 30, 100]
            // }]
        });

        // Second chart initialization (pie chart)
        chart2 = new Highcharts.Chart({
            chart: {
                renderTo: 'chart_2',
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                height: 350,
            },
            title: {
                text: '全天签到打卡延迟分析'
            },
            tooltip: {
                pointFormat: '<b>{point.percentage}%</b>',
                percentageDecimals: 1
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            series: [{
                type: 'pie',
                name: 'Dev #1',
                data: [
                    ['Processing.js', 5],
                    ['Impact.js', 10],
                    ['Other', 20],
                    ['Ease.js', 22],
                    ['Box2D.js', 25],
                    ['WebGL', 28],
                    ['DOM', 30],
                    ['CSS', 40],
                    ['Canvas', 80],
                    ['Javascript', 90]
                ]
            }]
        });

        // Switchers (of the Chart1 type) - onclick handler
        $('.switcher').click(function () {
            var newType = $(this).attr('id');
            ChangeChartType(chart1, chart1.series, newType);
        });
    });


    var mySchedule = new Schedule({
        el: '#schedule-box',
        //date: '2018-9-20',
        clickCb: function (y, m, d) {
            $('.time').val(y + '-' + m + '-' + d);
        },
        nextMonthCb: function (y, m, d) {
            $('.time').val(y + '-' + m + '-' + d);
        },
        nextYeayCb: function (y, m, d) {
            $('.time').val(y + '-' + m + '-' + d);
        },
        prevMonthCb: function (y, m, d) {
            $('.time').val(y + '-' + m + '-' + d);
        },
        prevYearCb: function (y, m, d) {
            $('.time').val(y + '-' + m + '-' + d);
        }
    });


    // $(".time").on('focus', function (e) {
    //     $(".boxshaw").css("display", "block");
    //     console.log("66");
    //     stopPropagation(e);
    //     return false;
    // });

    $("body").on('click', function () {
        $(".boxshaw").css("display", "none");
    });
    $(".time").on("click", function (e) {
        $(".boxshaw").css("display", "block");
        console.log("66");
        stopPropagation(e);
        return false;
        stopPropagation(e);
    })

    function stopPropagation(e) {
        var ev = e || window.event;
        if (ev.stopPropagation) {
            ev.stopPropagation();
        }
        else if (window.event) {
            window.event.cancelBubble = true;//兼容IE
        }
    }

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
</script>

<%@ include file="../common/footer.jsp" %>