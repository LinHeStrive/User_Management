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
<title>银行卡管理</title>
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
					<div class="modal fade" id="bankUpdateModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document" id="HelpUpdateModal">
							<div class="modal-content" style="border-color: #4fa553; height: 525px">

								<div class="modal-header"
									style="background-color: #4fa553">
									<h4 class="modal-title" style="color: #ffffff;">银行修改</h4>
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
											<label for="name_update_input">名称</label> <input type="text"
												class="form-control" name="noteName" id="name_update_input">
												 <span class="help-block"></span>
										</div>
										<div class="form-group">
											<label for="bankName_update_input">银行名称</label> <input
												type="text" class="form-control" name="bankName"
												id="bankName_update_input" placeholder="建设银行">
											<span class="help-block"></span>
										</div>

										<div class="form-group">
											<label for="cardType_update_input">银行卡类型</label> <input
												type="text" class="form-control" name="cardType"
												id="cardType_update_input" placeholder="信用卡">
											<span class="help-block"></span>
										</div>


										<div class="form-group">
											<label for="cardNumber1_update_input">卡号1</label> <input type="text"
												name="cardNumber1" class="form-control" id="cardNumber1_update_input"> 
												<span class="help-block"></span>
										</div>



										<div class="form-group">
											<label for="cardPassword1_update_input">密码1</label> <input
												type="password" class="form-control" name="cardPassword1"
												id="cardPassword1_update_input" placeholder="****"> <span
												class="help-block"></span>
										</div>
										
										<div class="form-group">
											<label for="cardNumber2_update_input">卡号2</label> <input type="text"
												name="cardNumber2" class="form-control" id="cardNumber2_update_input"> 
												<span class="help-block"></span>
										</div>



										<div class="form-group">
											<label for="cardPassword2_update_input">密码2</label> <input
												type="password" class="form-control" name="cardPassword2"
												id="cardPassword2_update_input" placeholder="****"> <span
												class="help-block"></span>
										</div>
										
										<div class="form-group">
											<label for="cardNumber3_update_input">卡号3</label> <input type="text"
												name="cardNumber3" class="form-control" id="cardNumber3_update_input"> 
												<span class="help-block"></span>
										</div>



										<div class="form-group">
											<label for="cardPassword3_update_input">密码3</label> <input
												type="password" class="form-control" name="cardPassword3"
												id="cardPassword3_update_input" placeholder="****"> <span
												class="help-block"></span>
										</div>
										
										<div class="form-group">
											<label for="bankTelephone_update_input">银行电话</label> <input type="text"
												name="bankTelephone" class="form-control" id="bankTelephone_update_input"> 
												<span class="help-block"></span>
										</div>

										<div class="form-group">
											<label for="safenote_update_input">安全笔记</label>
											<textarea name="safeNote" class="form-control"
												id="safenote_update_input" rows="4"></textarea>
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
										id="bank_update_btn" style="background-color: #4fa553;border-color:#4fa553">更新</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 添加 -->
					<div class="modal fade" id="bankAddModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document" id="HelpAddModal">
							<div class="modal-content" style="border-color: #4fa553; height: 525px">
								<div class="modal-header" style="background-color: #4fa553">
									<h3 class="modal-title" style="color: #ffffff;">银行添加</h3>
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
														<label for="bankName_add_input">银行名称</label> <input
															type="text" class="form-control" name="bankName"
															id="bankName_add_input" placeholder="建设银行"> <span
															class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="cardType_add_input">银行卡类型</label> <input
															type="text" class="form-control" name="cardType"
															id="cardType_add_input" placeholder="信用卡"> <span
															class="help-block"></span>
													</div>


													<div class="form-group">
														<label for="cardNumber1_add_input">卡号1</label> <input
															type="text" name="cardNumber1" class="form-control"
															id="cardNumber1_add_input"> <span
															class="help-block"></span>
													</div>



													<div class="form-group">
														<label for="cardPassword1_add_input">密码1</label> <input
															type="password" class="form-control" name="cardPassword1"
															id="cardPassword1_add_input" placeholder="****">
														<span class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="cardNumber2_add_input">卡号2</label> <input
															type="text" name="cardNumber2" class="form-control"
															id="cardNumber2_add_input"> <span
															class="help-block"></span>
													</div>



													<div class="form-group">
														<label for="cardPassword2_add_input">密码2</label> <input
															type="password" class="form-control" name="cardPassword2"
															id="cardPassword2_add_input" placeholder="****">
														<span class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="cardNumber3_add_input">卡号3</label> <input
															type="text" name="cardNumber3" class="form-control"
															id="cardNumber3_add_input"> <span
															class="help-block"></span>
													</div>



													<div class="form-group">
														<label for="cardPassword3_add_input">密码3</label> <input
															type="password" class="form-control" name="cardPassword3"
															id="cardPassword3_add_input" placeholder="****">
														<span class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="bankTelephone_add_input">银行电话</label> <input
															type="text" name="bankTelephone" class="form-control"
															id="bankTelephone_add_input"> <span
															class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="safenote_add_input">安全笔记</label>
														<textarea name="safeNote" class="form-control"
															id="safenote_add_input" rows="4"></textarea>
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
										id="bank_save_btn" style="background-color: #4fa553;border-color:#4fa553">保存</button>
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
					<button id="bank_add_btn"
						class="btn btn-social-icon btn-google btn-rounded"
						style="background: #4fa553; font-size: 24px">+</button>
						
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
					url : "${APP_PATH }/banks",
					data : "pn=" + pn,
					type : "GET",
					success : function(result) {
						build_banks_table(result);
						build_page_info(result);
						build_page_nav(result)
					}
				});
			}
			function build_banks_table(result) {
				$("#card").empty();
				var banks = result.extend.pageInfo.list;
				$.each(banks,
						function(index, item) {
							var img_1 = $("<img></img>").addClass(
									"card-img-top").attr("src",
									"${APP_PATH }/model/images/note/bank.png")
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
									"background-color:#4fa553;").addClass(
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
				$.each(result.extend.pageInfo.navigatepageNums, function(index,
						item) {

					var numLi = $("<li></li>")
							.append($("<a></a>").append(item));
					if (result.extend.pageInfo.pageNum == item) {
						numLi.addClass("active").attr("style","color:#553597");
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
						url : "${APP_PATH}/bank/" + id,
						type : "DELETE",
						success : function(result) {
							alert(result.msg);
							to_page(currentPage);
						}
					});
				}

			});

			$(document).on(
					"click",
					".mdi-lead-pencil",
					function() {
						getDatebase($(this).attr("edit-id"));
						//3、把员工的id传递给模态框的更新按钮
						$("#bank_update_btn").attr("edit-id",
								$(this).attr("edit-id"));
						$("#bankUpdateModal").modal({
							backdrop : "static"
						});
					});

			function getDatebase(id) {
				$.ajax({
					url : "${APP_PATH}/bank/" + id,
					type : "GET",
					success : function(result) {
						var bankDate = result.extend.bank;
						$("#name_update_input").val(bankDate.noteName);
						$("#bankName_update_input").val(bankDate.bankName);
						$("#cardType_update_input").val(bankDate.cardType);
						$("#cardNumber1_update_input").val(bankDate.cardNumber1);
						$("#cardPassword1_update_input").val(bankDate.cardPassword1);
						$("#cardNumber2_update_input").val(bankDate.cardNumber2);
						$("#cardPassword2_update_input").val(bankDate.cardPassword2);
						$("#cardNumber3_update_input").val(bankDate.cardNumber3);
						$("#cardPassword3_update_input").val(bankDate.cardPassword3);
						$("#bankTelephone_update_input").val(bankDate.bankTelephone);
						$("#safenote_update_input").val(bankDate.safeNote);

					}
				});
			}
			$("#bank_update_btn").click(function() {
				$.ajax({
					url : "${APP_PATH}/bank/" + $(this).attr("edit-id"),
					type : "PUT",
					data : $("#bankUpdateModal form").serialize(),
					success : function(result) {
						$("#bankUpdateModal").modal('hide');
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
			$("#bank_add_btn").click(function() {

				reset_form("#bankAddModal form");
				$("#bankAddModal").modal({
					backdrop : "static"
				});
			});
			$("#bank_save_btn").click(function() {

				$.ajax({
					url : "${APP_PATH}/bank",
					type : "POST",
					data : $("#bankAddModal form").serialize(),
					success : function(result) {
						alert(result.msg);
						if (result.code == 100) {
							//员工保存成功
							//1、关闭模态框
							$("#bankAddModal").modal('hide');
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