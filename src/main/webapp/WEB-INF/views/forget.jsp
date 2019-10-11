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
<title>注册</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="${APP_PATH }/model/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="${APP_PATH }/model/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="${APP_PATH }/model/css/style.css">
<link rel="stylesheet" href="${APP_PATH }/model/css/boot.css">
<link rel="shortcut icon" href="${APP_PATH }/model/images/favicon.png" />


<script src="${APP_PATH }/model/vendors/js/vendor.bundle.base.js"></script>
<script src="${APP_PATH }/model/vendors/js/vendor.bundle.addons.js"></script>
<script src="${APP_PATH }/model/js/off-canvas.js"></script>
<script src="${APP_PATH }/model/js/misc.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${APP_PATH }/model/laydate/laydate.js"></script>
<script charset="utf-8" type="text/javascript">
	laydate.render({
		elem : '#birthday_add_input'//指定元素
	});
</script>
</head>

<body>
	<nav
		class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
		<div style="margin: 0 auto;"
			class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
			<a class="navbar-brand brand-logo" href="#"> <img
				src="${APP_PATH }/model/images/logo2.png" alt="logo" />
			</a> <a class="navbar-brand brand-logo-mini" href="index.html"><img
				src="images/logo-mini.svg" alt="logo" /></a>

		</div>
	</nav>
	<div id="userAdd" class="content-wrapper  align-items-center auth"
		style="margin-top: 100px;">
		<div class="row">
			<div class="col-6 grid-margin stretch-card mx-auto">
				<div class="card">
					<div class="card-body">
						<h3 class="card-title" style="text-align:center;">忘记密码</h3>
						<p class="card-description"></p>
						<form class="forms-sample">
							<div class="form-group">
								<label for="username">请输入用户名</label> <input type="text"
									name="username" class="form-control" id="username"
									placeholder="Name"><span class="help-block"></span>
							</div>
						</form>
						<button id="user_select_btn" type="button"
							class="btn btn-gradient-primary mr-2">验证</button>
						<a class="btn btn-light" href="${APP_PATH }/jump/login.php">取消</a>


					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	    $("#user_select_btn") .click(
	    	function() {
	    		var username = document.getElementById("username").value;
				$.ajax({
					url : "${APP_PATH}/user/forget",
					type : "POST",
					data : {"username" : username},
					success : function(result) {
						if (result.code == 100) {
							alert("请前去邮箱查看密码提示！");
							window.location.href = "${APP_PATH }/jump/logout.php";
					} else {
						alert("用户名输入错误！");
					}

				}

			});
		});
	</script>
</body>

</html>
