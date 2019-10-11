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
<title>wifi管理</title>
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
	margin-top: 20px;
	height: 525px;
	overflow-y: hidden;
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
					<!-- 修改 -->
					<div class="modal fade" id="wifiUpdateModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document" id="HelpUpdateModal">
							<div class="modal-content"
								style="border-color: #f25d2d; height: 525px;">

								<div class="modal-header" style="background-color: #f25d2d">
									<h4 class="modal-title" style="color: #ffffff;">wifi修改</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body ">
									<div class="grid-margin stretch-card">
										<div class="card">
											<div class="card-body">
												<form class="forms-sample">
													<div class="form-group">
														<label for="name_update_input">名称</label> <input
															type="text" class="form-control" name="noteName"
															id="name_update_input"> <span class="help-block"></span>
													</div>
													<div class="form-group">
														<label for="wifeName_update_input">无线名</label> <input
															type="text" class="form-control" name="wifeName"
															id="wifeName_update_input" placeholder="TP-LINK-3E7F">
														<span class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="wifePassword_update_input">密码</label> <input
															type="password" class="form-control" name="wifePassword"
															id="wifePassword_update_input" placeholder="****">
														<span class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="safeNote_update_input">安全笔记</label>
														<textarea name="safeNote" class="form-control"
															id="safeNote_update_input" rows="4"></textarea>
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
										id="wifi_update_btn"
										style="background-color: #f25d2d; border-color: #f25d2d;">更新</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 添加 -->
					<div class="modal fade" id="wifiAddModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document" id="HelpAddModal">
							<div class="modal-content"
								style="border-color: #f25d2d; height: 525px;">
								<div class="modal-header" style="background-color: #f25d2d">
									<h4 class="modal-title" style="color: #ffffff;">wifi添加</h4>
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
														<label for="name_add_input">名称</label> <input type="text"
															class="form-control" name="noteName" id="name_add_input">
														<span class="help-block"></span>
													</div>
													<div class="form-group">
														<label for="wifeName_add_input">无线名</label> <input
															type="text" class="form-control" name="wifeName"
															id="wifeName_add_input" placeholder="TP-LINK-3E7F">
														<span class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="wifePassword_add_input">密码</label> <input
															type="password" class="form-control" name="wifePassword"
															id="wifePassword_add_input" placeholder="****"> <span
															class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="safeNote_add_input">安全笔记</label>
														<textarea name="safeNote" class="form-control"
															id="safeNote_add_input" rows="4"></textarea>
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
										id="wifi_save_btn"
										style="background-color: #f25d2d; border-color: #f25d2d;">保存</button>
								</div>
							</div>
						</div>
					</div>

					<div class="content">
						<div class="animated fadeIn">
							<div class="row" id="card"></div>
						</div>
					</div>

				</div>

				<div class="row" style="background-color: #f2edf3">
					<div class="col-md-5 " id="page_nav_area" style="margin: 0 auto;"></div>
				</div>



				<!-- content-wrapper ends -->
				<!-- partial:../../partials/_footer.html -->
				<jsp:include page="../same/same_footer.jsp"></jsp:include>
				<div class="r ">
					<button id="wifi_add_btn"
						class="btn btn-social-icon btn-google btn-rounded"
						style="background: #f25d2d; font-size: 24px">+</button>

				</div>
			</div>

		</div>
	</div>
	</div>
	<div>


		<script type="text/javascript">
			var totalRecord;
			var currentPage;

			$(function() {
				to_page(1);
			});

			function to_page(pn) {
				$.ajax({
					url : "${APP_PATH }/wifis",
					data : "pn=" + pn,
					type : "GET",
					success : function(result) {
						build_datebases_table(result);
						build_page_info(result);
						build_page_nav(result)
					}
				});
			}
			function build_datebases_table(result) {
				$("#card").empty();
				var datebases = result.extend.pageInfo.list;
				$.each(datebases,
						function(index, item) {
							var img_1 = $("<img></img>").addClass(
									"card-img-top").attr("src",
									"${APP_PATH }/model/images/note/wifi.png")
									.attr("alt", "Card image cap");
							var urlNameH5 = $("<h5></h5>").addClass(
									"text-sm-center mt-2 mb-1").append(
									item.noteName);
							var a_1 = $("<i></i>").addClass(
									"mdi_in mdi mdi-lead-pencil");
							a_1.attr("edit-id", item.id);
							var a_2 = $("<i></i>").addClass(
									"mdi_in mdi mdi-close-circle-outline");
							a_2.attr("del-id", item.id).attr("del-name",
									item.noteName);
							var div_1 = $("<div></div>").attr("style",
									"background-color:#f25d2d;").addClass(
									"card-text text-sm-center").append(a_1)
									.append(a_2);
							var div_card = $("<div></div>").addClass("card")
									.append(img_1).append(urlNameH5).append(
											div_1);

							$("<div></div>").addClass("col-md-4").attr("style",
									"margin-top:40px").append(img_1).append(
									div_card).appendTo("#card");
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
				$.each(result.extend.pageInfo.navigatepageNums,
						function(index, item) {

							var numLi = $("<li></li>").append(
									$("<a></a>").append(item));
							if (result.extend.pageInfo.pageNum == item) {
								numLi.addClass("active").attr("style",
										"color:#553597");
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

			$(document).on("click", ".mdi-close-circle-outline", function() {
				var id = $(this).attr("del-id");
				var noteName = $(this).attr("del-name");
				//alert($(this).parents("tr").find("td:eq(1)").text());
				if (confirm("确认删除【" + noteName + "】吗？")) {
					//确认，发送ajax请求删除即可
					$.ajax({
						url : "${APP_PATH}/wifi/" + id,
						type : "DELETE",
						success : function(result) {
							alert(result.msg);
							to_page(currentPage);
						}
					});
				}

			});

			$(document).on("click", ".mdi-lead-pencil", function() {
				getDatebase($(this).attr("edit-id"));
				//3、把员工的id传递给模态框的更新按钮
				$("#wifi_update_btn").attr("edit-id", $(this).attr("edit-id"));
				$("#wifiUpdateModal").modal({
					backdrop : "static"
				});
			});

			function getDatebase(id) {
				$.ajax({
					url : "${APP_PATH}/wifi/" + id,
					type : "GET",
					success : function(result) {
						var wifiDate = result.extend.wifi;
						$("#name_update_input").val(wifiDate.noteName);
						$("#wifeName_update_input").val(wifiDate.wifeName);
						$("#wifePassword_update_input").val(
								wifiDate.wifePassword);
						$("#safeNote_update_input").val(wifiDate.safeNote);

					}
				});
			}
			$("#wifi_update_btn").click(function() {
				$.ajax({
					url : "${APP_PATH}/wifi/" + $(this).attr("edit-id"),
					type : "PUT",
					data : $("#wifiUpdateModal form").serialize(),
					success : function(result) {
						$("#wifiUpdateModal").modal('hide');
						alert(result.msg);
						//2、回到页面
						to_page(currentPage);

					}
				});
			});

			function reset_form(ele) {
				$(ele)[0].reset();
				//清空表单样式
				$(ele).find("*").removeClass("has-error has-success");
				$(ele).find(".help-block").text("");
			}
			$("#wifi_add_btn").click(function() {

				reset_form("#wifiAddModal form");
				$("#wifiAddModal").modal({
					backdrop : "static"
				});
			});
			$("#wifi_save_btn").click(function() {

				$.ajax({
					url : "${APP_PATH}/wifi",
					type : "POST",
					data : $("#wifiAddModal form").serialize(),
					success : function(result) {
						alert(result.msg);
						if (result.code == 100) {
							//员工保存成功
							//1、关闭模态框
							$("#wifiAddModal").modal('hide');
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