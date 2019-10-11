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
<title>账户设置</title>

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
	color: #b66dff;
}

h4 {
	font-color: #b66dff;
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
					<div class="row">
						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<div class="btn-group" role="group" aria-label="Basic example"
										style="text-align: center; margin: 0 auto;">
										<button onclick="jump1()" type="button"
											class="btn btn-outline-primary btn-fw">个人信息修改</button>
										<button onclick="jump2()" type="button"
											class="btn btn-outline-primary btn-fw">密码修改</button>
										<button onclick="jump3()" type="button"
											class="btn btn-outline-primary btn-fw">头像修改</button>
										<button onclick="jump4()" type="button"
											class="btn btn-outline-primary btn-fw">手机号修改</button>
									</div>
									<p class="card-description"></p>
									<form class="forms-sample">
										<div class="form-group">

											<div class="input-group col-xs-12">
												<b> 旧手机号 :</b> &nbsp;&nbsp;
												<p class="form-control-static" id="phone_old_static"></p>
												</span>
											</div>
										</div>
										<div class="form-group">
											<label for="phone_update_input">新手机号：</label> <input
												type="text" name="email" class="form-control"
												id="phone_update_input"><span
									class="help-block"></span>
										</div>
									</form>
									<div style="text-align: right;">
										<button id="user_update_btn" type="submit"
											class="btn btn-gradient-primary">修改</button>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="btn btn-light"
											href="../Login.jsp">取消</a>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
				<jsp:include page="../same/same_footer.jsp"></jsp:include>
			</div>
		</div>

		<script type="text/javascript">
			function jump1() {

				window.location.replace("${APP_PATH }/jump/user.php");
			}
			function jump2() {
				window.location.replace("${APP_PATH }/jump/password.php");
			}
			function jump3() {
				window.location.replace("${APP_PATH }/jump/face.php");
			}
			function jump4() {
				window.location.replace("${APP_PATH }/jump/phone.php");
			}
		</script>
		<script type="text/javascript">
		 var id = '<%=session.getAttribute("id")%>';
			$(function() {
				getUser(id);

			});
			function getUser(id) {
				$.ajax({
					url : "${APP_PATH}/user/" + id,
					type : "GET",
					success : function(result) {
						var userDate = result.extend.user;
						$("#phone_old_static").text(userDate.phone);
					}
				});
			}
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
			$("#user_update_btn").click(function() {
				var phone = $("#phone_update_input").val();
				$.ajax({
					url : "${APP_PATH}/phone",
					type : "PUT",
					data : "phone="+phone,
					success : function(result) {
						alert(result.msg);
						window.location.href = "${APP_PATH }/jump/logout.php";

					}
				});
			});
		</script>
</body>
</html>