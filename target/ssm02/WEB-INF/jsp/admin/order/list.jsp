<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/header.jsp" %>

<div class="right-detail">
    <h3 style="float: left">员工信息</h3>
    <a href="${pageContext.request.contextPath}/orders/add" style="color: #000000; float: right;margin-top: 25px;">添加</a>
    <table class="table table-striped table-hover">

        <tr>
            <th>ID</th>
            <th>客户姓名</th>
            <th>客户手机号</th>
            <th>签约时间</th>
            <th>状态</th>
            <th>操作</th>
        </tr>

        <c:forEach items="${requestScope.get('list')}" var="item">
            <tr id="tr${item.id}">
                <td>${item.id}</td>
                <td>${item.name}</td>
                <td>${item.tel}</td>
                <td>${item.time}</td>
                <td>${item.state}</td>
                <td>
                    <a style="color: blue;" href="${pageContext.request.contextPath}/orders/edit?id=${item.id}"
                       class="glyphicon glyphicon-ok"></a>
                    <span href="#" data-index="${item.id}" class="del glyphicon glyphicon-remove"></span>
                </td>
            </tr>
        </c:forEach>

        </tr>
    </table>

</div>
</div>

<script type="text/javascript">
    $('.del').on('click', function () {
        var id = $(this).attr('data-index');

        $.get('${pageContext.request.contextPath}/orders/del?id=' + id, function (data) {
            if (data == 0) {
                alert('删除成功');
                $('#tr' + id).remove();
            } else {
                alert('删除失败，请稍后重试');
            }
        }, 'json');
    });
</script>

<%@ include file="../common/footer.jsp" %>