<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/header.jsp" %>
<style>
    .right-detail .attendancebtn .time1, .right-detail .attendancebtn .time2 {
        width: 310px;
        height: 50px;
        background: #fbeeff;
        line-height: 50px;
        font-size: 18px;
        color: #666666;
        text-align: center;
        margin-left: 126px;
    }
    #sign_cal .on{
        color: #FFFFFF;
    }
</style>
<div class="right-detail">
    <div class="event">
        <h5>待处理事件</h5>
        <div class="left">

            <p><span>  <c:choose>
                <c:when test="${noDoCount==null}">
                    0
                </c:when>
                <c:otherwise>
                    ${noDoCount}
                </c:otherwise>
            </c:choose></span>条</p>
            <p>待审核事件</p>
        </div>
        <div class="line"></div>
        <div class="right">
            <p><span><c:choose>
                <c:when test="${noDoCount==null}">
                    0
                </c:when>
                <c:otherwise>
                    ${noDoCount}
                </c:otherwise>
            </c:choose></span>条</p>
            <p>待处理事件</p>
        </div>

    </div>
    <div class="attendance">
        <h5>我的出勤情况</h5>
        <ul>
            <li style="background: #5473c6;">
                <p><span  id="a">
                        <%--<c:choose>--%>
                            <%--<c:when test="${noClockCount==null}">--%>
                                <%--0--%>
                            <%--</c:when>--%>
                            <%--<c:otherwise>--%>
                                <%--${noClockCount}--%>
                            <%--</c:otherwise>--%>
                        <%--</c:choose>--%>

                </span>次</p>
                <p>未打卡</p>
            </li>
            <li style="background: #767dce;">
                <p><span>
                          <c:choose>
                              <c:when test="${laterCount==null}">
                                  0
                              </c:when>
                              <c:otherwise>
                                  ${laterCount}
                              </c:otherwise>
                          </c:choose>
                     </span>次</p>
                <p>迟到</p>
            </li>
            <li style="background: #bc96ed;">

                <p><span>
                             <c:choose>
                                 <c:when test="${leaveCount==null}">
                                     0
                                 </c:when>
                                 <c:otherwise>
                                     ${leaveCount}
                                 </c:otherwise>
                             </c:choose>
                      </span>次</p>
                <p>早退</p>
            </li>
            <li style="background: #eaa4fd;">

                <p><span> <c:choose>
                    <c:when test="${leaveCount==null}">
                        0
                    </c:when>
                    <c:otherwise>
                        ${signCount}
                    </c:otherwise>
                </c:choose></span>次</p>
                <p>外出</p>
            </li>
        </ul>

    </div>

    <div class="ka" style="margin-top: 30px;height: 330px;">
        <h5>签到打卡</h5>
        <div style="width:300px;height:300px;" id="calendar"></div>

    </div>

    <div class="attendancebtn qian" style="margin-top: 30px; height: 330px;">
        <button id="da" style="margin-top: 35px;margin-left: 205px;">签到打卡</button>
        <div class="num clearfloat">
            <p></p><span>2次</span>
            <p></p>
        </div>

        <c:forEach items="${requestScope.get('signList')}" var="item">
            <div class="detail">
                <div style="height: 24px;"></div>
                <div class="time1">${item.time}</div>
            </div>
        </c:forEach>


        <%--<div style="height: 24px;"></div>--%>
        <%--<div class="time1">上午暂未打卡</div>--%>
        <%--<div style="height: 12px;"></div>--%>
        <%--<div class="time2">下午暂未打卡</div>--%>
    </div>
</div>
</div>
<script type="text/javascript">
    $('#da').on('click', function () {
        if ($('.attendancebtn .detail').length > 1) {
            $("#da").attr("disabled", true);
            return;
        }

        $.get('${pageContext.request.contextPath}/admin/da', function (code) {
            if (code == 0) {
                alert('打卡失败,请稍后重试');
                return;
            } else if (code == 9) {
                alert('请在自己的电脑打卡');
                return;
            }

            var date = new Date();
            var year = date.getFullYear(); //获取当前年份
            var mon = date.getMonth() + 1; //获取当前月份
            var da = date.getDate(); //获取当前日+
            var day = date.getDay(); //获取当前星期几
            var h = date.getHours(); //获取小时
            var m = date.getMinutes(); //获取分钟
            var s = date.getSeconds(); //获取秒
            var d = document.getElementById('Date');

            var time = getNowTime();
            if ($('.attendancebtn .detail').length > 2) {
                $("#da").attr("disabled", true);
                return;
            }
            $('.attendancebtn').append("  <div class='detail'> <div style='height: 24px;'></div><div class='time1'>" + time + "</div></div>");

            // $('.time1').html('当前时间:' + year + '年' + mon + '月' + da + '日' + '星期' + day + ' ' + h + ':' + m + ':' + s);
            // }
            // if (code == 2) {
            //     $('.time2').html('当前时间:' + year + '年' + mon + '月' + da + '日' + '星期' + day + ' ' + h + ':' + m + ':' + s);
            // }


        });
    });


    function getNowTime(){
        var date = new Date();
        var year = date.getFullYear(); //获取当前年份
        var mon = date.getMonth() + 1; //获取当前月份
        var da = date.getDate(); //获取当前日+
        var day = date.getDay(); //获取当前星期几
        var h = date.getHours(); //获取小时
        var m = date.getMinutes(); //获取分钟
        var s = date.getSeconds(); //获取秒
        var d = document.getElementById('Date');
        var time = year + '-' + mon + '-' + da + '-' + ' ' + h + ':' + m + ':' + s;
        return time;

    }


    $(function () {
        var signList = [];
        // 通过ajax获取未打卡时间
        $.get("${pageContext.request.contextPath}/admin/daDetail", function (data) {

                var i = 0;
                for (var item in data) {
                    signList[i] = {"signDay": "" + data[item]};
                    i++;
                }
                var a = signList.length*2;
                $('#a').html(a);

            calUtil.init(signList);
        });
        //     //ajax获取日历json数据
        //     var signList = [{
        //         "signDay": "10",
        //
        //     }, {
        //         "signDay": "11"
        //     }, {
        //         "signDay": "12"
        //     }];

    });
</script>
<%@ include file="common/footer.jsp" %>