<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>欢迎登陆后台</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>--%>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            border: 0;
        }

        body {
            background: url('${pageContext.request.contextPath}/images/bg.jpg') repeat-x;
            font-family: "microsoft yahei";
            font-size: 14px;
        }

        li {
            list-style: none;
        }

        #main {

            width: 100%;
            height: 630px;
        <%--background: url('${pageContext.request.contextPath}/images/mainbg.jpg') center center no-repeat;--%> margin: 0 auto;
        }

        #login {
            border-radius: 10px;
            width: 300px;
            height: 184px;
            margin: 0 auto;

            background: rgba(215, 193, 169, 39);
        }

        #login li {
            padding-left: 18px;
            color: #8e8089;
            line-height: 42px;
        }

        #login li img {
            margin-left: 8px;
            vertical-align: middle;
            margin-top: -10px;
        }

        #sendEmail, #ok {
            background: #56739c;
            width: 87px;
            height: 34px;
            color: #FFF;
            border: 0;
            font-family: "microsoft yahei";
            line-height: 34px;
            text-align: center;
            cursor: pointer;
            border-radius: 10px;
        }

        #ok:hover {

        }

        #sub {
            display: block;
            /*width: 87px;*/
            margin: 10px auto;
        }
    </style>
    <script>

        $(function () {

            $("#form1").submit(function () {

                if ($("#verify").val() == '') {
                    alert('请输入验证码');
                    $("#verify").focus();
                    return false;
                }
            })
        });
    </script>

</head>
<body>
<div id="main">

    <form name="form1" method="post" action="checkEmail" id="form1" style="padding-top: 170px;">
        <div id="login" style="height: 150px;">
            <span style="color: red;    margin-left: 20px;
    color: red;
    display: block;
    padding-top: 10px;">${error}</span>

            <ul style="padding-top: 25px;">
                <li>验证码:<input  style=" width: 182px; height: 24px; padding-left: 10px; border-radius: 4px;margin-left: 10px;" name="email" type="text" id="username" placeholder="请输入邮件验证码"></li>

                <li id="sub"><input
                        style="float: left;margin-left: 56px;width: 65px;height: 28px;line-height: 28px "
                        type="submit" name="ok" id="ok" value="确认">
                </li>
            </ul>
        </div>
    </form>
</div>


<script type="text/javascript">


    var i = 1;

    function fun() {

        document.getElementById("verifyImg").src = "pcode.html?v=" + (i++);  //翻下1张图片
    }
</script>
</body>
</html>