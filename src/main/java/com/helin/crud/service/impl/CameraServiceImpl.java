package com.helin.crud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.helin.crud.bean.Camera;
import com.helin.crud.bean.CameraExample;
import com.helin.crud.bean.CameraExample.Criteria;
import com.helin.crud.bean.User;
import com.helin.crud.dao.CameraMapper;
import com.helin.crud.service.CameraService;

@Service
public class CameraServiceImpl implements CameraService {

	@Autowired
	CameraMapper cameraMapper;
	
	@Override
	public List<Camera> getAll() {
		return cameraMapper.selectByExample(null);
	}
	
	@Override
	public void saveCamera(Camera camera) {
		cameraMapper.insertSelective(camera);

	}

	@Override
	public Camera getCameraByCId(Integer cameraId) {
		Camera camera = cameraMapper.selectByCameraId(cameraId);
		return camera;
	}
	
	@Override
	public Camera getCamera(Integer id) {
		Camera camera = cameraMapper.selectByPrimaryKey(id);
		return camera;
	}

	@Override
	public void update(Camera camera) {
		cameraMapper.updateByPrimaryKeySelective(camera);

	}

	@Override
	public void deleteCamera(Integer id) {
		cameraMapper.deleteByPrimaryKey(id);

	}

	@Override
	public void deleteBatch(List<Integer> ids) {
		CameraExample example = new CameraExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdIn(ids);
		cameraMapper.deleteByExample(example);

	}

	@Override
	public List<Camera> findCamByMs(Integer cameraId, String position, String angle, String picQuality) {
		// TODO Auto-generated method stub
		return cameraMapper.selectByMs(cameraId,position,angle,picQuality);
	}

}
