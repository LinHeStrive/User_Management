package com.helin.crud.bean;

public class Camera {
    private Integer id;

    private Integer cameraId;

    private String position;

    private String picQuality;

    private String angle;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCameraId() {
        return cameraId;
    }

    public void setCameraId(Integer cameraId) {
        this.cameraId = cameraId;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position == null ? null : position.trim();
    }

    public String getPicQuality() {
        return picQuality;
    }

    public void setPicQuality(String picQuality) {
        this.picQuality = picQuality == null ? null : picQuality.trim();
    }

    public String getAngle() {
        return angle;
    }

    public void setAngle(String angle) {
        this.angle = angle == null ? null : angle.trim();
    }
}