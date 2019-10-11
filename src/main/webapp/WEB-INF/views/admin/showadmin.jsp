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
</head>
<body>
<div class="container-scroller">
    <jsp:include page="same_top.jsp"></jsp:include>
	<div class="container-fluid page-body-wrapper">
		<jsp:include page="same_side.jsp"></jsp:include>
        <div class="main-panel">
			<div class="content-wrapper">
			    <div class="content">
			    </div>
			</div>
		</div>
	</div>
</div>
	
</body>
</html>