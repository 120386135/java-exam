<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<header>
    <div class="navbar-fixed">
        <nav class="light-green darken-1">
            <div class="container">
                <div class="nav-wrapper">
                    <a href="main.jsp" class="brand-logo">Java考试网站</a>
                    <ul id="nav-mobile4" class="right hide-on-med-and-down">
                    	<s:if test="#session['USER_INFO']==null">
                        <li><a href="#logindialog" class="waves-effect waves-light btn modal-trigger">登录</a></li>
                        </s:if>
                        <s:else>
                        <li>
							<div class="chip">
								<a href="#" class="dropdown-button" style="color:#d50000;" data-activates="user_dropdown" data-induration="3000"
      								data-beloworigin="true" data-hover="true">
						        <img src="images/soccer4.jpg" alt="大黄鸭">
						        	<s:property value="#session['USER_INFO'].name"/>
						        </a>
						    </div>
						    <ul class="dropdown-content yellow lighten-5" id="user_dropdown">
						        <li><a href="userChangePassword.jsp" class="indigo-text text-darken-2">修改密码</a></li>
						        <li><a href="#" class="indigo-text text-darken-2" >查看信息</a></li>
						        <li class="divider"></li>
						        <li><a href="#" class="indigo-text text-darken-2" 
						        onclick="loginform.action='logout';loginform.submit();">退出登陆</a></li>
						    </ul>
					    </li>
					    <script>
					    	//登录成功后，开启与服务器的WebSocket连接，等待接收推送消息
					    	var ws = new WebSocket("ws://" + window.location.host +  "<%=request.getContextPath()%>/websocket/broadcast");
					    	ws.onopen=function(){
								//console.log("websocket open");
							}
							ws.onmessage=function(evt){
								//console.log("websocket getmessage:"+evt.data);
								var $toastContent = $('<span class="yellow-text lighten-5"><h4>'+evt.data+'</h4></span>');
							    Materialize.toast($toastContent, 8000, 'rounded');
							}	
					    </script>
                        </s:else>
                        <li><a href="#">签到</a></li>
                        <li class="active"><a href="#">考试</a></li>
                        <li><a href="#">作业</a></li>
                        <li><a href="#">微课</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>
<form name="loginform" method="post"></form>
