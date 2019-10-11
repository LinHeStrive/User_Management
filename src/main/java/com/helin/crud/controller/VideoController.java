package com.helin.crud.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.helin.crud.bean.Msg;
import com.helin.crud.bean.Video;
import com.helin.crud.service.VideoService;

@Controller
public class VideoController {

	@Autowired
	VideoService videoService;
	//±È¿˙À˘”–
		@RequestMapping(value="/videos",method=RequestMethod.GET)
		@ResponseBody
		public Msg getVideo(@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session) {
			PageHelper.startPage(pn, 10);
			List<Video> videos = videoService.getAll();
			PageInfo page = new PageInfo(videos, 10);
			return Msg.success().add("pageInfo", page);
		}
}
