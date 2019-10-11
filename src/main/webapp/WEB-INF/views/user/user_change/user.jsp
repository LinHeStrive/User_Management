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
<script type="text/javascript" charset="utf-8" src="${APP_PATH }/model/laydate/laydate.js" ></script>
<script charset="utf-8" type="text/javascript" >
	laydate.render({
		elem: '#birthday_update_input' //指定元素
	});
</script>
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
									<div class="btn-group" role="group" aria-label="Basic example" style="text-align:center;margin:0 auto;">
										<button onclick="jump1()" type="button" class="btn btn-outline-primary btn-fw">个人信息修改</button>
										<button onclick="jump2()" type="button" class="btn btn-outline-primary btn-fw">密码修改</button>
										<button onclick="jump3()" type="button" class="btn btn-outline-primary btn-fw">头像修改</button>
										<button onclick="jump4()" type="button" class="btn btn-outline-primary btn-fw">手机号修改</button>
									</div>
									<p class="card-description"></p>
									<form class="forms-sample">
										<div class="form-group">
											<label for="username_update_input">用户名：</label> <input
												type="text" name="username" class="form-control"
												id="username_update_input" placeholder="Name">
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
											<label for="bNum_update_input">楼号：</label> <input
												type="text" name="bNum" class="form-control"
												id="bNum_update_input" placeholder="X号楼X单元XX号">
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
		function jump1(){
			
			 window.location.replace("${APP_PATH }/jump/user.php");
		}
		function jump2(){
			 window.location.replace("${APP_PATH }/jump/password.php");
		}
		function jump3(){
			 window.location.replace("${APP_PATH }/jump/face.php");
		}
		function jump4(){
			 window.location.replace("${APP_PATH }/jump/phone.php");
		}
			/**
			   <div data-toggle="distpicker">
			<select data-province="浙江省"></select>
			<select data-city="杭州市"></select>
			<select data-district="西湖区"></select>
			</div>
			 **/
			//$("#distpicker").distpicker({});
			 var id = '<%=session.getAttribute("id")%>';
			$(function() {
				
				
				//alert(id);
				getUser(id);

			});
			function getUser(id) {
				$.ajax({
					url : "${APP_PATH}/user/" + id,
					type : "GET",
					success : function(result) {
						var userDate = result.extend.user;
						$("#username_update_input").val(userDate.username);
						$("#card-body input[name=sex]").val([ userDate.sex ]);
						$("#bNum_update_input").val(userDate.bNum);
						
						
						
						/**
						var province = userDate.province;
						$("#province").attr('data-province',userDate.province);
						$("#city").attr('data-city',userDate.city);
						$("#country").attr('data-district',userDate.country);
						 **/
					}
				});
			}
			$("#user_update_btn").click(function() {
				$.ajax({
					url : "${APP_PATH}/user/" + id,
					type : "PUT",
					data : $("form").serialize(),
					success : function(result) {
						alert(result.msg);
						window.location.href = "${APP_PATH }/jump/logout.php";

					}
				});
			});
		</script>
<script src="${APP_PATH }/model/jquery-3.2.1.js"></script>

</body>
</html>