<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/header.jsp" %>

<div class="right-detail">
    <h3 style="float: left">员工信息</h3>

    <table class="table table-striped table-hover">

        <tr>
            <th>ID</th>
            <th>客户姓名</th>
            <th>客户手机号</th>
            <th>签约时间</th>
            <th>状态</th>
            <c:choose>
                <c:when test="${weight!=4}">
                    <th>操作</th>
                </c:when>
            </c:choose>
        </tr>

        <c:forEach items="${requestScope.get('list')}" var="item">
            <tr id="tr${item.id}">
                <td>${item.id}</td>
                <td>${item.name}</td>
                <td>${item.tel}</td>
                <td>${item.time}</td>
                <td><c:choose>
                    <c:when test="${item.state==0}">已提单</c:when>
                    <c:when test="${item.state==1}">接单</c:when>
                    <c:when test="${item.state==2}">完成</c:when>
                </c:choose>
                </td>
                <c:choose>
                    <c:when test="${weight!=4}">
                        <td>
                            <span data-index="${item.id}" data-state="1"
                                  class="rec glyphicon glyphicon-remove">接单</span>
                            <span data-index="${item.id}" data-state="2"
                                  class="rec glyphicon glyphicon-remove">完成</span>
                        </td>
                    </c:when>
                </c:choose>
            </tr>
        </c:forEach>
        </tr>
    </table>

</div>
</div>

<script type="text/javascript">
    $('.rec').on('click', function () {
        var id = $(this).attr('data-index');
        var state = $(this).attr('data-state');
        $.get('${pageContext.request.contextPath}/orders/rec?id=' + id + "&state=" + state, function (data) {
            if (data == 0) {
                alert('操作成功');
                window.location.reload();
            } else {
                alert('删除失败，请稍后重试');
            }
        }, 'json');
    });
</script>

<%@ include file="../common/footer.jsp" %>