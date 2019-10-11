package com.helin.crud.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.helin.crud.bean.Camera;
import com.helin.crud.bean.User;
import com.helin.crud.bean.Video;
import com.helin.crud.service.CameraService;
import com.helin.crud.service.SelectService;
import com.helin.crud.service.UserService;
import com.helin.crud.service.VideoService;

@Controller
public class SelectController {
	
	@Autowired
	UserService userService;
	@Autowired
	CameraService cameraService;
	@Autowired
	VideoService videoService;
	@RequestMapping("/select_user")
	public String select_user(@RequestParam(defaultValue="1") Integer currentPage,
			HttpServletRequest request,Map<String,Object> map,HttpSession session,
			@RequestParam(value="name",required=false)String name,@RequestParam(value="username",required=false)String username,
			@RequestParam(value="sex",required=false)String sex,@RequestParam(value="bNum",required=false)String bNum) {
		PageHelper.startPage(currentPage,100);
		if(name.equals("")) {
			name=null;
		}
		if(username.equals("")) {
			username=null;
		}
		if(sex.equals("ÄÐ")) {
			sex ="1";
		}else if(sex.equals("Å®")){
			sex="0";
		}else {
			sex=null;
		}
		if(bNum.equals("")) {
			bNum=null;
		}
		System.out.println(name+username+sex+bNum);
		List<User> list1=userService.findUserByMs(name,username,sex,bNum);
		PageInfo<User> pageInfo1=new PageInfo<User>(list1,100);
		map.put("pageInfo1", pageInfo1);
		return "admin/user_select_info";
	}
	@RequestMapping("/select_camera")
	public String select_camera(@RequestParam(defaultValue="1") Integer currentPage,
			HttpServletRequest request,Map<String,Object> map,HttpSession session,
			@RequestParam(value="cameraId",required=false)Integer cameraId,@RequestParam(value="position",required=false)String position,
			@RequestParam(value="angle",required=false)String angle,@RequestParam(value="picQuality",required=false)String picQuality) {
		PageHelper.startPage(currentPage,100);
//		if(cameraId.equals("")) {
//			name=null;
//		}
		if(position.equals("")) {
			position=null;
		}
		if(angle.equals("")) {
			angle=null;
		}
		if(picQuality.equals("")) {
			picQuality=null;
		}
		//System.out.println(name+username+sex+bNum);
		List<Camera> list2=cameraService.findCamByMs(cameraId,position,angle,picQuality);
		PageInfo<Camera> pageInfo2=new PageInfo<Camera>(list2,100);
		map.put("pageInfo2", pageInfo2);
		return "admin/camera_select_info";
	}
	@RequestMapping("/select_video")
	public String select_video(@RequestParam(defaultValue="1") Integer currentPage,
			HttpServletRequest request,Map<String,Object> map,HttpSession session) {
		Integer cameraId = Integer.parseInt(request.getParameter("cameId"));
		PageHelper.startPage(currentPage,100);
		List<Video> list3=videoService.findVideoByCId(cameraId);
		PageInfo<Video> pageInfo3=new PageInfo<Video>(list3,100);
		map.put("pageInfo3", pageInfo3);
		return "admin/video_select_info";
	}
}
