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
<title></title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="${APP_PATH }/model/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="${APP_PATH }/model/vendors/css/vendor.bundle.base.css">

<link rel="stylesheet" href="${APP_PATH }/model/css/style.css">
<link rel="shortcut icon" href="${APP_PATH }/model/images/favicon.png" />


<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="${APP_PATH }/model/vendors/js/vendor.bundle.base.js"></script>
<script src="${APP_PATH }/model/vendors/js/vendor.bundle.addons.js"></script>
<!-- endinject -->
<!-- Plugin js for this page-->
<!-- End plugin js for this page-->
<!-- inject:js -->
<script src="${APP_PATH }/model/js/off-canvas.js"></script>
<script src="${APP_PATH }/model/js/misc.js"></script>
</head>
<body>
	<nav
		class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
		<div
			class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
			<a class="navbar-brand brand-logo" href="#"> <img
				src="${APP_PATH }/model/images/logo2.png" alt="logo" />
			</a> <a class="navbar-brand brand-logo-mini" href="index.html"><img
				src="images/logo-mini.svg" alt="logo" /></a>

		</div>
		<div class="navbar-menu-wrapper d-flex align-items-stretch">
			<div class="search-field d-none d-md-block">
				<form class="d-flex align-items-center h-100" action="${APP_PATH }/select.php" method="post">
					<div class="input-group">
						<div class="input-group-prepend bg-transparent">
							<i class="input-group-text border-0 mdi mdi-magnify"></i>
						</div>
						<input type="text" name="select" class="form-control bg-transparent border-0"
							placeholder="信息搜索">
					</div>
				</form>
			</div>
			<ul class="navbar-nav navbar-nav-right">

				<li class="nav-item nav-profile dropdown"><a
					class="nav-link dropdown-toggle" id="profileDropdown" href="#"
					data-toggle="dropdown" aria-expanded="false">
						<div class="nav-profile-img">
							<img src="${APP_PATH }/model/images/faces/face1.jpg" alt="image">
							<span class="availability-status online"></span>
						</div>
						<div class="nav-profile-text">
							<p class="mb-1 text-black">游客</p>
						</div>
				</a>
					<div class="dropdown-menu navbar-dropdown"
						aria-labelledby="profileDropdown">
						<a class="dropdown-item"  href="javascript:void(0)" onclick="location.reload()" > <i
							class="mdi mdi-cached mr-2 text-success"></i> 刷新页面
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="${APP_PATH }/jump/login.php"> <i
							class="mdi mdi-logout mr-2 text-primary"></i> 前去登录
						</a>
					</div></li>
				<li class="nav-item d-none d-lg-block full-screen-link"><a
					class="nav-link"> <i class="mdi mdi-fullscreen"
						id="fullscreen-button"></i>
				</a></li>

				<li class="nav-item nav-logout d-none d-lg-block"><a
					class="nav-link" href="${APP_PATH }/jump/login.php"> <i
						class="mdi mdi-power"></i>
				</a></li>
				<li class="nav-item nav-settings d-none d-lg-block"><a
					class="nav-link" href="#"> <i
						class="mdi mdi-format-line-spacing"></i>
				</a></li>
			</ul>

		</div>
	</nav>
	<script type="text/javascript">
	var allNote = '<%=session.getAttribute("allNote")%>';
	$(function(){
		if(allNote>0){
			var note_i = document.getElementById('note');
			var span = document.createElement('span');
			span.className = 'count-symbol bg-danger';
			note_i.appendChild(span);
		 }
	})
	</script>
</body>
</html>