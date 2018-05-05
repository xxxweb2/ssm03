<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<dl class="lay_menu" id="lay_menu">
    <dt class="item_tit"><a href="javascript:;"><i class="icon icon_article"></i>自助列表</a></dt>
    <dd class="item_cont" style="display:none">
        <ul>
            <li><a href="${pageContext.request.contextPath}/article/list" target="main"><i class="icon icon_this"></i>列表</a>
            </li>
            <li><a href="${pageContext.request.contextPath}/article/add" target="main"><i class="icon icon_this"></i>新增</a>
            </li>
            <li><a href="${pageContext.request.contextPath}/category/article" target="main"><i
                    class="icon icon_this"></i>自助分类</a></li>
        </ul>
    </dd>
    <dt class="item_tit"><a href="javascript:;"><i class="icon icon_product"></i>产品</a></dt>
    <dd class="item_cont" style="display:none">
        <ul>
            <li><a href="${pageContext.request.contextPath}/goods/list" target="main"><i class="icon icon_this"></i>产品列表</a>
            </li>
            <li><a href="${pageContext.request.contextPath}/goods/add" target="main"><i class="icon icon_this"></i>新增产品</a>
            </li>
            <li><a href="${pageContext.request.contextPath}/goods/category" target="main"><i class="icon icon_this"></i>产品分类</a>
            </li>
        </ul>
    </dd>
    <dt class="item_tit"><a href="javascript:;"><i class="icon icon_msg"></i>留言</a></dt>
    <dd class="item_cont" style="display:none">
        <ul>
            <li><a href="__GROUP__/Message" target="main"><i class="icon icon_this"></i>留言列表</a></li>
        </ul>
    </dd>

    <dt class="item_tit"><a href="javascript:;"><i class="icon icon_msg"></i>导航</a></dt>
    <dd class="item_cont" style="display:none">
        <ul>
            <li><a href="${pageContext.request.contextPath}/skr/index" target="main"><i class="icon icon_this"></i>导航设置</a></li>
        </ul>
    </dd>

    <dt class="item_tit"><a href="javascript:;"><i class="icon icon_sys"></i>系统</a></dt>
    <dd class="item_cont" style="display:none">
        <ul>
            <li><a href="${pageContext.request.contextPath}/admin/status" target="main"><i class="icon icon_this"></i>系统状态</a></li>
            <li><a href="${pageContext.request.contextPath}/system/index" target="main"><i class="icon icon_this"></i>网站设置</a></li>
            <li><a href="${pageContext.request.contextPath}/flash/index" target="main"><i class="icon icon_this"></i>轮显图片</a></li>
        </ul>
    </dd>
</dl>