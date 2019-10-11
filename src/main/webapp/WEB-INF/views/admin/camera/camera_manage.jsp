<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>摄像机管理</title>
<link rel="stylesheet"
	href="${APP_PATH }/model/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="${APP_PATH }/model/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="${APP_PATH }/model/css/style.css">
<link rel="stylesheet" href="${APP_PATH }/model/css/boot.css">
<link rel="shortcut icon" href="${APP_PATH }/model/images/favicon.png" />
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
			<jsp:include page="../same/same_side.jsp"></jsp:include>
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

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="row" style="background-color: #f2edf3">
					<div class="col-md-5 " id="page_nav_area" style="margin: 0 auto;"></div>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
	//-------------------信息构建--------------------------
		var totalRecord;
		var currentPage;

		$(function() {
			to_page(1);
		});

		function to_page(pn) {
			$.ajax({
				url : "${APP_PATH }/cameras",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					build_cameras_table(result);
					build_page_info(result);
					build_page_nav(result);
				}
			});
		}

		function build_cameras_table(result) {
			//清空table表格
			$("#camera_table tbody").empty();
			var cameras = result.extend.pageInfo.list;
			$.each(cameras,function(index, item) {
				var checkBoxTd = $("<td></td>").append($("<input type='checkbox' class='check_item'/>").attr("id", item.id));
				//checkBoxTd.attr("id", item.id);
				var cameraIdTd = $("<td></td>").append(item.cameraId);
				var positionTd = $("<td></td>").append(item.position);
				var angleTd = $("<td></td>").append(item.angle);
				var picQualityTd = $("<td></td>").append(item.picQuality);
				var updateBtn = $("<button></button>").addClass("btn btn-gradient-primary btn-sm").append("修改").attr("id","update_camera_btn");
				updateBtn.attr("update-id", item.id).attr("update-cid", item.cameraId);
				var sendBtn = $("<button></button>").addClass("btn btn-outline-dark btn-sm").append("查看").attr("id", "to_camera_btn");
				sendBtn.attr("tocamera-id", item.id);
				var btnTd = $("<td></td>").append(updateBtn).append(" ").append(sendBtn);
				$("<tr></tr>").append(checkBoxTd)
				.append(cameraIdTd).append(positionTd)
				.append(angleTd).append(picQualityTd)
				.append(btnTd).appendTo("#camera_table tbody");
				});
		}
		function build_page_info(result) {
			$("#page_info_area").empty();
			$("#page_info_area").append(
					"当前" + result.extend.pageInfo.pageNum + "页，总"
							+ result.extend.pageInfo.pages + "页，总共"
							+ result.extend.pageInfo.total + "条记录");
			totalRecord = result.extend.pageInfo.total;
			currentPage = result.extend.pageInfo.pageNum;
		}
		//解析显示分页条，点击分页条能去下一页...
		function build_page_nav(result) {
			//page_nav_area
			$("#page_nav_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			//构建元素
			var firstPageLi = $("<li></li>").append(
					$("<a></a>").append("首页").attr("href", "#"));
			var prePageLi = $("<li></li>").append(
					$("<a></a>").append("&laquo;"));
			if (result.extend.pageInfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				//为元素添加点击翻页的事件
				firstPageLi.click(function() {
					to_page(1);
				});
				prePageLi.click(function() {
					to_page(result.extend.pageInfo.pageNum - 1);
				});
			}

			var nextPageLi = $("<li></li>").append(
					$("<a></a>").append("&raquo;"));
			var lastPageLi = $("<li></li>").append(
					$("<a></a>").append("尾页").attr("href", "#"));
			if (result.extend.pageInfo.hasNextPage == false) {
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			} else {
				nextPageLi.click(function() {
					to_page(result.extend.pageInfo.pageNum + 1);

				});
				lastPageLi.click(function() {
					to_page(result.extend.pageInfo.pages);
				});
			}
			//添加首页和前一页 的提示
			ul.append(firstPageLi).append(prePageLi);
			//1,2，3遍历给ul中添加页码提示
			$.each(result.extend.pageInfo.navigatepageNums, function(index,
					item) {

				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (result.extend.pageInfo.pageNum == item) {
					numLi.addClass("active").attr("style", "color:#553597");
				}
				numLi.click(function() {
					to_page(item);
				});
				ul.append(numLi);
			});
			//添加下一页和末页 的提示
			ul.append(nextPageLi).append(lastPageLi);

			//把ul加入到nav
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		}
		//------------------------------------------------------------------
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
			//---------------------跳转查看视频--------$("#to_camera_btn").click(function()-----------
			$(document).on("click","#to_camera_btn",function(){
				window.location = "${APP_PATH }/jump/video.php";
			})
	</script>


</body>
</html>