<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户管理</title>
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
					<form action="${APP_PATH }/select_user" method="post" class="form-inline" style="margin-left: 100px;margin-top: 15px;">
						<input type="text" name="name" class="form-control mb-2 mr-sm-2"
							id="name" placeholder="姓名" style="width: 100px;">
						- &nbsp;<input type="text" name="username"
							class="form-control mb-2 mr-sm-2" id="username"
							placeholder="用户名" style="width: 100px;"> - &nbsp;<input
							type="text" name="sex" class="form-control mb-2 mr-sm-2"
							id="sex" placeholder="性别" style="width: 100px;">
						- &nbsp;<input type="text" name="bNum"
							class="form-control mb-2 mr-sm-2" id="bNum"
							placeholder="楼号" style="width: 100px;">
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
					<div class="modal fade" id="userAddModal" tabindex="-1"
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
														<label for="name_add_input">姓名：</label> <input type="text"
															name="name" class="form-control" id="name_add_input"
															placeholder="真实姓名"><span class="help-block"></span>
													</div>
													<div class="form-group">
														<label for="username_add_input">用户名：</label> <input
															type="text" name="username" class="form-control"
															id="username_add_input" placeholder="字母、数字、符号"><span
															class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="password_add_input">密码：</label> <input
															type="password" name="password" class="form-control"
															id="password_add_input" placeholder="字母、数字、符号"><span
															class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="phone_add_input">手机号：</label> <input
															type="text" name="phone" class="form-control"
															id="phone_add_input" placeholder="11位数字"><span
															class="help-block"></span>
													</div>

													<div class="col-md-6">
														<div class="form-group row">
															<label class="col-form-label">性别：</label>
															<div class="col-sm-4">
																<div class="form-check">
																	<label class="form-check-label"> <input
																		type="radio" class="form-check-input" name="sex"
																		id="sex1_update_input" value="1" checked="checked">
																		男
																	</label>
																</div>
															</div>
															<div class="col-sm-4">
																<div class="form-check">
																	<label class="form-check-label"> <input
																		type="radio" class="form-check-input" name="sex"
																		id="sex2_update_input" value="0"> 女
																	</label>
																</div>
															</div>
														</div>
													</div>


													<div class="form-group">
														<label for="bNum_add_input">楼号：</label> <input type="text"
															name="bNum" class="form-control" id="bNum_add_input"
															placeholder="X号楼X单元XX门号"><span class="help-block"></span>
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
										id="user_add_btn"
										style="background-color: #c79af7; border-color: #c79af7;">保存</button>
								</div>
							</div>
						</div>
					</div>

					<!-- 修改 -->
					<div class="modal fade" id="userUpdateModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document" id="HelpUpdateModal">
							<div class="modal-content"
								style="border-color: #c79af7; height: 525px">

								<div class="modal-header" style="background-color: #c79af7">
									<h4 class="modal-title" style="color: #ffffff;">用户信息修改</h4>
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
														<label for="name_update_input">姓名：</label> <input
															type="text" name="name" class="form-control"
															id="name_update_input" placeholder="name">
													</div>
													<div class="form-group">
														<label for="username_update_input">用户名：</label> <input
															type="text" name="username" class="form-control"
															id="username_update_input" placeholder="username">
													</div>
													<div class="col-md-6">
														<div class="form-group row">
															<label class="col-form-label">性别：</label>
															<div class="col-sm-4">
																<div class="form-check">
																	<label class="form-check-label"> <input
																		type="radio" class="form-check-input" name="sex"
																		id="sex1_update_input" value="1" checked="checked">
																		男
																	</label>
																</div>
															</div>
															<div class="col-sm-4">
																<div class="form-check">
																	<label class="form-check-label"> <input
																		type="radio" class="form-check-input" name="sex"
																		id="sex2_update_input" value="0"> 女
																	</label>
																</div>
															</div>
														</div>
													</div>
													<div class="form-group">
														<label for="phone_update_input">手机号：</label> <input
															type="text" name="phone" class="form-control"
															id="phone_update_input" placeholder="1XXXXX">
													</div>
													<div class="form-group">
														<label for="bNum_update_input">楼号：</label> <input
															type="text" name="bNum" class="form-control"
															id="bNum_update_input" placeholder="X号楼X单元XX号">
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
										id="user_update_btn"
										style="background-color: #c79af7; border-color: #c79af7;">更新</button>
								</div>
							</div>
						</div>
					</div>

					<!-- 发送 -->
					<div class="modal fade" id="urlUpdateModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog modal-lg" role="document"
							id="HelpUpdateModal">
							<div class="modal-content"
								style="border-color: #c79af7; height: 525px">
								<div class="modal-header" style="background-color: #c79af7;">
									<h4 class="modal-title" style="color: #ffffff;">系统消息发送</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>

								<div class="modal-body">
									<div class="grid-margin stretch-card">
										<div class="card">
											<div class="card-body">
												<div class="col-md-6">
													<div class="form-group">
														<label for="title_input">标题</label> <input type="text"
															class="form-control" name="title" id="title_input">
														<span class="help-block"></span>
													</div>
													<div class="form-group ">
														<label for="setitle_input">副标题</label> <input type="text"
															class="form-control" name="setitle" id="setitle_input">
														<span class="help-block"></span>
													</div>
													<script id="editor" type="text/plain"
														style="width: 900px; height: 400px; margin: 0 auto;"></script>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default btn-sm"
										data-dismiss="modal">关闭</button>
									<button type="button" class="btn btn-primary btn-sm"
										id="url_update_btn"
										style="background-color: #c79af7; border-color: #c79af7;">发送</button>
								</div>
							</div>
						</div>
					</div>

					<!-- 批量发送 -->
					<div class="modal fade" id="userMassages" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog modal-lg" role="document"
							id="HelpUpdateModal">
							<div class="modal-content"
								style="border-color: #c79af7; height: 525px">
								<div class="modal-header" style="background-color: #c79af7;">
									<h4 class="modal-title" style="color: #ffffff;">系统消息发送</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>

								<div class="modal-body">
									<div class="grid-margin stretch-card">
										<div class="card">
											<div class="card-body">
												<div class="col-md-6">
													<div class="form-group">
														<label for="title_all_input">标题</label> <input type="text"
															class="form-control" name="title" id="title_all_input">
														<span class="help-block"></span>
													</div>
													<div class="form-group ">
														<label for="setitle_all_input">副标题</label> <input
															type="text" class="form-control" name="setitle"
															id="setitle_all_input"> <span class="help-block"></span>
													</div>
													<script id="editor_all" type="text/plain"
														style="width: 900px; height: 400px; margin: 0 auto;"></script>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default btn-sm"
										data-dismiss="modal">关闭</button>
									<button type="button" class="btn btn-primary btn-sm"
										id="massage_save"
										style="background-color: #c79af7; border-color: #c79af7;">发送</button>
								</div>
							</div>
						</div>
					</div>




					<div class="row">
						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div style="margin-left: 670px; margin-bottom: 20px;">
										<button id="del_user_btn"
											class="btn btn-gradient-primary btn-sm" style="width: 41px;">
											<i class="mdi mdi-database-minus menu-icon"></i>
										</button>
										<button id="add_user_btn"
											class="btn btn-gradient-primary btn-sm" style="width: 41px;">
											<i class="mdi mdi-database-plus menu-icon"></i>
										</button>
										<!-- <a href="${APP_PATH }/fee/feeList">导出Excel</a> -->
										<button id="down_user_btn" class="btn btn-outline-dark btn-sm"
											style="width: 41px;">
											<i class="mdi mdi mdi-download menu-icon"></i>
										</button>

										<button id="to_all_user_btn"
											class="btn btn-outline-dark btn-sm" style="width: 41px;">
											<i class="mdi mdi-send menu-icon"></i>
										</button>


									</div>
									<table class="table table-bordered" id="user_table">
										<thead>
											<tr>
												<th><input type="checkbox" id="check_all" /></th>
												<th><b>用户头像</b></th>
												<th><b>姓名</b></th>
												<th><b>用户名</b></th>
												<th><b>注册时间</b></th>
												<th><b>性别</b> <th><b>操作</b></th>
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
		var totalRecord;
		var currentPage;

		$(function() {
			to_page(1);
		});

		function to_page(pn) {
			$.ajax({
				url : "${APP_PATH }/users",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					build_users_table(result);
					build_page_info(result);
					build_page_nav(result);
				}
			});
		}

		function build_users_table(result) {
			//清空table表格
			$("#user_table tbody").empty();
			var user = result.extend.pageInfo.list;
			$
					.each(
							user,
							function(index, item) {
								var checkBoxTd = $("<td></td>")
										.append(
												$(
														"<input type='checkbox' class='check_item'/>")
														.attr("id", item.id));
								//checkBoxTd.attr("id", item.id);
								var picTd = $("<td></td>").append(
										$("<img></img>").attr(
												"src",
												"${APP_PATH }/model/images/faces/"
														+ item.pic));
								var nameTd = $("<td></td>").append(item.name);
								var usernameTd = $("<td></td>").append(
										item.username);
								var timeTd = $("<td></td>").append(
										item.year + "年" + item.month + "月"
												+ item.day + "日");
								var sexTd = $("<td></td>");
								if (item.sex == 1) {
									sexTd.append("男");
								} else {
									sexTd.append("女");
								}
								var updateBtn = $("<button></button>")
										.addClass(
												"btn btn-gradient-primary btn-sm")
										.append("修改").attr("id",
												"update_user_btn");
								updateBtn.attr("update-id", item.id).attr(
										"update-name", item.username);
								var sendBtn = $("<button></button>").addClass(
										"btn btn-outline-dark btn-sm").append(
										"发送").attr("id", "to_user_btn");
								sendBtn.attr("touser-id", item.id);
								var btnTd = $("<td></td>").append(updateBtn)
										.append(" ").append(sendBtn);
								$("<tr></tr>").append(checkBoxTd).append(picTd)
										.append(nameTd).append(usernameTd)
										.append(timeTd).append(sexTd).append(
												btnTd).appendTo(
												"#user_table tbody");
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

		//----------------全选/全不选-------------------
		$("#check_all").click(function() {
			//attr获取自定义属性:attr获取checked是undefined
			//prop获取我们这些dom原生的属性
			$(".check_item").prop("checked", $(this).prop("checked"));
		});
		//---------------------------------------------------
		//--------------------批量导出-----------------
		$("#down_user_btn")
				.click(
						function() {
							var userNames = "";
							var lock_idstr = "";
							//$(".check_item:checked")
							$.each($(".check_item:checked"), function() {
								userNames += $(this).parents("tr").find(
										"td:eq(2)").text()
										+ ",";
								lock_idstr += this.id + "-";
							});
							//去除empNames多余的逗号
							userNames = userNames.substring(0,
									userNames.length - 1);
							lock_idstr = lock_idstr.substring(0,
									lock_idstr.length - 1);
							if (confirm("确认导出【" + lock_idstr + "】的信息吗？")) {
								//alert(lock_idstr);
								window.location = "${APP_PATH }/fee/userList?ids="
										+ lock_idstr;
								//发送ajax请求
								/*$.ajax({
								url : "${APP_PATH }/fee/feeList",
								type : "POST",
								date:{
									"ids" : lock_idstr
								},
								success : function(result) {
									//location.href="http://http://localhost:8080/ssm-crud/UserInfo 2019-09-25.xls"
									alert(result.msg);
								},
								error : function(result) {
									alert(result.msg);
								}
								});*/
							}
						})
		//--------------------批量删除-------------------
		$("#del_user_btn").click(
				function() {

					var name = "";
					var username = "";
					//$(".check_item:checked")
					$.each($(".check_item:checked"), function() {
						name += $(this).parents("tr").find("td:eq(2)").text()
								+ "-";
						username += $(this).parents("tr").find("td:eq(3)")
								.text()
								+ "-";
					});
					username = username.substring(0, username.length - 1);
					name = name.substring(0, name.length - 1);
					if (confirm("确认删除【" + name + "】吗？")) {
						//发送ajax请求
						$.ajax({
							url : "${APP_PATH}/user/" + username,
							type : "DELETE",
							success : function(result) {
								alert(result.msg);
								to_page(currentPage);
							}
						});
					}
				})
		//-----------------------------------------------------

		//----------------修改用户信息------------------

		$(document).on("click", "#update_user_btn", function() {
			getUser($(this).attr("update-id"));
			//3、把员工的id传递给模态框的更新按钮
			$("#user_update_btn").attr("update-id", $(this).attr("update-id"));
			$("#userUpdateModal").modal({
				backdrop : "static"
			});
		});

		function getUser(id) {
			$.ajax({
				url : "${APP_PATH}/user/" + id,
				type : "GET",
				success : function(result) {
					var userDate = result.extend.user;
					$("#name_update_input").val(userDate.name);
					$("#username_update_input").val(userDate.username);
					$("#card-body input[name=sex]").val([ userDate.sex ]);
					$("#bNum_update_input").val(userDate.bNum);
					$("#phone_update_input").val(userDate.phone);
				}
			});
		}
		$("#user_update_btn").click(function() {
			$.ajax({
				url : "${APP_PATH}/user/" + $(this).attr("update-id"),
				type : "PUT",
				data : $("#userUpdateModal form").serialize(),
				success : function(result) {
					$("#userUpdateModal").modal('hide');
					alert(result.msg);
					//2、回到页面
					to_page(currentPage);
				}
			});
		});

		//------------------------------------
		//---------------发送----------------------
		$(document).on("click", "#to_user_btn", function() {
			$("#url_update_btn").attr("touser-id", $(this).attr("touser-id"));
			$("#urlUpdateModal").modal({
				backdrop : "static"
			});
		});
		var ue = UE.getEditor('editor');
		$("#url_update_btn").click(function() {
			var title = document.getElementById("title_input").value;
			var setitle = document.getElementById("setitle_input").value;
			var content = ue.getContent();
			console.log("content:" + content);
			$.ajax({
				type : "POST",
				url : "${APP_PATH }/note/" + $(this).attr("touser-id"),
				data : {
					"title" : title,
					"Content" : content,
					"setitle" : setitle
				},
				success : function(result) {
					alert(result.msg);
					$("#urlUpdateModal").modal('hide');
				},
				error : function(result) {
					alert(result.msg);
					$("#urlUpdateModal").modal('hide');
				}
			});
		});
		//----------------------------------------

		//------------批量发送------------------
		$("#to_all_user_btn").click(function() {
			$("#userMassages").modal({
				backdrop : "static"
			});
		})
		var editor_all = UE.getEditor('editor_all');
		$("#massage_save")
				.click(
						function() {
							var title = document
									.getElementById("title_all_input").value;
							var setitle = document
									.getElementById("setitle_all_input").value;
							var content = editor_all.getContent();
							console.log("content:" + content);
							var userNames = "";
							var lock_idstr = "";
							//$(".check_item:checked")
							$.each($(".check_item:checked"), function() {
								userNames += $(this).parents("tr").find(
										"td:eq(2)").text()
										+ ",";
								lock_idstr += this.id + "-";
							});
							//去除empNames多余的逗号
							userNames = userNames.substring(0,
									userNames.length - 1);
							lock_idstr = lock_idstr.substring(0,
									lock_idstr.length - 1);
							if (confirm("确认发送至【" + userNames + "】吗？")) {
								//发送ajax请求
								$.ajax({
									url : "${APP_PATH}/to_user_notes/"
											+ lock_idstr,
									type : "POST",
									data : {
										"title" : title,
										"Content" : content,
										"setitle" : setitle
									},
									success : function(result) {
										alert(result.msg);
										$("#userMassages").modal('hide');
									},
									error : function(result) {
										alert(result.msg);
										$("#userMassages").modal('hide');
									}
								});
							}
						})
		//------------------------------------------------------
		//------------------添加用户-----------------
		//------------------校验-----------------

		function validate_add_form() {
			var username = $("#username_add_input").val();
			var reguser = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if (!reguser.test(username)) {
				//alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
				//清空之前的样式
				show_validate_msg("#username_add_input", "error",
						"用户名可以是2-5位中文或者6-16位英文和数字的组合");
				return false;
			} else {
				show_validate_msg("#username_add_input", "success", "");
			}
			;
			//1、拿到要校验的数据，使用正则表达式
			var password = $("#password_add_input").val();
			var regpwd = /(^[a-zA-Z0-9_-]{8,20}$)/;
			if (!regpwd.test(password)) {
				//alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
				//清空之前的样式
				show_validate_msg("#password_add_input", "error",
						"密码是8-16位英文大小写、数字、符号的组合");
				return false;
			} else {
				show_validate_msg("#password_add_input", "success", "");
			}
			;

			return true;
		}

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

		$("#username_add_input").change(
				function() {
					//发送ajax请求校验用户名是否可用
					var username = this.value;
					$.ajax({
						url : "${APP_PATH}/user/checkuser",
						data : "username=" + username,
						type : "POST",
						success : function(result) {
							if (result.code == 100) {
								show_validate_msg("#username_add_input",
										"success", "用户名可用");
								$("#user_save_btn").attr("ajax_va", "success");
							} else {
								show_validate_msg("#username_add_input",
										"error", result.extend.va_msg);
								$("#user_save_btn").attr("ajax_va", "error");
							}
						}
					});

				});
		$("#phone_add_input").change(
				function() {
					//发送ajax请求校验用户名是否可用
					var email = this.value;
					$.ajax({
						url : "${APP_PATH}/user/checkphone",
						data : "phone=" + phone,
						type : "POST",
						success : function(result) {
							if (result.code == 100) {
								show_validate_msg("#phone_add_input",
										"success", "邮箱可用");
								$("#user_save_btn").attr("ajax_va", "success");
							} else {
								show_validate_msg("#phone_add_input", "error",
										result.extend.va_msg);
								$("#user_save_btn").attr("ajax_va", "error");
							}
						}
					});

				});
		$("#password_add_input").change(
				function() {
					//发送ajax请求校验用户名是否可用
					var password = this.value;
					$.ajax({
						url : "${APP_PATH}/user/checkpwd",
						data : "password=" + password,
						type : "POST",
						success : function(result) {
							if (result.code == 100) {
								show_validate_msg("#password_add_input",
										"success", "密码可用");
								$("#user_save_btn").attr("ajax_va", "success");
							} else {
								show_validate_msg("#password_add_input",
										"error", result.extend.va_msg);
								$("#user_save_btn").attr("ajax_va", "error");
							}
						}
					});

				});
		//-----------------------------------------
		function reset_form(ele) {
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
		$("#add_user_btn").click(function() {

			reset_form("#userAddModal form");
			$("#userAddModal").modal({
				backdrop : "static"
			});
		});
		$("#user_add_btn").click(function() {

			$.ajax({
				url : "${APP_PATH}/user/doRegist",
				type : "POST",
				data : $("#userAddModal form").serialize(),
				success : function(result) {
					alert(result.msg);
					if (result.code == 100) {
						//员工保存成功
						//1、关闭模态框
						$("#userAddModal").modal('hide');
						//2、来到最后一页显示刚才保存的数据
						//发送ajax请求显示最后一页数据即可
						//
						to_page(totalRecord);
					}

				}
			});
		});
		//---------------------------------------
		//--------------------多重查找----------------
		/*$("#select_user_btn").click(function(){
			$.ajax({
				url:"{APP_PATH}/select_user.php",
				type:"POST",
				data:$("#selectUser form").serialize()
			})
		})*/
	</script>
												
												

</body>
</html>