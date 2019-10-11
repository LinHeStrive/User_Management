package com.helin.crud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.helin.crud.bean.User;
import com.helin.crud.bean.Video;
import com.helin.crud.bean.VideoExample;
import com.helin.crud.bean.VideoExample.Criteria;
import com.helin.crud.dao.VideoMapper;
import com.helin.crud.service.VideoService;

@Service
public class VideoServiceImpl implements VideoService {

	@Autowired
	VideoMapper videoMapper;
	
	@Override
	public List<Video> getAll() {
		return videoMapper.selectByExample(null);
	}
	
	@Override
	public void saveVideo(Video video) {
		videoMapper.insertSelective(video);

	}

//	@Override
//	public Video getCameraByCId(Integer cameraId) {
//		Camera camera = cameraMapper.selectByCameraId(cameraId);
//		return camera;
//	}
	
	@Override
	public Video getVideo(Integer id) {
		Video video = videoMapper.selectByPrimaryKey(id);
		return video;
	}

	@Override
	public void update(Video video) {
		videoMapper.updateByPrimaryKeySelective(video);

	}

	@Override
	public void deleteVideo(Integer id) {
		videoMapper.deleteByPrimaryKey(id);

	}

	@Override
	public void deleteBatch(List<Integer> ids) {
		VideoExample example = new VideoExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdIn(ids);
		videoMapper.deleteByExample(example);

	}

	@Override
	public List<Video> findVideoByCId(Integer cameraId) {
		// TODO Auto-generated method stub
		return videoMapper.selectByCId(cameraId);
	}

}
