<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>欢迎登陆后台</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            border: 0;
        }

        body {
            background: url('${pageContext.request.contextPath}/images/bodybg.jpg') repeat-x;
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

        #login li input {
            /*position: relative;*/
            /*bottom: -6px;*/
            /*padding-bottom: 8px;*/
        }

        #login li img {
            margin-left: 8px;
            vertical-align: middle;
            margin-top: -10px;
        }

        #username, #password {
            background: url('${pageContext.request.contextPath}/images/inputbg.jpg') no-repeat;
            width: 200px;
            height: 30px;
            line-height: 30px;
            border: none;
            text-indent: 8px;
            margin-left: 5px;
            color: #666;
            font-family: "microsoft yahei";
        }

        #verify {
            background: url('${pageContext.request.contextPath}/images/yzmbg.jpg') no-repeat;
            width: 105px;
            height: 30px;
            line-height: 30px;
            border: none;
            text-indent: 8px;
            margin-left: 5px;
            color: #666;
            font-family: "microsoft yahei";
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
        if (top != self) {
            top.location = self.location;
        }
        focus();
        $(function () {
            /*
            $('#verify').keypress(function(e) {
                var keyCode= event.keyCode;
                var realkey = String.fromCharCode(keyCode).toUpperCase();
                $(this).val($(this).val()+realkey);
                event.returnValue =false;
            });
            $('#verify').blur(function(){
                $('#verify').val($('#verify').val().toUpperCase());
            });
            */
            $("#form1").submit(function () {
                if ($("#username").val() == '') {
                    alert('请输入用户名');
                    $("#username").focus();
                    return false;
                }
                if ($("#password").val() == '') {
                    alert('请输入密码');
                    $("#password").focus();
                    return false;
                }
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

    <form name="form1" method="post" action="check" id="form1" style="padding-top: 170px;">
        <div id="login">
            <span style="margin-left: 20px;color: red;display: block;padding-top: 10px;">${error}</span>

            <ul style="padding-top: 25px;">
                <li>用户名:<input name="username" type="text" id="username" placeholder="请输入用户名"></li>
                <li>密&nbsp;&nbsp;&nbsp;&nbsp;码:<input name="password" type="password" id="password" placeholder="请输入密码">
                </li>

                <li id="sub"><input style="float: left;margin-left: 46px" type="submit" name="ok" id="ok" value="登陆">
                    <a href="#" style="line-height: 33px; margin-left: 20px; color: rgb(177,0,0);text-decoration: none;font-size: 12px;">忘记密码</a>
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