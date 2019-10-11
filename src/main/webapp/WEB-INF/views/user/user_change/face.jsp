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

<link rel="stylesheet"
	href="${APP_PATH }/model/upface/css/cropper.min.css">
<link rel="stylesheet"
	href="${APP_PATH }/model/upface/css/ImgCropping.css">


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

<style>
.str {
	width: 150px;
	height: 150px;
	margin: 10px auto 50px auto;
}
</style>

<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="${APP_PATH }/model/upface/js/cropper.min.js"></script>

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
									<div style="text-align: center;margin:0 auto;
									border: 1px dashed #D0D0D0; width:200px">
									<label title="上传图片" for="chooseImg" class="l-btn choose-btn">
										<input type="file" accept="image/jpg,image/jpeg,image/png"
										name="file" id="chooseImg" class="hidden"
										onchange="selectImg(this)"> 修改头像
									</label>
									<div class="str">
										<img id="finalImg" src="" width="100%">
									</div>
									</div>

									<!--图片裁剪框 start-->
									<div style="display: none" class="tailoring-container">
										<div class="black-cloth" onclick="closeTailor(this)"></div>
										<div class="tailoring-content">
											<div class="tailoring-content-one">

												<div class="close-tailoring" onclick="closeTailor(this)">×</div>
											</div>

											<div class="tailoring-content-two">
												<div class="tailoring-box-parcel">
													<img id="tailoringImg">
												</div>
												<div class="preview-box-parcel">
													<p>图片预览：</p>
													<div class="square previewImg"></div>
													<!--  <div class="circular previewImg"></div>-->
												</div>
											</div>

											<div class="tailoring-content-three">
												<button class="l-btn cropper-reset-btn">复位</button>
												<button class="l-btn cropper-rotate-btn">旋转</button>
												<button class="l-btn cropper-scaleX-btn">换向</button>
												<button class="l-btn sureCut" id="sureCut">确定</button>
											</div>
										</div>
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
						$("#finalImg").attr("src","${APP_PATH }/model/images/faces/"+userDate.pic);
					}
				});
			}
		</script>
		
		<!--图片裁剪框 end-->
 
        <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
        <script src="${APP_PATH }/model/upface/js/cropper.min.js"></script>
           <script type="text/javascript">  
    //弹出框水平垂直居中  
    (window.onresize = function() {  
        var win_height = $(window).height();  
        var win_width = $(window).width();  
        if (win_width <= 768) {  
            $(".tailoring-content").css(  
                    {  
                        "top" : (win_height - $(".tailoring-content")  
                                .outerHeight()) / 2,  
                        "left" : 0  
                    });  
        } else {  
            $(".tailoring-content").css(  
                    {  
                        "top" : (win_height - $(".tailoring-content")  
                                .outerHeight()) / 2,  
                        "left" : (win_width - $(".tailoring-content")  
                                .outerWidth()) / 2  
                    });  
        }  
    })();  
      
    // 选择文件触发事件  
    function selectImg(file) {  
        //文件为空，返回  
        if (!file.files || !file.files[0]) {  
            return;  
        }  
        $(".tailoring-container").toggle();  
        var reader = new FileReader();  
        reader.onload = function(evt) {  
            var replaceSrc = evt.target.result;  
            // 更换cropper的图片  
            $('#tailoringImg').cropper('replace', replaceSrc, false);// 默认false，适应高度，不失真  
        }  
        reader.readAsDataURL(file.files[0]);  
    }  
    // cropper图片裁剪  
    $('#tailoringImg').cropper({  
        aspectRatio : 1 / 1,
        preview : '.previewImg',// 预览视图  
        guides : false, // 裁剪框的虚线(九宫格)  
        autoCropArea : 0.5, // 0-1之间的数值，定义自动剪裁区域的大小，默认0.8  
        movable : false, // 是否允许移动图片  
        dragCrop : true, // 是否允许移除当前的剪裁框，并通过拖动来新建一个剪裁框区域  
        movable : true, // 是否允许移动剪裁框  
        resizable : true, // 是否允许改变裁剪框的大小  
        zoomable : false, // 是否允许缩放图片大小  
        mouseWheelZoom : false, // 是否允许通过鼠标滚轮来缩放图片  
        touchDragZoom : true, // 是否允许通过触摸移动来缩放图片  
        rotatable : true, // 是否允许旋转图片  
        crop : function(e) {  
            // 输出结果数据裁剪图像。  
        }  
    });  
    // 旋转  
    $(".cropper-rotate-btn").on("click", function() {  
        $('#tailoringImg').cropper("rotate", 45);  
    });  
    // 复位  
    $(".cropper-reset-btn").on("click", function() {  
        $('#tailoringImg').cropper("reset");  
    });  
    // 换向  
    var flagX = true;  
    $(".cropper-scaleX-btn").on("click", function() {  
        if (flagX) {  
            $('#tailoringImg').cropper("scaleX", -1);  
            flagX = false;  
        } else {  
            $('#tailoringImg').cropper("scaleX", 1);  
            flagX = true;  
        }  
        flagX != flagX;  
    });  

    // 确定按钮点击事件  
    $("#sureCut").on("click", function() {  
        if ($("#tailoringImg").attr("src") == null) {  
            return false;  
        } else {  
            var cas = $('#tailoringImg').cropper('getCroppedCanvas');// 获取被裁剪后的canvas  
            var base64 = cas.toDataURL('image/jpeg'); // 转换为base64  
      
                $("#finalImg").prop("src", base64);// 显示图片  
            uploadFile(encodeURIComponent(base64))//编码后上传服务器  
            closeTailor();// 关闭裁剪框  
            }  
        });  
      
        // 关闭裁剪框  
        function closeTailor() {  
            $(".tailoring-container").toggle();  
        }  
      
        
        //ajax请求上传  
        function uploadFile(file) { 
            $.ajax({  
                url : '${APP_PATH}/upload',  
                type : 'POST',  
                data : "file=" + file,  
                async : true,  
                success : function(result) {  
                    alert(result.msg);  
                    window.location.reload();
                    window.location.href = "${APP_PATH }/jump/logout.php";
                }  
            });  
        }  
    </script>

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
</body>
</html>