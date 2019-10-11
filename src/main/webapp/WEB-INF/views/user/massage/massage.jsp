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
<title>系统消息</title>
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
				
				    <div class="modal fade" id="massagereadModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document" id="HelpUpdateModal">
							<div class="modal-content"
								style="border-color: #dfc2ff; height: 525px;">

								<div class="modal-header" style="background-color: #dfc2ff">
									<h4 class="modal-title" style="color: #ffffff;">系统消息查看</h4>
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
													<div class="form-group" id="content">
														
													</div>


												</form>
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" id="close" class="btn btn-default btn-sm"
										data-dismiss="modal">关闭</button>
								</div>
							</div>
						</div>
					</div>
				    
					<div class="row" id="massage">
						
					</div>
				</div>
				<jsp:include page="../same/same_footer.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	/*<p>lorem ipsum dolor sit amet, consectetur mod tempor
										incididunt ut labore et dolore magna aliqua.</p>*/
	var totalRecord;
	var currentPage;
    $(function() {
    	to_page(1);
    	});

	function to_page(pn) {
		$.ajax({
			url : "${APP_PATH }/notes",
			data : "pn=" + pn,
			type : "GET",
			success : function(result) {
				build_massages_table(result);
				build_page_info(result);
				build_page_nav(result)
				}
			});
		}
	function build_massages_table(result) {
		$("#massage").empty();
		var massages = result.extend.pageInfo.list;
		$.each(massages,function(index, item) {
			var titleTd = $("<h4></h4>").addClass("card-title text-primary").append(item.title);
			var btn_del = $("<button></button>").addClass("btn btn-inverse-primary btn-rounded btn-icon").attr("title","删除").attr("type","button").append($("<i><i>").addClass("mdi mdi-delete").attr("del-id", item.id).attr("del-name",item.title));
			//btn_del.attr("del-id", item.id);
			var btn_read = $("<button></button>").addClass("btn btn-inverse-primary btn-rounded btn-icon").attr("type","button");
			if(item.state==1){
				btn_read.append($("<i><i>").addClass("mdi mdi-email").attr("read-id",item.id).attr("title","未读"));
			}
			if(item.state==0){
				btn_read.append($("<i><i>").addClass("mdi mdi-email-open").attr("read-id",item.id).attr("title","已读"));
			}
			var div_1 = $("<div></div>").attr("style","margin-left: 700px;").append(btn_del).append(" ").append(btn_read);
			var contentTd = $("<p></p>").append(item.setilte).append(div_1);
			var div_2 = $("<div></div>").addClass("card-body").append(titleTd).append(contentTd);
            $("<div></div>").addClass("col-md-12 grid-margin stretch-card").append($("<div></div>").addClass("card").append(div_2)).appendTo("#massage");
			});
		}
	function build_page_info(result) {
		$("#page_info_area").empty();
		$("#page_info_area").append("当前" + result.extend.pageInfo.pageNum + "页，总"
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
		var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
		var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
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

			var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
			var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href", "#"));
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
	//查看已读消息
	$(document).on("click", ".mdi-email-open", function() {
		//alert($(this).attr("read-id"));
		getMassages($(this).attr("read-id"));
		$("#massagereadModal").modal({
			backdrop : "static"
		});
	});
	

	function getMassages(id) {
		$.ajax({
			url : "${APP_PATH}/note/" + id,
			type : "GET",
			success : function(result) {
				$("#content").empty();
				var massageDate = result.extend.massage;
				$("#content").append(massageDate.content);
			}
		});
	}
	//查看未读消息
	$(document).on("click", ".mdi-email", function() {
		//alert($(this).attr("read-id"));
		getMassages($(this).attr("read-id"));
		$("#massagereadModal").modal({
			backdrop : "static"
		});
	});
	

	function getMassages(id) {
		$.ajax({
			url : "${APP_PATH}/note_close/" + id,
			type : "GET",
			success : function(result) {
				$("#content").empty();
				var massageDate = result.extend.massage;
				$("#content").append(massageDate.content);
			}
		});
	}
	$(document).on("click", ".mdi-delete", function() {
		var id = $(this).attr("del-id");
		var title = $(this).attr("del-name");
		//var noteName = $(this).attr("del-name");
		//alert($(this).parents("tr").find("td:eq(1)").text());
		if (confirm("确认删除【" + title + "】吗？")) {
			//确认，发送ajax请求删除即可
			$.ajax({
				url : "${APP_PATH}/note/" + id,
				type : "DELETE",
				success : function(result) {
					alert(result.msg);
					to_page(currentPage);
				}
			});
		}

	});
	$("#close").click(function(){
		window.location.reload();
	})


	</script>
	<!-- 查看消息内容 -->
	<script type="text/javascript">
	
	</script>
</body>
</html>