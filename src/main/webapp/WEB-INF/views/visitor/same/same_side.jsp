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
          <li class="nav-item nav-profile">
            <a href="#" class="nav-link">
              <div class="nav-profile-image">
                <img src="${APP_PATH }/model/images/faces/face1.jpg" alt="profile">
                <span class="login-status online"></span> <!--change to offline or busy as needed-->              
              </div>
              <div class="nav-profile-text d-flex flex-column">
                <span id="user" class="font-weight-bold mb-2">访客</span>
              </div>
              <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${APP_PATH}/jump/visitor_show.php">
              <span class="menu-title">主页</span>
              <i class="mdi mdi-home menu-icon"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic1" aria-expanded="false" aria-controls="ui-basic">
              <span class="menu-title">新闻发布</span>
              <i class="menu-arrow"></i>
              <i class="mdi mdi-book-open menu-icon"></i>
            </a>
            <div class="collapse" id="ui-basic1">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="#">国家新闻</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">本市新闻</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">社区新闻</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic2" aria-expanded="false" aria-controls="ui-basic">
              <span class="menu-title">周边信息</span>
              <i class="menu-arrow"></i>
              <i class="mdi mdi mdi-map-marker-multiple menu-icon"></i>
            </a>
            <div class="collapse" id="ui-basic2">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="#">周边概览</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">交通情况</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic3" aria-expanded="false" aria-controls="ui-basic">
              <span class="menu-title">生活服务</span>
              <i class="menu-arrow"></i>
              <i class="mdi mdi mdi-basket menu-icon"></i>
            </a>
            <div class="collapse" id="ui-basic3">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="#">特价商品</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">网上缴费</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic4" aria-expanded="false" aria-controls="ui-basic">
              <span class="menu-title">社区活动</span>
              <i class="menu-arrow"></i>
              <i class="mdi mdi mdi-sofa menu-icon"></i>
            </a>
            <div class="collapse" id="ui-basic4">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="#">娱乐活动</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">组织报名</a></li>
              </ul>
            </div>
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
        </ul>
      </nav>
</body>
</html>