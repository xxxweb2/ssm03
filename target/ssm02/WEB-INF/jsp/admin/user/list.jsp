<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/header.jsp" %>

<div class="right-detail">
    <h3 style="float: left">员工信息</h3>
    <a href="${pageContext.request.contextPath}/user/add" style="float: right;margin-top: 25px;">添加</a>
    <table class="table table-striped table-hover">

        <tr>
            <th>ID</th>
            <th>姓名</th>
            <th>部门</th>
            <th>职位</th>
            <th>联系电话</th>
            <th>状态</th>
            <th>操作</th>
        </tr>

        <c:forEach items="${requestScope.get('userList')}" var="item">
            <tr id="tr${item.id}">
                <td>${item.id}</td>
                <td>${item.name}</td>
                <td>${item.position_id}</td>
                <td>${item.job}</td>
                <td>${item.tel}</td>
                <td>${item.state}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/user/edit?id=${item.id}" class="glyphicon glyphicon-ok"></a>
                    <a href="#" data-index="${item.id}" class="del glyphicon glyphicon-remove"></a>
                </td>
            </tr>
        </c:forEach>
        <%--<tr>--%>
        <%--<td>1</td>--%>
        <%--<td>王一丹</td>--%>
        <%--<td>技术部</td>--%>
        <%--<td>网页设计师</td>--%>
        <%--<td>13221296662</td>--%>
        <%--<td>实习</td>--%>
        <%--<td>--%>
        <%--<span class="glyphicon glyphicon-ok"></span>--%>
        <%--<span class="glyphicon glyphicon-remove"></span>--%>
        <%--</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
        <%--<td>1</td>--%>
        <%--<td>王一丹</td>--%>
        <%--<td>技术部</td>--%>
        <%--<td>网页设计师</td>--%>
        <%--<td>13221296662</td>--%>
        <%--<td>实习</td>--%>
        <%--<td>--%>
        <%--<span class="glyphicon glyphicon-ok"></span>--%>
        <%--<span class="glyphicon glyphicon-remove"></span>--%>
        <%--</td>--%>
        </tr>
    </table>

</div>
</div>

<script type="text/javascript">
    $('.del').on('click', function () {
        var id = $(this).attr('data-index');

        $.get('${pageContext.request.contextPath}/user/del?id=' + id, function (data) {
            if (data == 1) {
                alert('删除成功');
                $('#tr' + id).remove();
            } else {
                alert('删除失败，请稍后重试');
            }
        }, 'json');

    });
</script>


<%@ include file="../common/footer.jsp" %>