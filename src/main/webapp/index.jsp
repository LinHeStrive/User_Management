<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${APP_PATH }/model/jquery-3.2.1.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="${APP_PATH }/model/dist/distpicker.js"></script>
</head>
<body>
	<div id="distpicker1">
		<select></select> <select></select> <select></select>
	</div>
	<script type="text/javascript">
	$("#distpicker1").distpicker();
	</script>
</body>
</html>