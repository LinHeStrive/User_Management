<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				<form class="d-flex align-items-center h-100"
					action="${APP_PATH }/select.php" method="post">
					<div class="input-group">
						<div class="input-group-prepend bg-transparent">
							<i class="input-group-text border-0 mdi mdi-magnify"></i>
						</div>
						<input type="text" name="select"
							class="form-control bg-transparent border-0"
							placeholder="用户搜索">
					</div>
				</form>
			</div>

			<ul class="navbar-nav navbar-nav-right">





				<li class="nav-item d-none d-lg-block full-screen-link"><a
					class="nav-link"> <i class="mdi mdi-fullscreen"
						id="fullscreen-button"></i>
				</a></li>
				<li class="nav-item nav-settings d-none d-lg-block"><a
					class="nav-link" href="#"> <i
						class="mdi mdi-format-line-spacing"></i>
				</a></li>
			</ul>

		</div>
	</nav>

</body>
</html>