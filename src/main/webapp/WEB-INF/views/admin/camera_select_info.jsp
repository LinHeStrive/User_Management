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
					<form action="${APP_PATH }/select_camera" method="post" class="form-inline" style="margin-left: 100px;margin-top: 15px;">
						<input type="text" name="cameraId" class="form-control mb-2 mr-sm-2"
							id="cameraId" placeholder="摄像机编号" style="width: 100px;">
						- &nbsp;<input type="text" name="position"
							class="form-control mb-2 mr-sm-2" id="position"
							placeholder="地点" style="width: 100px;"> - &nbsp;<input
							type="text" name="angle" class="form-control mb-2 mr-sm-2"
							id="angle" placeholder="角度" style="width: 100px;">
						- &nbsp;<input type="text" name="picQuality"
							class="form-control mb-2 mr-sm-2" id="picQuality"
							placeholder="画质" style="width: 100px;">
						<button type="submit"
							class="btn btn-gradient-primary btn-sm" style="width: 41px;">
							<i class="mdi mdi-magnify"></i>
						</button>
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
				
				<!-- 添加 -->
					<div class="modal fade" id="cameraAddModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document" id="HelpAddModal">
							<div class="modal-content"
								style="border-color: #c79af7; height: 525px">
								<div class="modal-header" style="background-color: #c79af7">
									<h4 class="modal-title" style="color: #ffffff;">摄像机添加</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="grid-margin stretch-card">
										<div class="card">
											<div class="card-body">
												<form class="forms-sample">
													<div class="form-group">
														<label for="cameraId_add_input">摄像机编号</label> <input
															type="text" class="form-control" name="cameraId"
															id="cameraId_add_input"> <span
															class="help-block"></span>
													</div>
													<div class="form-group">
														<label for="position_add_input">地点</label> <input
															type="text" class="form-control" name="position"
															id="position_add_input"> <span class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="angle_add_input">角度</label> <input
															type="text" name="angle" class="form-control"
															id="angle_add_input"> <span
															class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="picQuality_add_input">画质</label> <input
															type="text" name="picQuality" class="form-control"
															id="picQuality_add_input"> <span
															class="help-block"></span>
													</div>

												</form>
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default btn-sm"
										data-dismiss="modal">关闭</button>
									<button type="button" class="btn btn-primary btn-sm"
										id="camera_add_btn"
										style="background-color: #c79af7; border-color: #c79af7;">保存</button>
								</div>
							</div>
						</div>
					</div>

					<!-- 修改 -->
					<div class="modal fade" id="cameraUpdateModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document" id="HelpUpdateModal">
							<div class="modal-content"
								style="border-color: #c79af7; height: 525px">

								<div class="modal-header" style="background-color: #c79af7">
									<h4 class="modal-title" style="color: #ffffff;">摄像机修改</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="grid-margin stretch-card">
										<div class="card">
											<div class="card-body">
												<form class="forms-sample">
													<div class="form-group">
														<label for="cameraId_update_input">摄像机编号</label> <input
															type="text" class="form-control" name="cameraId"
															id="cameraId_update_input"> <span
															class="help-block"></span>
													</div>
													<div class="form-group">
														<label for="position_update_input">地点</label> <input
															type="text" class="form-control" name="position"
															id="position_update_input"> <span class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="angle_update_input">角度</label> <input
															type="text" name="angle" class="form-control"
															id="angle_update_input"> <span
															class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="picQuality_update_input">画质</label> <input
															type="text" name="picQuality" class="form-control"
															id="picQuality_update_input"> <span
															class="help-block"></span>
													</div>


												</form>
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default btn-sm"
										data-dismiss="modal">关闭</button>
									<button type="button" class="btn btn-primary btn-sm"
										id="camera_update_btn"
										style="background-color: #c79af7; border-color: #c79af7;">更新</button>
								</div>
							</div>
						</div>
					</div>
					<div class="content">
						<div class="row">
							<div class="col-lg-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<div style="margin-left: 700px; margin-bottom: 20px;">

										<button id="del_camera_btn"
											class="btn btn-gradient-primary btn-sm" style="width: 55px;">删除</button>
										<button id="add_camera_btn"
											class="btn btn-outline-dark btn-sm" style="width: 55px;">添加</button>
									</div>
										<table class="table table-bordered" id="camera_table">
											<thead>
												<tr>
													<th><input type="checkbox" id="check_all" /></th>
													<th><b>摄像机编号</b></th>
													<th><b>地点</b></th>
													<th><b>角度</b></th>
													<th><b>清晰度</b></th>
													<th><b>操作</b></th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${pageInfo2.list}" var="camera">
												        <tr>
												           <td ><input id=${camera.id } type='checkbox' class='check_item'/></td>
												           <td>${camera.cameraId }</td>
												           <td>${camera.position }</td>
												           <td>${camera.angle }</td>
												           <td>${camera.picQuality }</td>
												           <td>
												               <button id="update_camera_btn" class="btn btn-gradient-primary btn-sm" update-id=${camera.id } update-cid=${camera.cameraId }>修改</button>
												               <button id="to_camera_btn" class="btn btn-outline-dark btn-sm" tocamera-id=${camera.id }>查看</button>
												           </td>
												        </tr>
												</c:forEach>

											</tbody>
										</table>
									</div>
								</div>
							</div>
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
	$("#del_camera_btn").click(function(){
		
		var cameraId = "";
		var del_idstr = "";
		//$(".check_item:checked")
		$.each($(".check_item:checked"),function(){
			del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
		});
		del_idstr=del_idstr.substring(0,del_idstr.length-1);
		if(confirm("确认删除【"+del_idstr+"】吗？")){
			//发送ajax请求
			$.ajax({
				url:"${APP_PATH}/camera/"+del_idstr,
				type:"DELETE",
				success:function(result){
					alert(result.msg);
					to_page(currentPage);
				}
			});
		}
	})
	//---------------------------------------------
	//-----------------------------------------
	
	//------------------信息修改------------------------
	$(document).on("click","#update_camera_btn",function() {
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