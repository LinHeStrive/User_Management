package com.helin.crud.dao;

import com.helin.crud.bean.Camera;
import com.helin.crud.bean.CameraExample;
import com.helin.crud.bean.User;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CameraMapper {
    long countByExample(CameraExample example);

    int deleteByExample(CameraExample example);

    int deleteByPrimaryKey(Integer id);
    
    int deleteByCameraId(Integer id);

    int insert(Camera record);

    int insertSelective(Camera record);

    List<Camera> selectByExample(CameraExample example);

    Camera selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Camera record, @Param("example") CameraExample example);

    int updateByExample(@Param("record") Camera record, @Param("example") CameraExample example);

    int updateByPrimaryKeySelective(Camera record);

    int updateByPrimaryKey(Camera record);

	Camera selectByCameraId(Integer cameraId);

	List<Camera> selectByMs(@Param("camera_id")Integer cameraId, @Param("position")String position, @Param("angle")String angle, @Param("pic_quality")String picQuality);
}