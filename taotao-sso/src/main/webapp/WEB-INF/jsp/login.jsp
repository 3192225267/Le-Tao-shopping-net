<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <title>乐淘-欢迎登陆</title>
    <link type="text/css" rel="stylesheet" href="/css/login02.css"/>
    <script type="text/javascript" src="/js/jquery-1.6.4.js"></script>

</head>
<body>
<div class="w">
    <div id="logo">
    	<a href="http://localhost:8082" clstag="passport|keycount|login|01">
    		<img src="/images/logo.png" alt="乐淘" width="170" height="60"/>
        </a><b></b>
   	</div>
</div>
<form id="formlogin" method="post" onsubmit="return false;">
    <%--<p class="tip">Click on button in image container</p>--%>
    <div class="cont">
        <div class="form sign-in">
            <h2>乐淘  欢迎登录</h2>
            <label>
                <span>用户名</span>
                <input type="text" id="loginname" name="username" class="text"  tabindex="1" autocomplete="off"/>
            </label>
            <script type="text/javascript">
                setTimeout(function () {
                    if (!$("#loginname").val()) {
                        $("#loginname").get(0).focus();
                    }
                }, 0);
            </script>

            <label>
                <span>密码</span>
                <input type="password" id="nloginpwd" name="password" class="text" tabindex="2" autocomplete="off"/>
            </label>
            <p class="forgot-pass">忘记密码?</p>
            <button type="button" class="submit" id="loginsubmit" tabindex="8" clstag="passport|keycount|login|06">登录</button>
        </div>
        <div class="sub-cont">
            <div class="img">
                <div class="img__text m--up">
                    <h2>没有账号?</h2>
                    <p>注册新账号开始购物之旅吧!</p>
                </div>
                <div class="img__text m--in">
                    <h2>已有帐号</h2>
                    <p></p>
                </div>
                <div class="img__btn">
                    <span class="m--up">点我注册</span>
                    <span class="m--in">点这里</span>
                </div>
            </div>
</form>
            <form id="personRegForm" method="post" onsubmit="return false;">
            <div class="form sign-up">
                <h2>注册一个新账号</h2>
                <label>
                    <span>用户名</span>
                    <input type="text" id="regName" name="username" class="text" tabindex="1" autoComplete="off"
                           onpaste="return false;"
                           value=""
                           onfocus="if(this.value=='') this.value='';this.style.color='#333'"
                           onblur="if(this.value=='') {this.value='';this.style.color='#999999'}"/>
                </label>
                <label>
                    <span>邮箱</span>
                    <input type="email" />
                </label>
                <label>
                    <span>请设置密码：</span>
                    <input type="password" id="pwd" name="password" class="text" tabindex="2"
                           style="ime-mode:disabled;"
                           onpaste="return  false" autocomplete="off"/>
                </label>
                <label>
                    <span>请确认密码：</span>
                    <input type="password" id="pwdRepeat" name="pwdRepeat" class="text" tabindex="3"
                           onpaste="return  false" autocomplete="off"/>
                </label>
                <button type="button" class="submit" id="registsubmit"tabindex="8"
                        clstag="regist|keycount|personalreg|07"
                        onclick="REGISTER.reg();">注册</button>


            </div>
            </form>
        </div>
    </div>

<script type="text/javascript">
	var redirectUrl = "${redirect}";
	var LOGIN = {
			checkInput:function() {
				if ($("#loginname").val() == "") {
					alert("用户名不能为空");
					$("#loginname").focus();
					return false;
				}
				if ($("#nloginpwd").val() == "") {
					alert("密码不能为空");
					$("#nloginpwd").focus();
					return false;
				}
				return true;
			},
			doLogin:function() {
				$.post("/user/login", $("#formlogin").serialize(),function(data){
					if (data.status == 200) {
						alert("登录成功！");
						if (redirectUrl == "") {
							location.href = "http://localhost:8082";
						} else {
							location.href = redirectUrl;
						}
					} else {
						alert("登录失败，原因是：" + data.msg);
						$("#loginname").select();
					}
				});
			},
			login:function() {
				if (this.checkInput()) {
					this.doLogin();
				}
			}

	};
	$(function(){
		$("#loginsubmit").click(function(){
			LOGIN.login();
		});
	});
</script>
<script>
    document.querySelector('.img__btn').addEventListener('click', function() {
        document.querySelector('.cont').classList.toggle('s--signup');
    });</script>



<script type="text/javascript">
    var REGISTER={
        param:{
            //单点登录系统的url
            surl:""
        },
        inputcheck:function(){
            //不能为空检查
            if ($("#regName").val() == "") {
                alert("用户名不能为空");
                $("#regName").focus();
                return false;
            }
            if ($("#pwd").val() == "") {
                alert("密码不能为空");
                $("#pwd").focus();
                return false;
            }
            if ($("#phone").val() == "") {
                alert("手机号不能为空");
                $("#phone").focus();
                return false;
            }
            //密码检查
            if ($("#pwd").val() != $("#pwdRepeat").val()) {
                alert("确认密码和密码不一致，请重新输入！");
                $("#pwdRepeat").select();
                $("#pwdRepeat").focus();
                return false;
            }
            return true;
        },
        beforeSubmit:function() {
            //检查用户是否已经被占用
            $.ajax({
                url : REGISTER.param.surl + "/user/check/"+escape($("#regName").val())+"/1?r=" + Math.random(),
                success : function(data) {
                    if (data.data) {
                        //检查手机号是否存在
                        $.ajax({
                            url : REGISTER.param.surl + "/user/check/"+$("#phone").val()+"/2?r=" + Math.random(),
                            success : function(data) {
                                if (data.data) {
                                    REGISTER.doSubmit();
                                } else {
                                    alert("此手机号已经被注册！");
                                    $("#phone").select();
                                }
                            }
                        });
                    } else {
                        alert("此用户名已经被占用，请选择其他用户名");
                        $("#regName").select();
                    }
                }
            });

        },
        doSubmit:function() {
            $.post("/user/register",$("#personRegForm").serialize(), function(data){
                if(data.status == 200){
                    alert('用户注册成功，请登录！');
                    REGISTER.login();
                } else {
                    alert("注册失败！");
                }
            });
        },
        login:function() {
            location.href = "/page/login";
            return false;
        },
        reg:function() {
            if (this.inputcheck()) {
                this.beforeSubmit();
            }
        }
    };
</script>
</body>
</html>