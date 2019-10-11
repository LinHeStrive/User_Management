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
<title>站点管理</title>
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
.btn-social-icon{
   background-color:#fff;
   border:#D0D0D0;
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
		<jsp:include page="same/same_top.jsp"></jsp:include>
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="same/same_side.jsp"></jsp:include>


			<div class="main-panel">
				<div class="content-wrapper">
					<!-- 修改url -->
					<div class="modal fade" id="urlUpdateModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document" id="HelpUpdateModal">
							<div class="modal-content"
								style="border-color: #95d3f2; height: 525px">
								<div class="modal-header" style="background-color: #95d3f2;">
									<h4 class="modal-title" style="color: #ffffff;">站点修改</h4>
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
														<label for="urlName_update_input">网站名</label> <input
															type="text" class="form-control" name="urlName"
															id="urlName_update_input" placeholder="Username">
														<span class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="url_update_input">网址</label> <input
															type="text" class="form-control" name="url"
															id="url_update_input" placeholder="http://xxx.xxx.xxx">
														<span class="help-block"></span>
													</div>


													<div class="form-group">
														<label for="urlUser_update_input">用户名</label> <input
															type="text" name="urlUser" class="form-control"
															id="urlUser_update_input" placeholder="用户名"> <span
															class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="urlPassword_update_input">密码</label> <input
															type="password" class="form-control" name="urlPassword"
															id="urlPassword_update_input" placeholder="密码"> <span
															class="help-block"></span>
													</div>


													<div class="form-group">
														<label for="urlMassage_update_input">信息</label> <input
															type="text" name="urlMassage" class="form-control"
															id="urlMassage_update_input" placeholder="信息"> <span
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
										id="url_update_btn"
										style="background-color: #95d3f2; border-color: #95d3f2;">更新</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 修改bank -->
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
											<label for="bank_name_update_input">名称</label> <input type="text"
												class="form-control" name="noteName" id="bank_name_update_input">
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
											<label for="bank_safenote_update_input">安全笔记</label>
											<textarea name="safeNote" class="form-control"
												id="bank_safenote_update_input" rows="4"></textarea>
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
					<!-- 修改通讯录 -->
					<div class="modal fade" id="addressUpdateModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document" id="HelpUpdateModal">
							<div class="modal-content"
								style="border-color: #0a6353; height: 525px">

								<div class="modal-header" style="background-color: #0a6353">
									<h4 class="modal-title" style="color: #ffffff;">通讯录修改</h4>
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
														<label for="address_noteName_update_input">名称</label> <input
															type="text" class="form-control" name="noteName"
															id="address_noteName_update_input"> <span
															class="help-block"></span>
													</div>
													<div class="form-group">
														<label for="address_name_update_input">姓名</label> <input
															type="text" class="form-control" name="name"
															id="address_name_update_input"> <span class="help-block"></span>
													</div>

													<div class="form-group row">
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label
															class="col-form-label">性别</label>
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<div class="form-check form-check-success">
															<label class="form-check-label"> <input
																type="radio" class="form-check-input" name="sex"
																id="sex1_update_input" value="1" checked="checked">
																男
															</label>
														</div>
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<div class="form-check form-check-success">
															<label class="form-check-label"> <input
																type="radio" class="form-check-input" name="sex"
																id="sex2_update_input" value="0"> 女
															</label>
														</div>
													</div>




													<div class="form-group">
														<label for="birthday_update_input">生日</label> <input
															type="text" name="birhday" class="form-control"
															id="birthday_update_input"> <span
															class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="address1_update_input">地址1</label> <input
															type="text" name="address1" class="form-control"
															id="address1_update_input"> <span
															class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="address2_update_input">地址2</label> <input
															type="text" name="address2" class="form-control"
															id="address2_update_input"> <span
															class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="address3_update_input">地址3</label> <input
															type="text" name="address3" class="form-control"
															id="address3_update_input"> <span
															class="help-block"></span>
													</div>


													<div class="form-group">
														<label for="telephone_update_input">电话</label> <input
															type="text" name="telephone" class="form-control"
															id="telephone_update_input" placeholder="root"> <span
															class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="safenote_update_input">安全笔记</label>
														<textarea name="safeNote" class="form-control"
															id="address_safenote_update_input" rows="4"></textarea>
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
										id="address_update_btn"
										style="background-color: #0a6353; border-color: #0a6353;">更新</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 修改wifi -->
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
														<label for="wifi_name_update_input">名称</label> <input
															type="text" class="form-control" name="noteName"
															id="wifi_name_update_input"> <span class="help-block"></span>
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
														<label for="wifi_safeNote_update_input">安全笔记</label>
														<textarea name="safeNote" class="form-control"
															id="wifi_safeNote_update_input" rows="4"></textarea>
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
					<!-- 修改db -->
					<div class="modal fade" id="datebaseUpdateModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document" id="HelpUpdateModal">
							<div class="modal-content"
								style="border-color: #553597; height: 525px;">

								<div class="modal-header" style="background-color: #553597">
									<h4 class="modal-title" style="color: #ffffff;">数据库修改</h4>
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
														<label for="db_name_update_input">名称</label> <input
															type="text" class="form-control" name="noteName"
															id="db_name_update_input" placeholder="ssm"> <span
															class="help-block"></span>
													</div>
													<div class="form-group">
														<label for="type_update_input">数据库类型</label> <input
															type="text" class="form-control" name="type"
															id="type_update_input" placeholder="mysql/orcal/...">
														<span class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="hostname_update_input">主机名</label> <input
															type="text" class="form-control" name="hostname"
															id="hostname_update_input" placeholder="localhost">
														<span class="help-block"></span>
													</div>


													<div class="form-group">
														<label for="port_update_input">端口号</label> <input
															type="text" name="port" class="form-control"
															id="port_update_input" placeholder="8080"> <span
															class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="datebase_update_input">数据库名</label> <input
															type="text" name="datebase" class="form-control"
															id="datebase_update_input" placeholder="ssm_crud">
														<span class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="dbuser_update_input">用户名</label> <input
															type="text" name="dbuser" class="form-control"
															id="dbuser_update_input" placeholder="root"> <span
															class="help-block"></span>
													</div>


													<div class="form-group">
														<label for="dbpassword_update_input">密码</label> <input
															type="password" class="form-control" name="dbpassword"
															id="dbpassword_update_input" placeholder="****">
														<span class="help-block"></span>
													</div>

													<div class="form-group">
														<label for="db_safenote_update_input">Textarea</label>
														<textarea name="safeNote" class="form-control"
															id="db_safenote_update_input" rows="4"></textarea>
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
										id="datebase_update_btn" style="background-color: #553597">更新</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 添加 -->
					<div class="modal fade" id="urlAddModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header" style="background-color: #17a0e5">
									<h3 class="modal-title" style="color: #ffffff;">站点添加</h3>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form class="forms-sample">
										<div class="form-group">
											<label for="urlName_add_input">网站名</label> <input type="text"
												class="form-control" name="urlName" id="urlName_add_input"
												placeholder="Username"> <span class="help-block"></span>
										</div>

										<div class="form-group">
											<label for="url_add_input">网址</label> <input type="text"
												class="form-control" name="url" id="url_add_input"
												placeholder="http://xxx.xxx.xxx"> <span
												class="help-block"></span>
										</div>


										<div class="form-group">
											<label for="urlUser_add_input">用户名</label> <input type="text"
												name="urlUser" class="form-control" id="urlUser_add_input"
												placeholder="用户名"> <span class="help-block"></span>
										</div>

										<div class="form-group">
											<label for="urlPassword_add_input">密码</label> <input
												type="password" class="form-control" name="urlPassword"
												id="urlPassword_add_input" placeholder="密码"> <span
												class="help-block"></span>
										</div>


										<div class="form-group">
											<label for="urlMassage_add_input">信息</label> <input
												type="text" name="urlMassage" class="form-control"
												id="urlMassage_add_input" placeholder="信息"> <span
												class="help-block"></span>
										</div>

									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<button type="button" class="btn btn-primary "
										id="url_save_btn" style="background-color: #17a0e5">保存</button>
								</div>
							</div>
						</div>
					</div>

					<div class="content">
						<div class="animated fadeIn">
							<div class="btn-group" role="group" aria-label="Basic example" style="margin-top:20px;">
								<a class="detailmain_a1" href="javascript:void(0);"
									rel="external nofollow" rel="external nofollow"
									id="detailmain_a1"> <span id="view_details1">
									<hr>
										<button type="button" class="btn btn-outline-info btn-fw">
											（站点管理）<i class="mdi mdi-chevron-down"></i>
										</button>
								</span>
								</a>
							</div>
							<hr>

							<div class="row" id="card1" style="display: none;">
								<div class="btn-group" role="group" aria-label="Basic example">
									<a class="detailmain_aa1 tc" href="javascript:void(0);"
										rel="external nofollow" rel="external nofollow"
										id="detailmain_aa1"
										style="width: 130px; display: block; margin: 0 auto"> <span
										class="theme_fcolor" id="view_detailss1">
											<button type="button" class="btn btn-outline-info btn-fw">
												（站点管理）<i class="mdi mdi-chevron-down"></i>
											</button>
									</span>
									</a>
								</div>

							</div>
						</div>
					</div>

					<div class="content">
						<div class="animated fadeIn">
						<div style="backgroud-color:#000;width:100%">

							<div class="btn-group" role="group" aria-label="Basic example" style="margin-top:20px;">
								<a class="detailmain_a2" href="javascript:void(0);"
									rel="external nofollow" rel="external nofollow"
									id="detailmain_a2"> <span id="view_details2">
									<hr>
										<button type="button" class="btn btn-outline-success btn-fw">
											（安全笔记）<i class="mdi mdi-chevron-down"></i>
										</button>
								</span>
								</a>
							</div>
							<hr>
						

							<div class="row" id="card2" style="display: none;">
								<div class="btn-group" role="group" aria-label="Basic example">
									<a class="detailmain_aa2 tc" href="javascript:void(0);"
										rel="external nofollow" rel="external nofollow"
										id="detailmain_aa2"
										style="width: 130px; display: block; margin: 0 auto"> <span
										class="theme_fcolor" id="view_detailss2">
											<button type="button" class="btn btn-outline-success btn-fw">
												（安全笔记）<i class="mdi mdi-chevron-down"></i>
											</button>
									</span>
									</a>
								</div>


							</div>
						</div>

					</div>

					<div class="row" style="background-color: #f2edf3">
						<div class="col-md-5 " id="page_nav_area" style="margin: 0 auto;"></div>
					</div>
					<div class="r ">
					<button id="add_btn"
						class="btn btn-social-icon btn-inverse-primary btn-rounded btn-icon btn-md"
						style=" font-size: 24px">+</button>

				</div>

				</div>

			</div>
		        <jsp:include page="same/same_footer.jsp"></jsp:include>
		    </div>
	</div>
	<div>

        <!-- 查询站点、安全笔记信息实现下拉效果 -->
		<script type="text/javascript">
			$(function view_details1_click() {
				$("#detailmain_a1").bind('click', function() {
					if ($("#card1").is(":hidden")) {
						$("#card1").show();
						$(this).find("#view_details1");
					} else {
						$("#card1").hide();
						$(this).find("#view_details1");
					}
				});
				$("#detailmain_aa1").bind('click', function() {
					$("#card1").hide();
					$("#view_details1");
				});
			});
			$(function view_details2_click() {
				$("#detailmain_a2").bind('click', function() {
					if ($("#card2").is(":hidden")) {
						$("#card2").show();
						$(this).find("#view_details2");
					} else {
						$("#card2").hide();
						$(this).find("#view_details2");
					}
				});
				$("#detailmain_aa2").bind('click', function() {
					$("#card2").hide();
					$("#view_details2");
				});
			});

			var totalRecord;
			var currentPage;

			$(function() {
				to_page(1);
			});

			function to_page(pn) {
				$.ajax({
					url : "${APP_PATH }/urls",
					data : "pn=" + pn,
					type : "GET",
					success : function(result) {
						build_urls_table(result);
					}
				});
				$.ajax({
					url : "${APP_PATH }/addresses",
					data : "pn=" + pn,
					type : "GET",
					success : function(result) {
						build_addresses_table(result);
					}
				});
				$.ajax({
					url : "${APP_PATH }/banks",
					data : "pn=" + pn,
					type : "GET",
					success : function(result) {
						build_banks_table(result);
					}
				});
				$.ajax({
					url : "${APP_PATH }/datebases",
					data : "pn=" + pn,
					type : "GET",
					success : function(result) {
						build_datebases_table(result);
					}
				});
				$.ajax({
					url : "${APP_PATH }/wifis",
					data : "pn=" + pn,
					type : "GET",
					success : function(result) {
						build_wifis_table(result);
					}
				});
			}
			function build_wifis_table(result) {
				//$("#card2").empty();
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
									"mdi_in mdi mdi-lead-pencil update_wifi");
							a_1.attr("edit-id", item.id);
							var a_2 = $("<i></i>").addClass(
									"mdi_in mdi mdi-close-circle-outline del_wifi");
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
									div_card).appendTo("#card2");
						});
			}
			function build_datebases_table(result) {
				//$("#card2").empty();
				var datebases = result.extend.pageInfo.list;
				$.each(datebases,
						function(index, item) {
							var img_1 = $("<img></img>").addClass(
									"card-img-top").attr("src",
									"${APP_PATH }/model/images/note/db.png")
									.attr("alt", "Card image cap");
							var urlNameH5 = $("<h5></h5>").addClass(
									"text-sm-center mt-2 mb-1").append(
									item.noteName);
							var a_1 = $("<i></i>").addClass(
									"mdi_in mdi mdi-lead-pencil update_db");
							a_1.attr("edit-id", item.id);
							var a_2 = $("<i></i>").addClass(
									"mdi_in mdi mdi-close-circle-outline del_db");
							a_2.attr("del-id", item.id).attr("del-name",
									item.noteName);
							var div_1 = $("<div></div>").attr("style",
									"background-color:#553597;").addClass(
									"card-text text-sm-center").append(a_1)
									.append(a_2);
							var div_card = $("<div></div>").addClass("card")
									.append(img_1).append(urlNameH5).append(
											div_1);

							$("<div></div>").addClass("col-md-4").attr("style",
									"margin-top:40px").append(img_1).append(
									div_card).appendTo("#card2");
						});
			}
			function build_banks_table(result) {
				//$("#card2").empty();
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
									"mdi_in mdi mdi-lead-pencil update_bank");
							a_1.attr("edit-id", item.id);
							var a_2 = $("<i></i>").addClass(
									"mdi_in mdi mdi-close-circle-outline del_bank");
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
									div_card).appendTo("#card2");
						});
			}
			function build_addresses_table(result) {
				$("#card2").empty();
				var addresses = result.extend.pageInfo.list;
				$
						.each(
								addresses,
								function(index, item) {
									var img_1 = $("<img></img>")
											.addClass("card-img-top")
											.attr("src",
													"${APP_PATH }/model/images/note/address.png")
											.attr("alt", "Card image cap");
									var urlNameH5 = $("<h5></h5>").addClass(
											"text-sm-center mt-2 mb-1").append(
											item.noteName);
									var a_1 = $("<i></i>").addClass(
											"mdi_in mdi mdi-lead-pencil update_address");
									a_1.attr("edit-id", item.id);
									var a_2 = $("<i></i>")
											.addClass(
													"mdi_in mdi mdi-close-circle-outline del_address");
									a_2.attr("del-id", item.id).attr(
											"del-name", item.noteName);
									var div_1 = $("<div></div>").attr("style",
											"background-color:#0a6353;")
											.addClass(
													"card-text text-sm-center")
											.append(a_1).append(a_2);
									var div_card = $("<div></div>").addClass(
											"card").append(img_1).append(
											urlNameH5).append(div_1);

									$("<div></div>").addClass("col-md-4").attr(
											"style", "margin-top:40px").append(
											img_1).append(div_card).appendTo(
											"#card2");
								});
			}
			function build_urls_table(result) {
				$("#card1").empty();
				var urls = result.extend.pageInfo.list;
				$.each(urls, function(index, item) {

					var img_1 = $("<img></img>").addClass("card-img-top").attr(
							"src", "${APP_PATH }/model/images/url/url2.png")
							.attr("alt", "Card image cap");
					var urlNameH5 = $("<h5></h5>").addClass(
							"text-sm-center mt-2 mb-1").append(item.urlName);

					var a_1 = $("<i></i>").addClass(
							"mdi_in mdi mdi-lead-pencil update_url");
					a_1.attr("edit-id", item.urlId);
					var a_2 = $("<i></i>").addClass(
							"mdi_in mdi mdi-close-circle-outline del_url");
					a_2.attr("del-id", item.urlId).attr("del-name",
							item.urlName);
					var a_3 = $("<a></a>").attr(
							"href",
							"${APP_PATH }/urlLogin?id=" + item.urlId)
							.append(
									$("<i></i>")
											.addClass("mdi_in mdi mdi-edge"));
					var div_2 = $("<div></div>").attr("style",
							"background-color:#95d3f2;").addClass(
							"card-text text-sm-center").append(a_1).append(a_2)
							.append(a_3);

					var div_card = $("<div></div>").addClass("card").append(
							img_1).append(urlNameH5).append(div_2);

					$("<div></div>").addClass("col-md-4").attr("style",
							"margin-top:40px").append(div_card).appendTo(
							"#card1");
				});
			}
			</script>
			<!-- 删除操作 -->
			<script type="text/javascript">
			$(document).on("click", ".del_url", function() {
				var urlId = $(this).attr("del-id");
				var urlName = $(this).attr("del-name");
				//alert($(this).parents("tr").find("td:eq(1)").text());
				if (confirm("确认删除【" + urlName + "】吗？")) {
					//确认，发送ajax请求删除即可
					$.ajax({
						url : "${APP_PATH}/url/" + urlId,
						type : "DELETE",
						success : function(result) {
							alert(result.msg);
							window.location.reload();
						}
					});
				}

			});
			$(document).on("click", ".del_db", function() {
				var id = $(this).attr("del-id");
				var dbuser = $(this).attr("del-name");
				//alert($(this).parents("tr").find("td:eq(1)").text());
				if (confirm("确认删除【" + dbuser + "】吗？")) {
					//确认，发送ajax请求删除即可
					$.ajax({
						url : "${APP_PATH}/datebase/" + id,
						type : "DELETE",
						success : function(result) {
							alert(result.msg);
							window.location.reload();
						}
					});
				}

			});
			$(document).on("click", ".del_bank", function() {
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
							window.location.reload();
						}
					});
				}

			});
			$(document).on("click", ".del_address", function() {
				var id = $(this).attr("del-id");
				var noteName = $(this).attr("del-name");
				//alert($(this).parents("tr").find("td:eq(1)").text());
				if (confirm("确认删除【" + noteName + "】吗？")) {
					//确认，发送ajax请求删除即可
					$.ajax({
						url : "${APP_PATH}/address/" + id,
						type : "DELETE",
						success : function(result) {
							alert(result.msg);
							window.location.reload();
						}
					});
				}

			});
			$(document).on("click", ".del_wifi", function() {
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
							window.location.reload();
						}
					});
				}

			});

			</script>
			<!-- 修改操作 -->
			<script type="text/javascript">
			$(document).on("click", ".update_url", function() {
				getUrl($(this).attr("edit-id"));
				//3、把员工的id传递给模态框的更新按钮
				$("#url_update_btn").attr("edit-id", $(this).attr("edit-id"));
				$("#urlUpdateModal").modal({
					backdrop : "static"
				});
			});

			function getUrl(id) {
				$
						.ajax({
							url : "${APP_PATH}/url/" + id,
							type : "GET",
							success : function(result) {
								var urlData = result.extend.url;
								$("#urlName_update_input").val(urlData.urlName);
								$("#url_update_input").val(urlData.url);
								$("#urlUser_update_input").val(urlData.urlUser);
								$("#urlPassword_update_input").val(
										urlData.urlPassword);
								$("#urlMassage_update_input").val(
										urlData.urlMassage);

							}
						});
			}
			$("#url_update_btn").click(function() {
				$.ajax({
					url : "${APP_PATH}/url/" + $(this).attr("edit-id"),
					type : "PUT",
					data : $("#urlUpdateModal form").serialize(),
					success : function(result) {
						$("#urlUpdateModal").modal('hide');
						alert(result.msg);
						//2、回到页面
						window.location.reload();

					}
				});
			});
			
			$(document).on("click", ".update_wifi", function() {
				getWifi($(this).attr("edit-id"));
				//3、把员工的id传递给模态框的更新按钮
				$("#wifi_update_btn").attr("edit-id", $(this).attr("edit-id"));
				$("#wifiUpdateModal").modal({
					backdrop : "static"
				});
			});

			function getWifi(id) {
				$.ajax({
					url : "${APP_PATH}/wifi/" + id,
					type : "GET",
					success : function(result) {
						var wifiDate = result.extend.wifi;
						$("#wifi_name_update_input").val(wifiDate.noteName);
						$("#wifeName_update_input").val(wifiDate.wifeName);
						$("#wifePassword_update_input").val(
								wifiDate.wifePassword);
						$("#wifi_safeNote_update_input").val(wifiDate.safeNote);

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
						window.location.reload();

					}
				});
			});

			
			$(document).on(
					"click",
					".update_db",
					function() {
						getDatebase($(this).attr("edit-id"));
						//3、把员工的id传递给模态框的更新按钮
						$("#datebase_update_btn").attr("edit-id",
								$(this).attr("edit-id"));
						$("#datebaseUpdateModal").modal({
							backdrop : "static"
						});
					});

			function getDatebase(id) {
				$.ajax({
					url : "${APP_PATH}/datebase/" + id,
					type : "GET",
					success : function(result) {
						var datebaseData = result.extend.datebase;
						$("#db_name_update_input").val(datebaseData.noteName);
						$("#type_update_input").val(datebaseData.type);
						$("#hostname_update_input").val(datebaseData.hostname);
						$("#port_update_input").val(datebaseData.port);
						$("#datebase_update_input").val(datebaseData.datebase);
						$("#dbuser_update_input").val(datebaseData.dbuser);
						$("#dbpassword_update_input").val(
								datebaseData.dbpassword);
						$("#db_safenote_update_input").val(datebaseData.safeNote);

					}
				});
			}
			$("#datebase_update_btn").click(function() {
				$.ajax({
					url : "${APP_PATH}/datebase/" + $(this).attr("edit-id"),
					type : "PUT",
					data : $("#datebaseUpdateModal form").serialize(),
					success : function(result) {
						$("#datebaseUpdateModal").modal('hide');
						alert(result.msg);
						window.location.reload();

					}
				});
			});
			$(document).on(
					"click",
					".update_address",
					function() {
						getAddress($(this).attr("edit-id"));
						//3、把员工的id传递给模态框的更新按钮
						$("#address_update_btn").attr("edit-id",
								$(this).attr("edit-id"));
						$("#addressUpdateModal").modal({
							backdrop : "static"
						});
					});

			function getAddress(id) {
				$
						.ajax({
							url : "${APP_PATH}/address/" + id,
							type : "GET",
							success : function(result) {
								var addressDate = result.extend.address;
								$("#address_noteName_update_input").val(
										addressDate.noteName);
								$("#address_name_update_input").val(addressDate.name);
								$("#addressUpdateModal input[name=sex]").val(
										[ addressDate.sex ]);
								$("#birthday_update_input").val(
										addressDate.birhday);
								$("#address1_update_input").val(
										addressDate.address1);
								$("#address2_update_input").val(
										addressDate.address2);
								$("#address3_update_input").val(
										addressDate.address3);
								$("#telephone_update_input").val(
										addressDate.telephone);
								$("#address_safenote_update_input").val(
										addressDate.safeNote);

							}
						});
			}
			$("#address_update_btn").click(function() {
				$.ajax({
					url : "${APP_PATH}/address/" + $(this).attr("edit-id"),
					type : "PUT",
					data : $("#addressUpdateModal form").serialize(),
					success : function(result) {
						$("#addressUpdateModal").modal('hide');
						alert(result.msg);
						window.location.reload();

					}
				});
			});
			$(document).on(
					"click",
					".update_bank",
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
						$("#bank_name_update_input").val(bankDate.noteName);
						$("#bankName_update_input").val(bankDate.bankName);
						$("#cardType_update_input").val(bankDate.cardType);
						$("#cardNumber1_update_input").val(bankDate.cardNumber1);
						$("#cardPassword1_update_input").val(bankDate.cardPassword1);
						$("#cardNumber2_update_input").val(bankDate.cardNumber2);
						$("#cardPassword2_update_input").val(bankDate.cardPassword2);
						$("#cardNumber3_update_input").val(bankDate.cardNumber3);
						$("#cardPassword3_update_input").val(bankDate.cardPassword3);
						$("#bankTelephone_update_input").val(bankDate.bankTelephone);
						$("#bank_safenote_update_input").val(bankDate.safeNote);

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
						window.location.reload();

					}
				});
			});


			</script>
			<!-- 添加操作 -->
			<script type="text/javascript">
			function reset_form(ele) {
				$(ele)[0].reset();
				//清空表单样式
				$(ele).find("*").removeClass("has-error has-success");
				$(ele).find(".help-block").text("");
			}
			$("#url_add_btn").click(function() {
				//清除表单数据(表单完整重置(数据、样式))
				reset_form("#urlAddModal form");

				//发送ajax请求，查出部门信息，显示在下拉列表中
				//getDepts("#empAddModal select");

				//弹出模态框
				$("#urlAddModal").modal({
					backdrop : "static"
				});
			});
			$("#url_save_btn").click(function() {

				$.ajax({
					url : "${APP_PATH}/url",
					type : "POST",
					data : $("#urlAddModal form").serialize(),
					success : function(result) {
						alert(result.msg);
						if (result.code == 100) {
							//员工保存成功
							//1、关闭模态框
							$("#urlAddModal").modal('hide');
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