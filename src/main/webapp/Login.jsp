<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>登录</title>

<!-- 引入css和js -->
<link rel="stylesheet"
	href="${APP_PATH }/model/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="${APP_PATH }/model/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="${APP_PATH }/model/css/style.css">
<link rel="shortcut icon" href="${APP_PATH }/model/images/favicon.png" />
<style type="text/css">
img {
	display: block;
	margin-left: auto;
	margin-right: auto;
}

#pwd span {
	position: absolute;
	left: 90%;
	top: 35%;
}

#name span {
	position: absolute;
	left: 90%;
	top: 35%;
}

.mdi {
	color: #D8D8D8;
}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script type="text/javascript"
	src="${APP_PATH }/model/vendors/js/vendor.bundle.base.js"></script>
<script type="text/javascript" src="${APP_PATH }/model/js/Big.js"></script>
<script type="text/javascript"
	src="${APP_PATH }/model/vendors/js/vendor.bundle.addons.js"></script>
<script type="text/javascript" src="${APP_PATH }/model/js/off-canvas.js"></script>
<script type="text/javascript" src="${APP_PATH }/model/js/misc.js"></script>
</head>
<body>

	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="content-wrapper d-flex align-items-center auth">
				<div class="row w-100">
					<div class="col-lg-4 mx-auto">
						<div class="auth-form-light text-left p-5">
							<div class="brand-logo">
								<img src="${APP_PATH }/model/images/logo3.png">
							</div>

							<h4 style="font-family: Microsoft YaHei;">您好，欢迎使用便民服务系统！</h4>

							<form class="pt-3">
								<div class="input-group" id="name">
									<i class="fa fa-user fa-lg"></i> <input
										class="form-control form-control-lg" type="text"
										placeholder="请输入用户名..." id="username" name="username"
										autofocus="autofocus" /> <span class="mdi mdi-account"></span>

								</div>
								<br>
								<div class="input-group" id="pwd">
									<i class="fa fa-lock fa-lg"></i> <input
										class="form-control form-control-lg" type="password"
										placeholder="请输入密码..." id="password" name="password" /> <span
										class="mdi mdi-lock-outline"></span>
								</div>
								<br> <a href="${APP_PATH }/jump/forget.php"
									class="auth-link text-black">忘记密码?</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="${APP_PATH }/jump/visitor_show.php"
										class="text-primary">游客访问-></a>

								<div class="mt-3">
									<button type="button"
										class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn"
										id="login">登录</button>
								</div>



								<div class="text-center mt-4 font-weight-light">
									没有 账户？<a href="${APP_PATH }/jump/register.php"
										class="text-primary">点击注册</a>
								</div>

							</form>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#password").capsLockTip();
		$("#pwd").on(
				"click",
				".mdi-lock-outline",
				function() {
					$(this).removeClass("mdi mdi-lock-outline").addClass(
							"mdi mdi-lock-open");
					$(this).prev().attr("type", "text");
				});
		$("#pwd").on(
				"click",
				".mdi-lock-open",
				function() {
					$(this).removeClass("mdi mdi-lock-open").addClass(
							"mdi mdi-lock-outline");
					$(this).prev().attr("type", "password");
				});
	</script>


	<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
	<script type="text/javascript">
		$("#login")
				.click(
						
						function() {
							var username = document.getElementById("username").value;
							var password = document.getElementById("password").value;
							$
									.ajax({
										url : '${APP_PATH}/user/checkLogin.action',
										type : 'POST',
										data : {
											"username" : username,
											"password" : password,
										},
										dataType : "json",
										async : false,
										success : function(result) {
											if (result.code == 104) {
												$
														.ajax({
															url : '${APP_PATH}/user/queryItems.action',
															type : 'GET',
															success : function(
																	result) {
																if (result.code == 102) {
																	alert(result.msg);
																	window.location.href = "${APP_PATH}/jump/showItems.php";
																}
																if (result.code == 103) {
																	alert(result.msg);
																	window.location.href = "${APP_PATH}/jump/user_manage.php";
																}
																if (result.code == 203) {
																	alert(result.msg);
																	window.location.href = "${APP_PATH}/jump/login.php";
																}
															}

														});
											} else if (result.code == 204) {
												alert(result.msg);
												window.location.href = "${APP_PATH}/jump/login.php";
											} else {
												alert("用户名或密码不正确！");
												window.location.href = "${APP_PATH}/jump/login.php";
											}
										}
									});
						});
	</script>
</body>
</html>