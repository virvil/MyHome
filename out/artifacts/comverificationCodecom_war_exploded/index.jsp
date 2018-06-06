<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/6
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript">
        function login(){
            //这是使用ajax的方式提交
            $.ajax({
                type:'post',
                url:'user/check.action',
                //data:$('#loginInputForm').serialize(),
                data:{
                    'VerificationCode':$("#VerificationCode").val(),
                },
                dataType:'json',
                success:function(obj){
                    var rad = Math.floor(Math.random() * Math.pow(10, 8));
                    if(obj && obj.success==true){
                        alert(obj.msg);
                    }else{
                        document.getElementById("verification_Code"). innerHTML =obj.msg;
                        //uuuy是随便写的一个参数名称，后端不会做处理，作用是避免浏览器读取缓存的链接
                        $("#randCodeImage").attr("src", "/VerificationCode/generate.action?uuuy="+rad);
                        $("#VerificationCode").val("").focus(); // 清空并获得焦点
                    }
                }
            });
        }

        /**
         *验证码刷新
         */
        function VerificationCode(){
            var rad = Math.floor(Math.random() * Math.pow(10, 8));
            //uuuy是随便写的一个参数名称，后端不会做处理，作用是避免浏览器读取缓存的链接
            $("#randCodeImage").attr("src", "/VerificationCode/generate.action?uuuy="+rad);
        }

    </script>
</head>
<body>
<form>

    <div id="btn_area">
        <input type="text" id="VerificationCode" name="VerificationCode"  placeholder="请输入验证码" class="verify">
        <a href="javascript:void(0);" onclick="VerificationCode()">
            <img id="randCodeImage" alt="验证码"  src="/VerificationCode/generate.action" width="100" height="40"/>
        </a>
    </div>
    <div style="float:left;">
        <input type="button" name="button" id="sub_btn" onclick="login()" value="登录"/>
    </div>
    <div id="verification_Code">验证码认证</div>
</form>
</body>
</html>
