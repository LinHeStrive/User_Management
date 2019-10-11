<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>群发系统通知</title>
<link rel="stylesheet"
	href="${APP_PATH }/model/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="${APP_PATH }/model/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="${APP_PATH }/model/css/style.css">
<link rel="stylesheet" href="${APP_PATH }/model/css/boot.css">
<link rel="shortcut icon" href="${APP_PATH }/model/images/favicon.png" />
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
		<jsp:include page="../same/same_top.jsp"></jsp:include>
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="../same/same_side.jsp"></jsp:include>
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="content">
						<div class="card">
							<div class="card-body">
								<div class="col-md-6">
									<div class="form-group">
										<label for="title_input">标题</label> <input type="text"
											class="form-control" name="title" id="title_input"> <span
											class="help-block"></span>
									</div>
									<div class="form-group ">
										<label for="setitle_input">副标题</label> <input type="text"
											class="form-control" name="setitle" id="setitle_input">
										<span class="help-block"></span>
									</div>
									<script id="editor" type="text/plain"
										style="width: 800px; height: 400px; margin: 0 auto;"></script>
									<div>
										<button onclick="getContentTxt()"
											class="btn btn-gradient-primary btn-md"
											style="margin-top: 10px; margin-left: 700px;"id="user_update_btn">发送</button>
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
		//实例化编辑器
		//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
		var ue = UE.getEditor('editor');

		$("#user_update_btn").click(function() {
			var title = document.getElementById("title_input").value;
			var setitle = document.getElementById("setitle_input").value;
			var content = ue.getContent();
			console.log("content:" + content);
			$.ajax({
				type : "POST",
				url : "${APP_PATH }/note",
				data : {
					"title" : title,
					"Content" : content,
					"setitle" : setitle
				},
				success : function(result) {
					alert(result.msg);
				},
				error : function(result) {
					alert(result.msg);
				}
			});
		})
	</script>
</body>
</html>
