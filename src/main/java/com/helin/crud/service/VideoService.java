package com.helin.crud.service;

import java.util.List;
import com.helin.crud.bean.Camera;
import com.helin.crud.bean.User;
import com.helin.crud.bean.Video;

public interface VideoService {

	public List<Video> getAll();
	
	public void saveVideo(Video video);

	public Video getVideo(Integer id);

	public void update(Video video);

	public void deleteVideo(Integer id);

	public void deleteBatch(List<Integer> ids);

	public List<Video> findVideoByCId(Integer cameraId);

//	public Video getVideoByCId(Integer cameraId);
}
