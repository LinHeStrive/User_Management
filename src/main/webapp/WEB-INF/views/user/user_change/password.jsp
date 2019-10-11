<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>账户设置</title>

<!-- plugins:css -->
<link rel="stylesheet"
	href="${APP_PATH }/model/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="${APP_PATH }/model/vendors/css/vendor.bundle.base.css">

<link rel="stylesheet" href="${APP_PATH }/model/css/style.css">
<link rel="shortcut icon" href="${APP_PATH }/model/images/favicon.png" />

<link rel="stylesheet" href="${APP_PATH }/model/css/boot.css">
<style type="text/css">
.r {
	position: fixed;
	right: 40px;
	bottom: 40px;
}

.mdi_in {
	color: #b66dff;
}

h4 {
	font-color: #b66dff;
}
</style>


<script src="${APP_PATH }/model/vendors/js/vendor.bundle.addons.js"></script>
<!-- endinject -->
<!-- Plugin js for this page-->
<!-- End plugin js for this page-->
<!-- inject:js -->
<script src="${APP_PATH }/model/js/off-canvas.js"></script>
<script src="${APP_PATH }/model/js/misc.js"></script>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="../same/same_top.jsp"></jsp:include>
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="../same/same_side.jsp"></jsp:include>

			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<div class="btn-group" role="group" aria-label="Basic example"
										style="text-align: center; margin: 0 auto;">
										<button onclick="jump1()" type="button"
											class="btn btn-outline-primary btn-fw">个人信息修改</button>
										<button onclick="jump2()" type="button"
											class="btn btn-outline-primary btn-fw">密码修改</button>
										<button onclick="jump3()" type="button"
											class="btn btn-outline-primary btn-fw">头像修改</button>
										<button onclick="jump4()" type="button"
											class="btn btn-outline-primary btn-fw">手机号修改</button>
									</div>
									<p class="card-description"></p>
									<form class="forms-sample">

										<div class="form-group">
											<label for="password_update_input">旧密码</label> <input
												type="password" class="form-control"
												id="password_update_input" placeholder="Password"><span
												class="help-block"></span>
										</div>
										<div class="form-group">
											<label for="password_update_input1">新密码</label> <input
												type="password" class="form-control"
												id="password_update_input1" placeholder="Password"><span
												class="help-block"></span>
										</div>
										<div class="form-group">
											<label for="password_update_input2">新密码</label> <input
												type="password" name="password" class="form-control"
												id="password_update_input2" placeholder="Password"><span
												class="help-block"></span>
										</div>

									</form>
									<div style="text-align: right;">
										<button id="user_update_btn" type="submit"
											class="btn btn-gradient-primary">修改</button>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="btn btn-light"
											href="../Login.jsp">取消</a>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
				<jsp:include page="../same/same_footer.jsp"></jsp:include>
			</div>
		</div>

		<script type="text/javascript">
		function jump1(){
			
			 window.location.replace("${APP_PATH }/jump/user.php");
		}
		function jump2(){
			 window.location.replace("${APP_PATH }/jump/password.php");
		}
		function jump3(){
			 window.location.replace("${APP_PATH }/jump/face.php");
		}
		function jump4(){
			 window.location.replace("${APP_PATH }/jump/phone.php");
		}
		</script>
		<script type="text/javascript">
		//显示校验结果的提示信息
		function show_validate_msg(ele, status, msg) {
			//清除当前元素校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if ("success" == status) {
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			} else if ("error" == status) {
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		$("#password_update_input").change(
				function() {
					//发送ajax请求校验用户名是否可用
					var pwd = this.value;
					$.ajax({
						url : "${APP_PATH}/user/check_oldpwd",
						data : "pwd=" + pwd,
						type : "POST",
						success : function(result) {
							if (result.code == 100) {
								show_validate_msg("#password_update_input",
										"success","");
								$("#user_update_btn").attr("ajax_va", "success");
							} else {
								show_validate_msg("#password_update_input",
										"error", result.extend.va_msg);
								$("#user_update_btn").attr("ajax_va", "error");
							}
						}
					});

				});
		$("#password_update_input1").change(
				function() {
					//发送ajax请求校验用户名是否可用
					var password = this.value;
					$.ajax({
						url : "${APP_PATH}/user/checkpwd",
						data : "password=" + password,
						type : "POST",
						success : function(result) {
							if (result.code == 100) {
								show_validate_msg("#password_update_input1",
										"success","");
								$("#user_update_btn").attr("ajax_va", "success");
							} else {
								show_validate_msg("#password_update_input1",
										"error", result.extend.va_msg);
								$("#user_update_btn").attr("ajax_va", "error");
							}
						}
					});

				});
		$("#password_update_input2").change(
				function() {
					//发送ajax请求校验用户名是否可用
					var pwd2 = this.value;
					var pwd1 = document.getElementById("password_update_input1").value;
					$.ajax({
						url : "${APP_PATH}/user/checkpwdeq",
						data : {
							"pwd1" : pwd1,
							"pwd2" : pwd2
						},
						type : "POST",
						success : function(result) {
							if (result.code == 100) {
								show_validate_msg("#password_update_input2",
										"success","");
								$("#user_update_btn").attr("ajax_va", "success");
							} else {
								show_validate_msg("#password_update_input2",
										"error", result.extend.va_msg);
								$("#user_update_btn").attr("ajax_va", "error");
							}
						}
					});

				});
		
		
		
		$("#user_update_btn").click(function() {
				var pwd = document.getElementById("password_update_input").value;
				var pwd1 = document.getElementById("password_update_input1").value;
				var pwd2 = document.getElementById("password_update_input2").value;
				$.ajax({
					url : "${APP_PATH}/user" ,
					type : "PUT",
					data : {
						"pwd" : pwd,
						"pwd1" : pwd1,
						"pwd2" : pwd2
					},
					success : function(result) {
						alert(result.msg);
						window.location.href = "${APP_PATH }/jump/logout.php";
					}
				});
			})
		</script>
</body>
</html>