<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
        
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span class="menu-title"></span>
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="${APP_PATH }/jump/user_manage.php">
              <span class="menu-title">用户管理</span>
              <i class="mdi mdi-account menu-icon"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${APP_PATH }/jump/massage.php">
              <span class="menu-title">消息发送</span>
              <i class="mdi mdi-tooltip-text menu-icon"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${APP_PATH }/jump/camera_manage.php">
              <span class="menu-title">摄像机管理</span>
              <i class="mdi mdi-raspberrypi menu-icon"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${APP_PATH }/jump/video.php">
              <span class="menu-title">存储管理</span>
              <i class="mdi mdi-briefcase menu-icon"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${APP_PATH }/jump/pwd_change.php">
              <span class="menu-title">修改密码</span>
              <i class="mdi mdi-wrench menu-icon"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span class="menu-title"></span>
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span class="menu-title"></span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span class="menu-title"></span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span class="menu-title"></span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${APP_PATH }/jump/logout.php">
              <span class="menu-title">退出登录</span>
              <i class="mdi mdi-arrow-right menu-icon"></i>
            </a>
          </li>
          
        </ul>
      </nav>
</body>
</html>