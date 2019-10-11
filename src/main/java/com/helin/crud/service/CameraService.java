package com.helin.crud.service;

import java.util.List;
import com.helin.crud.bean.Camera;
import com.helin.crud.bean.User;

public interface CameraService {

	public List<Camera> getAll();
	
	public void saveCamera(Camera camera);

	public Camera getCamera(Integer id);

	public void update(Camera camera);

	public void deleteCamera(Integer id);

	public void deleteBatch(List<Integer> ids);

	public Camera getCameraByCId(Integer cameraId);

	public List<Camera> findCamByMs(Integer cameraId, String position, String angle, String picQuality);
}
