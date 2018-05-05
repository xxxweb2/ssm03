<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/6 0006
  Time: 下午 5:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js"></script>

<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>

<style type="text/css">
    .clear {
        clear: both;
    }
</style>
<style type="text/css">
    #content {
        width: 60%;
        min-height: 300px;
    }
</style>
<script type="text/javascript">
    $(function () {
        var ue = UE.getEditor('content');
        $("#form1").submit(function () {
            var content = ue.getContent();
            $("#content-hidden").val(content);
        });
    });
</script>
<script type="text/plain" id="content">
</script>
<script type="text/javascript">
    var ue = UE.getEditor('content');
    ue.ready(function() {
        ue.setContent('${item.content}');
    });
</script>

<input type="hidden" name="content" id="content-hidden"/>