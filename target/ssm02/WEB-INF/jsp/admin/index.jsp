<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/header.jsp" %>
<style>
    .right-detail .attendance .time1, .right-detail .attendance .time2 {
        width: 310px;
        height: 50px;
        background: #fbeeff;
        line-height: 50px;
        font-size: 18px;
        color: #666666;
        text-align: center;
        margin-left: 126px;
    }
</style>
<div class="right-detail">
    <div class="event">
        <h5>待处理事件</h5>
        <div class="left">
            <p><span>8</span>条</p>
            <p>待审核事件</p>
        </div>
        <div class="line"></div>
        <div class="right">
            <p><span>8</span>条</p>
            <p>待处理事件</p>
        </div>

    </div>
    <div class="attendance">
        <h5>我的出勤情况</h5>
        <ul>
            <li style="background: #5473c6;">
                <p><span>
                        <c:choose>
                            <c:when test="${noClockCount==null}">
                                0
                            </c:when>
                            <c:otherwise>
                                ${noClockCount}
                            </c:otherwise>
                        </c:choose></span>次</p>
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
                <p><span>10</span>次</p>
                <p>外出</p>
            </li>
        </ul>

    </div>

    <div class="ka" style="margin-top: 30px;height: 330px;">
        <h5>签到打卡</h5>
        <div style="width:300px;height:300px;" id="calendar"></div>

    </div>

    <div class="attendance qian" style="margin-top: 30px; height: 330px;">
        <a href="#" id="da" style="margin-top: 35px;">签到打卡</a>
        <div class="num clearfloat">
            <p></p><span>2次</span>
            <p></p>
        </div>

        <c:forEach items="${requestScope.get('signList')}" var="item">
            <div>
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
        $.get('${pageContext.request.contextPath}/admin/da', function (code) {
            if (code == 0) {
                alert('打卡失败,请稍后重试');
                return;
            }

            var date = new Date();
            var year = date.getFullYear(); //获取当前年份
            var mon = date.getMonth() + 1; //获取当前月份
            var da = date.getDate(); //获取当前日
            var day = date.getDay(); //获取当前星期几
            var h = date.getHours(); //获取小时
            var m = date.getMinutes(); //获取分钟
            var s = date.getSeconds(); //获取秒
            var d = document.getElementById('Date');

            var time = year + '年' + mon + '月' + da + '日' + ' ' + h + ':' + m + ':' + s;
            $('.attendance').append("  <div> <div style='height: 24px;'></div><div class='time1'>" + time + "</div></div>");

            // $('.time1').html('当前时间:' + year + '年' + mon + '月' + da + '日' + '星期' + day + ' ' + h + ':' + m + ':' + s);
            // }
            // if (code == 2) {
            //     $('.time2').html('当前时间:' + year + '年' + mon + '月' + da + '日' + '星期' + day + ' ' + h + ':' + m + ':' + s);
            // }
        });
    });

</script>
<%@ include file="common/footer.jsp" %>