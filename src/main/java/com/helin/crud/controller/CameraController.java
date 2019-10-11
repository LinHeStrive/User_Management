package com.helin.crud.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.helin.crud.bean.Camera;
import com.helin.crud.bean.Msg;
import com.helin.crud.service.CameraService;

@Controller
public class CameraController {

	@Autowired
	CameraService cameraService;
	
	//批量删除相机
	/**
	 * 单个批量二合一
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/camera/{ids}",method=RequestMethod.DELETE)
	public Msg deleteCamera(@PathVariable("ids") String ids) {
		if(ids.contains("-")) {
			List<Integer> del_ids = new ArrayList<>();
			String []str_ids = ids.split("-");
			for (String string : str_ids) {
				Integer cameraId = Integer.parseInt(string);
				Camera camera = cameraService.getCameraByCId(cameraId);
				Integer id = camera.getId();
				del_ids.add(id);
			}
			cameraService.deleteBatch(del_ids);
		}else {
			Integer cameraId = Integer.parseInt(ids);
			Camera camera = cameraService.getCameraByCId(cameraId);
			Integer id = camera.getId();
			System.out.println(id);
			cameraService.deleteCamera(id);
		}
		return Msg.success();
	}
	
	//添加相机信息
	@RequestMapping(value="/camera",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveCamera(Camera camera,HttpSession session) {
		cameraService.saveCamera(camera);;
		return Msg.success();
	}
	
	//修改相机信息
	@ResponseBody
	@RequestMapping(value="/camera/{id}",method=RequestMethod.PUT)
	public Msg updateCamera(Camera camera) {
		cameraService.update(camera);
		return Msg.success();
	}
	
	//查询单条记录
	@ResponseBody
	@RequestMapping(value="/camera/{id}",method=RequestMethod.GET)
	public Msg getCamera(@PathVariable("id")Integer id) {
		
		Camera camera = cameraService.getCamera(id);
		return Msg.success().add("camera", camera);
	}
	
	//遍历所有
	@RequestMapping(value="/cameras",method=RequestMethod.GET)
	@ResponseBody
	public Msg getCamera(@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session) {
		PageHelper.startPage(pn, 10);
		List<Camera> cameras = cameraService.getAll();
		PageInfo page = new PageInfo(cameras, 10);
		return Msg.success().add("pageInfo", page);
	}
}
