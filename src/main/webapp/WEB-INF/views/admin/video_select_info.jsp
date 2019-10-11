<%@page import="org.aspectj.weaver.ast.Var"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>搜索</title>
<link rel="stylesheet"
	href="${APP_PATH }/model/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="${APP_PATH }/model/vendors/css/vendor.bundle.base.css">

<link rel="stylesheet" href="${APP_PATH }/model/css/style.css">
<link rel="shortcut icon" href="${APP_PATH }/model/images/favicon.png" />

<link rel="stylesheet" href="${APP_PATH }/model/css/boot.css" />
<style type="text/css">
.r {
	position: fixed;
	right: 40px;
	bottom: 40px;
}

.mdi_in {
	color: #ffffff;
}

h4 {
	font-color: #b66dff;
}

#HelpUpdateModal {
	margin-top: 20px;
	height: 525px;
	overflow-y: hidden;
}

.modal-body {
	overflow: auto;
	max-height: 525px;
}

#HelpAddModal {
	margin-top: 15px;
	height: 525px;
	overflow-y: hidden;
}
</style>

<script type="text/javascript"
	src="${APP_PATH }/model/ueditor/ueditor.config.js"></script>
<script type="text/javascript"
	src="${APP_PATH }/model/ueditor/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${APP_PATH }/model/ueditor/lang/zh-cn/zh-cn.js"></script>
<script src="${APP_PATH }/model/vendors/js/vendor.bundle.base.js"></script>
<script src="${APP_PATH }/model/vendors/js/vendor.bundle.addons.js"></script>
<script src="${APP_PATH }/model/js/off-canvas.js"></script>
<script src="${APP_PATH }/model/js/misc.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${APP_PATH }/model/laydate/laydate.js"></script>

</head>
<body>
	<div class="container-scroller">
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
						action="${APP_PATH }/select_video.php" method="post">
						<div class="input-group">
							<div class="input-group-prepend bg-transparent">
								<i class="input-group-text border-0 mdi mdi-magnify"></i>
							</div>
							<input type="text" name="cameId"
								class="form-control bg-transparent border-0" placeholder="摄像机编号">
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
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="same/same_side.jsp"></jsp:include>


			<div class="main-panel">
				<div class="content-wrapper">
					<div class="content">
						<div class="row">
							<c:forEach items="${pageInfo3.list}" var="video">
								<div class=""col-md-4"">
								   <video controls="controls" height="200" width="200">
								       <source src="${APP_PATH }/model/mp4/${video.video}" type="video/mp4">
								   </video>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		//---------全选/全不选------------
		$("#check_all").click(function() {
			//attr获取自定义属性:attr获取checked是undefined
			//prop获取我们这些dom原生的属性
			$(".check_item").prop("checked", $(this).prop("checked"));
		});

		//---------------------批量删除--------------------
		//点击全部删除，就批量删除
		$("#del_camera_btn").click(
				function() {

					var cameraId = "";
					var del_idstr = "";
					//$(".check_item:checked")
					$.each($(".check_item:checked"), function() {
						del_idstr += $(this).parents("tr").find("td:eq(1)")
								.text()
								+ "-";
					});
					del_idstr = del_idstr.substring(0, del_idstr.length - 1);
					if (confirm("确认删除【" + del_idstr + "】吗？")) {
						//发送ajax请求
						$.ajax({
							url : "${APP_PATH}/camera/" + del_idstr,
							type : "DELETE",
							success : function(result) {
								alert(result.msg);
								to_page(currentPage);
							}
						});
					}
				})
		//---------------------------------------------
		//-----------------------------------------

		//------------------信息修改------------------------
		$(document).on(
				"click",
				"#update_camera_btn",
				function() {
					getCamera($(this).attr("update-id"));
					//3、把员工的id传递给模态框的更新按钮
					$("#camera_update_btn").attr("update-id",
							$(this).attr("update-id"));
					$("#cameraUpdateModal").modal({
						backdrop : "static"
					});
				});

		function getCamera(id) {
			$.ajax({
				url : "${APP_PATH}/camera/" + id,
				type : "GET",
				success : function(result) {
					var cameraDate = result.extend.camera;
					$("#cameraId_update_input").val(cameraDate.cameraId);
					$("#position_update_input").val(cameraDate.position);
					$("#angle_update_input").val(cameraDate.angle);
					$("#picQuality_update_input").val(cameraDate.picQuality);
				}
			});
		}
		$("#camera_update_btn").click(function() {
			$.ajax({
				url : "${APP_PATH}/camera/" + $(this).attr("update-id"),
				type : "PUT",
				data : $("#cameraUpdateModal form").serialize(),
				success : function(result) {
					$("#cameraUpdateModal").modal('hide');
					alert(result.msg);
					//2、回到页面
					to_page(currentPage);

				}
			});
		});
		//-------------------------------------------------
		//----------------------添加摄像机------------------------
		function reset_form(ele) {
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
		$("#add_camera_btn").click(function() {

			reset_form("#cameraAddModal form");
			$("#cameraAddModal").modal({
				backdrop : "static"
			});
		});
		$("#camera_add_btn").click(function() {

			$.ajax({
				url : "${APP_PATH}/camera",
				type : "POST",
				data : $("#cameraAddModal form").serialize(),
				success : function(result) {
					alert(result.msg);
					if (result.code == 100) {
						//员工保存成功
						//1、关闭模态框
						$("#cameraAddModal").modal('hide');
						//2、来到最后一页显示刚才保存的数据
						//发送ajax请求显示最后一页数据即可
						//
						to_page(totalRecord);
					}

				}
			});
		});
	</script>

</body>
</html>