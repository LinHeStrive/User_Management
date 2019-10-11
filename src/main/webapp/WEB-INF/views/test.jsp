<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${APP_PATH }/password/css/dragdealer.css">
<link rel="stylesheet" href="${APP_PATH }/password/css/style.css">

<link rel="shortcut icon" href="${APP_PATH }/model/images/favicon.png" />

<link rel="stylesheet"
	href="${APP_PATH }/model/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="${APP_PATH }/model/vendors/css/vendor.bundle.base.css">

<link rel="stylesheet" href="${APP_PATH }/model/css/style.css">
<link rel="shortcut icon" href="${APP_PATH }/model/images/favicon.png" />

<link rel="stylesheet" href="${APP_PATH }/model/css/boot.css">
<style type="text/css">
.test{
   height:300px;
   width:700px;
   background-color:#fff;
   margin:100px auto;
}
.test1{
   height:150px;
   width:100%;
   background-color:#ddd;
   text-align:center;
   line-height: 100px;
}
.test2{
   height:150px;
   width:100%;
   background-color:#337ab7;
   text-align:center;
   line-height: 100px;
}
</style>

<script src="${APP_PATH }/model/vendors/js/vendor.bundle.addons.js"></script>
<!-- endinject -->
<!-- Plugin js for this page-->
<!-- End plugin js for this page-->
<!-- inject:js -->
<script src="${APP_PATH }/model/js/off-canvas.js"></script>
<script src="${APP_PATH }/model/js/misc.js"></script>

<script src="${APP_PATH }/password/js/dragdealer.js"></script>
<script src="${APP_PATH }/password/js/script.js"></script>
<title>Insert title here</title>
</head>
<body>
	<nav
		class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
		<div style="margin: 0 auto;"
			class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
			<a class="navbar-brand brand-logo" href="#"> <img
				src="${APP_PATH }/model/images/logo.png" alt="logo" />
			</a> <a class="navbar-brand brand-logo-mini" href="index.html"><img
				src="images/logo-mini.svg" alt="logo" /></a>

		</div>
	</nav>
	<div class="content-wrapper">
		<div class="content">
		    <div class="test">
		        <div class="test1">还没验证请前去邮箱验证，或<a href="${APP_PATH }/jump/register.php">重新注册</a></div>
		        <div class="test2">已经验证请返回<a href="${APP_PATH}/jump/login.php" style="color:red;">登录</a></div>
		    </div>
		</div>
	</div>
</body>
</html>